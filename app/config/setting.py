# -*- coding: UTF-8 –*-
import os

class Config(object):
    APP_NAME = os.environ.get('APP_NAME') or 'Flask-Base'

    if os.environ.get('SECRET_KEY'):
        SECRET_KEY = os.environ.get('SECRET_KEY')
    else:
        SECRET_KEY = 'you never guess'

    @staticmethod
    def init_app(app):
        return

class DevelopmentConfig(Config):
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://zhy:zhY123456@127.0.0.1:3306/xueji'

    @classmethod
    def init_app(cls, app):
        print('>>>>>Two: This app has update')



config = {
    'development' : DevelopmentConfig,
    'default' : DevelopmentConfig
}