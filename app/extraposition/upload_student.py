import xlrd, pymysql, os, uuid, datetime


def excel(excel):
    excel = xlrd.open_workbook(excel)
    sheet = excel.sheet_by_name("Sheet1")
    department = {
        '食品学院': 2,
        '经济管理学院': 3,
        '工商管理学院': 4,
        '信息工程学院': 5,
        '人文学院': 6,
        '艺术学院': 7,
        '旅游学院': 8,
        '外国语学院': 9,
        '马克思主义学院': 10,
        '理学部': 11,
        '体育部': 12,
        '国际教育学院': 13,
        '继续教育学院': 14,
        '艺术学院': 15,
        '法学院': 16,
        '软件学院': 17,
        '先进制造学院': 18
    }
    conn = pymysql.connect(
        host='127.0.0.1',
        user='zhy',
        passwd='zhY123456',
        db='xueji',
        port=3306,
        charset='utf8'
    )

    cur = conn.cursor()
    query = 'insert into note(xh, bj, cc, xy,xq, xm, nj, xb, mz, lqzy, ksh, rxrq, byrq, admin_id) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'
    for r in range(sheet.nrows):
        xh = sheet.cell(r, 0).value
        bj = sheet.cell(r, 1).value
        cc = sheet.cell(r, 2).value

        xy = sheet.cell(r, 3).value
        xq = sheet.cell(r, 4).value
        xm = sheet.cell(r, 5).value
        nj = sheet.cell(r, 11).value
        xb = sheet.cell(r, 6).value
        mz = sheet.cell(r, 7).value
        lqzy = sheet.cell(r, 8).value
        ksh = sheet.cell(r, 9).value
        rxrq = sheet.cell(r, 10).value
        rx_date_s = rxrq[0:4] + '-' + rxrq[5:7] + '-' + rxrq[8:]
        if cc in ['本科', '普通本科', '合作办学本科', '艺术本科']:
            byrq_s = str(int(rxrq[0:4]) + 4) + '-07-01'
            byrq = datetime.datetime.strptime(byrq_s, '%Y-%m-%d').date()
        if cc in ['合作办学专科', '普通专科', '艺术专科', '专科']:
            byrq_s = str(int(rxrq[0:4]) + 3) + '-07-01'
            byrq = datetime.datetime.strptime(byrq_s, '%Y-%m-%d').date()
        if cc in ['软件学院专科', '专升本']:
            byrq_s = str(int(rxrq[0:4]) + 2) + '-07-01'
            byrq = datetime.datetime.strptime(byrq_s, '%Y-%m-%d').date()

        rxrq = datetime.datetime.strptime(rx_date_s, '%Y-%m-%d').date()
        admin_id = department[sheet.cell(r, 3).value]
        print(sheet.cell(r, 3).value, rxrq, byrq, nj)
        values = (xh, bj, cc, xy, xq, xm, nj, xb, mz, lqzy, ksh, rxrq, byrq, admin_id)
        cur.execute(query, values)

    cur.close()
    conn.commit()
    conn.close()


def random_filename(filename):
    ext = os.path.splitext(filename)[1]
    new_filename = uuid.uuid4().hex + ext
    return new_filename
