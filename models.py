from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.conf import settings

# usernameとpasswordで認証がデフォルト
# UserManagerとUserClassをEメール用にOverrideする必要がある
# Djangoが用意している雛形を使用して、Overrideしている
# def create_user(self, username, password=None): → def create_user(self, email, password=None):

class UserManager(BaseUserManager):
    def create_user(self, office_name, office_number, company_name, representative_name, postal_code, address, phone_number, email, password=None):
        if not email:
            raise ValueError('Eメールは必須です')
        
        # emailを正規化
        email = self.normalize_email(email)

        # modelメソッドを使ってuserインスタンスを作っている
        user = self.model(
            office_name=office_name,
            office_number=office_number,
            company_name=company_name,
            representative_name=representative_name,
            postal_code=postal_code,
            address=address,
            phone_number=phone_number,
            email=email,
        )
        # Django側でパスワードをハッシュ化してsetしている
        user.set_password(password)
        # userのインスタンスをDBに保存する
        user.save(using=self._db)
        return user

    # Djangoに元々あるsuperuserを使用
    def create_superuser(self, office_name, office_number, company_name, representative_name, postal_code, address, phone_number, email, password=None):
        # まずは普通のuserを作る
        user = self.create_user(office_name, office_number, company_name, representative_name, postal_code, address, phone_number, email, password)

        # is_activeはFalseになるとログインできなくなる
        # is_staffはFalseになるとDashboardにログインできなくなる（編集はTrueでもできない）
        # is_superuserは全てできる
        user.is_superuser = True
        user.is_staff = True
        user.save(using=self._db)

        return user

# Djangoが用意している雛形を使用して、Overrideしている
class User(AbstractBaseUser, PermissionsMixin):
    office_name = models.CharField(max_length=50, unique=True)
    office_number = models.CharField(max_length=11)
    company_name = models.CharField(max_length=50)
    representative_name = models.CharField(max_length=50)
    postal_code = models.CharField(max_length=7)
    address = models.CharField(max_length=50)
    phone_number = models.CharField(max_length=11)
    email = models.EmailField(max_length=255, unique=True)

    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)

    # UserManagerをインスタンス化してobjectsに格納
    # →Userクラスの中にUserManagerが入っている
    # これでUserクラスに対してインスタンスを作った場合に、
    # そのインスタンの中で「objects.create_user」と書けば、
    # create_userメソッドをUserクラスのインスタンスから呼び出せる
    objects = UserManager()

    # USERNAME_FIELDもDjangoが用意している
    # デフォルトはusername
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['office_name', 'office_number', 'company_name', 'representative_name', 'postal_code', 'address', 'phone_number']


    # 文字列を返す関数
    def __str__(self):
        return self.email


class Customer(models.Model):

    GENDER_DEFAULT = "男性"
    GENDER_SET = (
            ("男性", "男性"),
            ("女性", "女性"),
    )
    SERVICE_DEFAULT = "共同生活援助（介護サービス包括型）"
    SERVICE_SET = (
            ("共同生活援助（介護サービス包括型）", "共同生活援助（介護サービス包括型）"),
            ("就労継続支援B型", "就労継続支援B型"),
            ("生活介護", "生活介護"),
            ("計画相談支援", "計画相談支援"),
            ("重度訪問介護", "重度訪問介護"),
            ("児童発達支援", "児童発達支援"),
            ("障がい児相談支援", "障がい児相談支援"),
    )

    human_name = models.CharField(max_length=20, unique=True)
    gender = models.CharField(choices=GENDER_SET, default=GENDER_DEFAULT, max_length=50)
    service = models.CharField(choices=SERVICE_SET, default=SERVICE_DEFAULT, max_length=50)
    # settings.pyで設定するAUTH_USER_MODELと紐付ける。blank=Trueは必須
    user = models.ManyToManyField(settings.AUTH_USER_MODEL, related_name="user", blank=True)
    created_on = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.human_name