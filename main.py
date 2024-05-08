import pyodbc
import flask
from flask_cors import CORS


#tạo chuỗi kết nối
connect_str = (
    "DRIVER={SQL Server};"
    "server=DESKTOP-T0SS1UU\SQLEXPRESS;"
    "database=QuanAo;"
    "Trusted_Connection=yes;"
)
try:
    conn = pyodbc.connect(connect_str)
    print("Thành công")
    app = flask.Flask(__name__)
    CORS(app, origins=['http://localhost:63342'])
    @app.route('/getallclothes',methods =['GET'])
    def getAllClothes():
        cursor = conn.cursor()
        sql = "Select * from tQuanAo"
        cursor.execute(sql)
        result = []
        keys = []
        for i in cursor.description:
            keys.append(i[0]) #lấy key
        for i in cursor.fetchall():
            result.append(dict(zip(keys,i)))
        resp = flask.jsonify(result)
        resp.status_code = 200
        return resp
    #get by id
    @app.route('/getclothesbyid/<id>', methods=['GET'])
    def getClothesbyID(id=1):
        cursor = conn.cursor()
        sql = 'select MaKH, TenKH, ChatLieu from tSach where MaSach = ?'
        data = id
        cursor.execute(sql,data)
        result = []
        keys = []
        for i in cursor.description:
            keys.append(i[0])  # lấy key
        for i in cursor.fetchall():
            result.append(dict(zip(keys, i)))
            resp = flask.jsonify(result)
            resp.status_code = 200
            return resp


    @app.route('/addclothes', methods=['POST'])
    def addClothes():
        data = flask.request.get_json()
        cursor = conn.cursor()
        sql = '''INSERT INTO tQuanAo (MaQuanAo, TenQuanAo, MaTheLoai, MaTH, DonGiaNhap, DonGiaBan, SoLuong, ChatLieu)
                         VALUES (?, ?, ?, ?, ?, ?, ?, ?)'''
        values = (
            data['MaQuanAo'], data['TenQuanAo'], data['MaTheLoai'], data['MaTH'],
            data['DonGiaNhap'], data['DonGiaBan'], data['SoLuong'], data['ChatLieu'])
        cursor.execute(sql, values)
        conn.commit()
        return flask.jsonify({"status": "success"}), 201


    @app.route('/updateclothes/<id>', methods=['PATCH'])
    def updateClothes(id):
        data = flask.request.get_json()
        cursor = conn.cursor()
        sql = '''UPDATE tQuanAo SET TenQuanAo = ?, MaTheLoai = ?, DonGiaBan = ? WHERE MaQuanAo = ?'''  # SQL update statement
        values = (
        data['TenQuanAo'], data['MaTheLoai'],
        data['DonGiaBan'], id)
        cursor.execute(sql, values)
        conn.commit()
        return flask.jsonify({"status": "success"}), 200



    @app.route('/deleteclothes/<id>', methods=['DELETE'])
    def deleteClothes(id):
        cursor = conn.cursor()
        sql = '''DELETE FROM tQuanAo WHERE MaQuanAo = ?'''
        cursor.execute(sql, id)
        conn.commit()  # commit the transaction
        return flask.jsonify({"status": "success"}), 200

    @app.route('/getallcustomers', methods=['GET'])
    def getAllCustomers():
        cursor = conn.cursor()
        sql = '''SELECT * FROM tKhachHang'''  # SQL select statement
        cursor.execute(sql)  # execute the SQL statement
        result = []
        keys = []
        for i in cursor.description:
            keys.append(i[0])  # get keys
        for i in cursor.fetchall():
            result.append(dict(zip(keys, i)))  # create dictionary for each row
        resp = flask.jsonify(result)  # convert result to JSON
        resp.status_code = 200  # set status code
        return resp  # return result


    @app.route('/updatecustomer/<id>', methods=['PUT'])
    def updateCustomer(id):
        data = flask.request.get_json()  # get data from PUT request
        cursor = conn.cursor()
        sql = '''UPDATE tKhachHang SET TenKH = ?, DiaChi = ?, DienThoai = ? WHERE MaKH = ?'''  # SQL update statement
        values = (data['TenKH'], data['DiaChi'], data['DienThoai'], id)  # values to update
        cursor.execute(sql, values)  # execute the SQL statement
        conn.commit()  # commit the transaction
        return flask.jsonify({"status": "success"}), 200  # return success status
    
    @app.route('/addcustomer', methods=['POST'])
    def addCustomer():
        data = flask.request.get_json()  # get data from POST request
        cursor = conn.cursor()
        sql = '''INSERT INTO tKhachHang (MaKH, TenKH, DiaChi, DienThoai)
                 VALUES (?, ?, ?, ?)'''  # SQL insert statement
        values = (data['MaKH'], data['TenKH'], data['DiaChi'], data['DienThoai'])  # values to insert
        cursor.execute(sql, values)  # execute the SQL statement
        conn.commit()  # commit the transaction
        return flask.jsonify({"status": "success"}), 201  # return success status

    @app.route('/deletecustomer/<id>', methods=['DELETE'])
    def deleteCustomer(id):
        cursor = conn.cursor()
        sql = '''DELETE FROM tKhachHang WHERE MaKH = ?'''  # SQL delete statement
        cursor.execute(sql, id)  # execute the SQL statement
        conn.commit()  # commit the transaction
        return flask.jsonify({"status": "success"}), 200  # return success status


    @app.route('/getcustomer/<id>', methods=['GET'])
    def getCustomer(id):
        cursor = conn.cursor()
        sql = '''SELECT * FROM tKhachHang WHERE MaKH = ?'''  # SQL select statement
        cursor.execute(sql, id)  # execute the SQL statement
        result = []
        keys = []
        for i in cursor.description:
            keys.append(i[0])  # get keys
        for i in cursor.fetchall():
            result.append(dict(zip(keys, i)))  # create dictionary for each row
        resp = flask.jsonify(result)  # convert result to JSON
        resp.status_code = 200  # set status code
        return resp  # return result


    @app.route('/getallstaff', methods=['GET'])
    def getAllStaff():
        cursor = conn.cursor()
        sql = '''SELECT * FROM tNhanVien'''  # SQL select statement
        cursor.execute(sql)  # execute the SQL statement
        result = []
        keys = []
        for i in cursor.description:
            keys.append(i[0])  # get keys
        for i in cursor.fetchall():
            result.append(dict(zip(keys, i)))  # create dictionary for each row
        resp = flask.jsonify(result)  # convert result to JSON
        resp.status_code = 200  # set status code
        return resp  # return result
    @app.route('/addstaff', methods=['POST'])
    def addStaff():
        data = flask.request.get_json()  # get data from POST request
        cursor = conn.cursor()
        sql = '''INSERT INTO tNhanVien (MaNV, TenNV, GioiTinh, NgaySinh, DiaChi, DienThoai)
                 VALUES (?, ?, ?, ?, ?, ?)'''  # SQL insert statement
        values = (data['MaNV'], data['TenNV'], data['GioiTinh'], data['NgaySinh'], data['DiaChi'],
                  data['DienThoai'])  # values to insert
        cursor.execute(sql, values)  # execute the SQL statement
        conn.commit()  # commit the transaction
        return flask.jsonify({"status": "success"}), 201  # return success status


    @app.route('/updatestaff/<id>', methods=['PUT'])
    def updateStaff(id):
        data = flask.request.get_json()  # get data from PUT request
        cursor = conn.cursor()
        sql = '''UPDATE tNhanVien SET TenNV = ?, GioiTinh = ?, NgaySinh = ?, DiaChi = ?, DienThoai = ? WHERE MaNV = ?'''  # SQL update statement
        values = (
        data['TenNV'], data['GioiTinh'], data['NgaySinh'], data['DiaChi'], data['DienThoai'], id)  # values to update
        cursor.execute(sql, values)  # execute the SQL statement
        conn.commit()  # commit the transaction
        return flask.jsonify({"status": "success"}), 200  # return success status


    @app.route('/deletestaff/<id>', methods=['DELETE'])
    def deleteStaff(id):
        cursor = conn.cursor()
        sql = '''DELETE FROM tNhanVien WHERE MaNV = ?'''  # SQL delete statement
        cursor.execute(sql, id)  # execute the SQL statement
        conn.commit()  # commit the transaction
        return flask.jsonify({"status": "success"}), 200  # return success status


    @app.route('/getallclothestypes', methods=['GET'])
    def getAllClothesTypes():
        cursor = conn.cursor()
        sql = "SELECT MaTheLoai, TenTheLoai FROM LoaiQuanAo"
        cursor.execute(sql)
        result = []
        keys = []
        for i in cursor.description:
            keys.append(i[0])  # get keys
        for i in cursor.fetchall():
            result.append(dict(zip(keys, i)))  # create dictionary for each row
        resp = flask.jsonify(result)  # convert result to JSON
        resp.status_code = 200  # set status code
        return resp  # return result


    @app.route('/addclothestype', methods=['POST'])
    def addClothesType():
        data = flask.request.get_json()  # get data from POST request
        cursor = conn.cursor()
        sql = '''INSERT INTO LoaiQuanAo (MaTheLoai, TenTheLoai)
                 VALUES (?, ?)'''  # SQL insert statement
        values = (data['MaTheLoai'], data['TenTheLoai'])  # values to insert
        cursor.execute(sql, values)  # execute the SQL statement
        conn.commit()  # commit the transaction
        return flask.jsonify({"status": "success"}), 201  # return success status
    @app.route('/deleteclothestype/<id>', methods=['DELETE'])
    def deleteClothesType(id):
        cursor = conn.cursor()
        sql = '''DELETE FROM LoaiQuanAo WHERE MaTheLoai = ?'''
        cursor.execute(sql, id)
        conn.commit()
        return flask.jsonify({"status": "success"}), 200


    @app.route('/updateclothestype/<id>', methods=['PUT'])
    def updateClothesType(id):
        data = flask.request.get_json()  # get data from PUT request
        cursor = conn.cursor()
        sql = '''UPDATE LoaiQuanAo SET TenTheLoai = ? WHERE MaTheLoai = ?'''  # SQL update statement
        values = (data['TenTheLoai'], id)  # values to update
        cursor.execute(sql, values)  # execute the SQL statement
        conn.commit()  # commit the transaction
        return flask.jsonify({"status": "success"}), 200  # return success status


    @app.route('/getallinvoices', methods=['GET'])
    def getAllInvoices():
        cursor = conn.cursor()
        sql = '''SELECT * FROM tHoaDonBan'''  # SQL select statement
        cursor.execute(sql)  # execute the SQL statement
        result = []
        keys = []
        for i in cursor.description:
            keys.append(i[0])  # get keys
        for i in cursor.fetchall():
            result.append(dict(zip(keys, i)))  # create dictionary for each row
        resp = flask.jsonify(result)  # convert result to JSON
        resp.status_code = 200  # set status code
        return resp  # return result


    @app.route('/deleteinvoice/<id>', methods=['DELETE'])
    def deleteInvoice(id):
        cursor = conn.cursor()
        sql = '''DELETE FROM tHoaDonBan WHERE SoHDB = ?'''  # SQL delete statement
        cursor.execute(sql, id)  # execute the SQL statement
        conn.commit()  # commit the transaction
        return flask.jsonify({"status": "success"}), 200  # return success status


    @app.route('/updateinvoice/<id>', methods=['PUT'])
    def updateInvoice(id):
        data = flask.request.get_json()  # get data from PUT request
        cursor = conn.cursor()
        sql = '''UPDATE tHoaDonBan SET SoHDB = ?, MaNV = ?, NgayBan = ?, MaKH = ? WHERE SoHDB = ?'''  # SQL update statement
        values = (data['SoHDB'], data['MaNV'], data['NgayBan'], data['MaKH'], id)  # values to update
        cursor.execute(sql, values)  # execute the SQL statement
        conn.commit()  # commit the transaction
        return flask.jsonify({"status": "success"}), 200  # return success status


    @app.route('/addinvoice', methods=['POST'])
    def addInvoice():
        data = flask.request.get_json()  # get data from POST request
        cursor = conn.cursor()
        sql = '''INSERT INTO tHoaDonBan (SoHDB, MaNV, NgayBan, MaKH)
                 VALUES (?, ?, ?, ?)'''  # SQL insert statement
        values = (data['SoHDB'], data['MaNV'], data['NgayBan'], data['MaKH'])  # values to insert
        cursor.execute(sql, values)  # execute the SQL statement
        conn.commit()  # commit the transaction
        return flask.jsonify({"status": "success"}), 201  # return success status


    @app.route('/getinvoice/<id>', methods=['GET'])
    def getInvoice(id):
        cursor = conn.cursor()
        sql = '''SELECT tChiTietHDB.*, tQuanAo.TenQuanAo FROM tChiTietHDB 
                 INNER JOIN tQuanAo ON tChiTietHDB.MaQuanAo = tQuanAo.MaQuanAo 
                 WHERE SoHDB = ?'''  # SQL select statement with join
        cursor.execute(sql, id)  # execute the SQL statement
        result = []
        keys = []
        for i in cursor.description:
            keys.append(i[0])  # get keys
        for i in cursor.fetchall():
            result.append(dict(zip(keys, i)))  # create dictionary for each row
        resp = flask.jsonify(result)  # convert result to JSON
        resp.status_code = 200  # set status code
        return resp  # return result


    @app.route('/additemtoinvoice/', methods=['POST'])
    def addItemToInvoice():
        data = flask.request.get_json()  # get data from POST request
        cursor = conn.cursor()
        sql = '''INSERT INTO tChiTietHDB (SoHDB, MaQuanAo, SLBan, KhuyenMai)
                 VALUES (?, ?, ?, ?)'''  # SQL insert statement
        values = (data['SoHDB'], data['MaQuanAo'], data['SLBan'], data['KhuyenMai'])  # values to insert
        cursor.execute(sql, values)  # execute the SQL statement
        conn.commit()  # commit the transaction
        return flask.jsonify({"status": "success"}), 201  # return success status

    if __name__ == "__main__":
        app.run(host="<ip>",port=3333, debug=True)


except Exception as e:
    print(e)
