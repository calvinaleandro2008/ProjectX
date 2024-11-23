from flask import Flask, render_template, request, redirect, url_for, session, flash
import secrets
import mysql.connector

app = Flask(__name__)
app.secret_key = secrets.token_hex(16)

# Koneksi ke database
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",  # Ganti dengan password MySQL Anda jika ada
    database="data-pegawai"
)

@app.route('/')
@app.route('/home')
def home():
    return render_template('home.html')

@app.route('/login', methods=["POST", "GET"])
def login():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]

        cursor = mydb.cursor(dictionary=True)
        query = "SELECT * FROM users WHERE username = %s AND password = MD5(%s)"
        cursor.execute(query, (username, password))
        user = cursor.fetchone()

        if user:
            session["user"] = user["username"]
            return redirect(url_for("tampil"))
        else:
            flash("Login gagal! Username atau password salah.")
            return render_template("login.html")

    return render_template("login.html")

@app.route('/logout')
def logout():
    session.pop('user', None)
    return redirect(url_for('home'))

@app.route('/tampil')
def tampil():
    if 'user' in session:
        cursor = mydb.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Data_pegawai")
        data = cursor.fetchall()
        cursor.close()
        return render_template('tampil.html', data=data)
    else:
        return redirect(url_for('login'))


@app.route('/tambah', methods=['GET', 'POST'])
def tambah():
    if 'user' in session:
        if request.method == 'POST':
            nama = request.form['nama']
            alamat = request.form['alamat']
            jabatan = request.form['jabatan']

            cursor = mydb.cursor()
            query = "INSERT INTO Data_pegawai (nama, alamat, jabatan) VALUES (%s, %s, %s)"
            cursor.execute(query, (nama, alamat, jabatan))
            mydb.commit()
            cursor.close()

            flash("Data pegawai berhasil ditambahkan.")
            return redirect(url_for('tampil'))
        return render_template('tambah.html')
    else:
        return redirect(url_for('login'))
    
@app.route('/about')
def about():
    return render_template("about.html")

@app.route('/update/<int:id>', methods=['GET', 'POST'])
def update(id):
    if 'user' in session:
        cursor = mydb.cursor(dictionary=True)
        if request.method == 'POST':
            nama = request.form['nama']
            alamat = request.form['alamat']
            jabatan = request.form['jabatan']

            query = "UPDATE Data_pegawai SET nama = %s, alamat = %s, jabatan = %s WHERE id = %s"
            cursor.execute(query, (nama, alamat, jabatan, id))
            mydb.commit()
            cursor.close()

            flash("Data pegawai berhasil diperbarui.")
            return redirect(url_for('tampil'))
        else:
            query = "SELECT * FROM Data_pegawai WHERE id = %s"
            cursor.execute(query, (id,))
            pegawai = cursor.fetchone()
            cursor.close()
            return render_template('update.html', pegawai=pegawai)
    else:
        return redirect(url_for('login'))

@app.route('/hapus/<int:id>')
def hapus(id):
    if 'user' in session:
        cursor = mydb.cursor()
        query = "DELETE FROM Data_pegawai WHERE id = %s"
        cursor.execute(query, (id,))
        mydb.commit()
        cursor.close()

        flash("Data pegawai berhasil dihapus.")
        return redirect(url_for('tampil'))
    else:
        return redirect(url_for('login'))
    
@app.route('/kontak', methods=["GET", "POST"])
def kontak():
    if request.method == "POST":
        # Proses pengiriman formulir (sama seperti sebelumnya)
        name = request.form['name']
        email = request.form['email']
        message = request.form['message']

        cursor = mydb.cursor()
        query = "INSERT INTO kontak_messages (name, email, message) VALUES (%s, %s, %s)"
        cursor.execute(query, (name, email, message))
        mydb.commit()
        cursor.close()

        flash("Pesan Anda telah terkirim. Terima kasih telah menghubungi kami!")

        return render_template('kontak.html', message_sent=True)
    
    return render_template('kontak.html')


if __name__ == '__main__':
    app.run(debug=True)
