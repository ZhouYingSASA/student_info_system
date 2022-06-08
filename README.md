# 学籍管理系统
老师我想办休学，手续怎么办？老师我想办退学，手续怎么整？老师我要参军保留学籍，都有哪些流程？二维码扫一扫，手机自助下单，无需老师电脑操作，即刻打印，享受离校便捷途径，解放学籍管理辅导员双手~你值得拥有。老师，我参军想保留学籍，保留，留两年够吗，够了够了，老师您真好  

学生在校期间避免不了要和各种证明打交道，比如学籍证明、转专业申请、休学申请、退学申请等等。此类业务一般流程都是学生去找老师告知要办的证明类型，然后老师帮助学生在电子版证明表格中填入各种信息（也有可能学生自己写），然后再打印出来。繁琐的步骤让老师和学生都叫苦不迭，于是很多学校都用上了学生信息自助打印机
学生自行去机器上就可以打印证明了，可是这种解决方案弊端也很明显：  
1、价格太贵，一般学校都不会出资购买  
2、就算购买，一般也只会在职能部门购置一台，无法大面积服务全体学生  
3、可打印证明类太少，有的甚至无法自定义格式打印  

解决办法也很简单，做一个系统，学生手机打开网页输入姓名、学号等信息，系统自动匹配数据库中学生的信息，然后将信息生成对应的业务表格，老师在后台可以查询每个学生的业务申请，更可以直接通过打印机打印。


## 系统优势：
1、便宜，最低仅需一台有公网ip的主机就可以（ubuntu最好）  
2、可以分配多个账号给不同的院系管理员，总管理员可以查看所有学生业务，院系管理员仅可查看自己院系业务  
3、可根据各种条件查询所有历史业务，方便统计  
4、类似退学、休学等需要所负责老师先在后台确认，方可继续打印，防止出现一些意外情况  


## 部署 
### 1、本机测试  
1、安装依赖  
   ```python
   pip install -r requirements
   ```
2、修改数据库配置文件中的地址、用户、密码为你自己的数据库信息  
students_info_system/app/config/setting.py  
students_info_system/app/extraposition/upload_student.py  
```python
#setting.py 21行
SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:123456@localhost:3306/xueji'
```
```python
#upload_student.py 29-35行
conn = pymysql.connect(
        host='localhost',
        user='root',
        passwd='123456',
        db='xueji',
        port=3306,
        charset='utf8'
    )
```
3、将项目根目录xueji.sql覆盖你的数据库  
4、如果需要使用自己的数据，把note表中数据删除，然后按照根目录下的xueji_data.xls文件将自己数据做出xls，浏览器打开/admin_edit/upload路径上传即可



### 2、Docker部署  
也可以只配置数据库信息（只做上面2、3步），然后通过Docker方式进行部署。
1、建立image    
```
docker image build -t student_info_system .
```
2、建立container  
```
docker container run -d -p 5000:5000 --name student_info_system student_info_system
```
3、宿主机器打开http://127.0.0.1:5000/admin/login  

***


## 相关URL
/student/front 前台，将此地址展示给学生即可开始业务流程    
/admin/login 后台登录入口  