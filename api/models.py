from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.conf import settings
import uuid

# usernameとpasswordで認証がデフォルト
# UserManagerとUserClassをEメール用にOverrideする必要がある
# Djangoが用意している雛形を使用して、Overrideしている
# def create_user(self, username, password=None): → def create_user(self, email, password=None):
class UserManager(BaseUserManager):
    def create_user(self, email, password=None):
        if not email:
            raise ValueError('email is must')
        # Eメールを正規化して、modelメソッドでインスタンス化したuserを作成
        user = self.model(email=self.normalize_email(email))
        # Django側でパスワードをハッシュ化してset
        user.set_password(password)
        # インスタンス化したuserをDBに保存
        user.save(using=self._db)
        return user

    # Djangoに元々あるsuperuserを使用
    def create_superuser(self, email, password):

        # まずは普通のuserを作る
        user = self.create_user(email, password)

        # is_activeはFalseになるとログインできなくなる
        # is_staffはFalseになるとDashboardにログインできなくなる（編集はTrueでもできない）
        # is_superuserは全てできる
        user.is_staff = True
        user.is_superuser = True
        
        user.save(using= self._db)

        return user

# Djangoが用意している雛形を使用して、Override
class User(AbstractBaseUser, PermissionsMixin):

    class Meta:
        db_table = 'user'

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False) 
    email = models.EmailField(verbose_name="病院もしくは法人の担当者メールアドレス", max_length=50, unique=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)

    # UserManagerをインスタンス化してobjectsに格納 → Userクラスの中にUserManagerが入っている
    # これでUserクラスに対してインスタンスを作った場合に、そのインスタンスの中で「インスタンス.objects.create_user」と書けば、インスタンスから呼び出せる
    objects = UserManager()
    
    # USERNAME_FIELDもDjangoが用意している。デフォルトはusername
    # ユニークなキーを記載
    USERNAME_FIELD = 'email'
    # ユーザーを作成するために必要なキーを記載
    # REQUIRED_FIELDS = []

    # 文字列を返す関数
    def __str__(self):
        return self.email

class UserProfile(models.Model):

    class Meta:
        db_table = "user_table"

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    company_name = models.CharField(verbose_name="病院名・もしくは法人名", max_length=50, unique=True)
    office_name = models.CharField(verbose_name="事業所名", max_length=50, unique=True)
    postal_code = models.CharField(verbose_name="病院もしくは法人の郵便番号", max_length=7)
    address = models.CharField(verbose_name="病院もしくは法人の住所", max_length=50)
    representative_name = models.CharField(verbose_name="病院もしくは法人の担当者名", max_length=50)
    phone_number = models.CharField(verbose_name="病院もしくは法人の担当者電話番号", max_length=11)
    email = models.EmailField(verbose_name="病院もしくは法人の担当者メールアドレス", max_length=255, unique=True)
    user = models.OneToOneField(settings.AUTH_USER_MODEL, related_name="user", on_delete=models.CASCADE)
    created_at = models.DateTimeField(verbose_name="登録日時", auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name="更新日時", auto_now_add=True)

    def __str__(self):
        return self.user

class UserService(models.Model):

    class Meta:
        db_table = 'user_service'

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

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    title = models.CharField(verbose_name="サービス名", choices=SERVICE_SET, default=SERVICE_DEFAULT, max_length=50)
    # related_nameがあると明示的に一対多がわかりやすい
    # settings.pyで設定するAUTH_USER_MODELと紐付ける。
    user_profile = models.ForeignKey(UserProfile, verbose_name="病院名・もしくは法人のプロフィール", on_delete=models.CASCADE, related_name="user_profile")
    created_at = models.DateTimeField(verbose_name="登録日時", auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name="更新日時", auto_now_add=True)

    def __str__(self):
        return "${self.user_profile}-${self.title}"

# class Iryo(models.Model):

#     class Meta:
#         db_table = "iryo"

#     # 障がい区分
#     CLASSIFICATION_DEFAULT = "区分１"
#     CLASSIFICATION_SET = (
#             ("区分１", "区分１"),
#             ("区分２", "区分２"),
#             ("区分３", "区分３"),
#             ("区分４", "区分４"),
#             ("区分５", "区分５"),
#             ("区分６", "区分６"),
#     )
#     # 障がい種別
#     DISABILITY_DEFAULT = "障がい種別１"
#     DISABILITY_SET = (
#             ("障がい種別１", "障がい種別１"),
#             ("障がい種別２", "障がい種別２"),
#             ("障がい種別３", "障がい種別３"),
#             ("障がい種別５", "障がい種別５"),
#     )
#     # サービスの種別
#     SERVICE_DEFAULT = "共同生活援助（介護サービス包括型）"
#     SERVICE_SET = (
#             ("共同生活援助（介護サービス包括型）", "共同生活援助（介護サービス包括型）"),
#             ("就労継続支援B型", "就労継続支援B型"),
#             ("生活介護", "生活介護"),
#             ("計画相談支援", "計画相談支援"),
#             ("重度訪問介護", "重度訪問介護"),
#             ("児童発達支援", "児童発達支援"),
#             ("障がい児相談支援", "障がい児相談支援"),
#     )
#     # 性別
#     GENDER_DEFAULT = "共同生活援助（介護サービス包括型）"
#     GENDER_SET = (
#             ("共同生活援助（介護サービス包括型）", "共同生活援助（介護サービス包括型）"),
#             ("就労継続支援B型", "就労継続支援B型"),
#             ("生活介護", "生活介護"),
#             ("計画相談支援", "計画相談支援"),
#             ("重度訪問介護", "重度訪問介護"),
#             ("児童発達支援", "児童発達支援"),
#             ("障がい児相談支援", "障がい児相談支援"),
#     )
#     # 契約状況
#     CONTRACT_DEFAULT = "未確定"
#     CONTRACT_SET = (
#             ("未確定", "未確定"),
#             ("商談中", "商談中"),
#             ("契約済", "契約済"),
#     )

#     id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
#     age = models.IntegerField(verbose_name="ご年齢")
#     classification = models.CharField(verbose_name="障がい区分", choices=CLASSIFICATION_SET, default=CLASSIFICATION_DEFAULT, max_length=50)
#     disability_type = models.CharField(verbose_name="障がい種別", choices=DISABILITY_SET, default=DISABILITY_DEFAULT, max_length=50)
#     service_type = models.CharField(verbose_name="サービスの種別", choices=SERVICE_SET, default=SERVICE_DEFAULT, max_length=50)
#     gender = models.CharField(verbose_name="性別", choices=GENDER_SET, default=GENDER_DEFAULT, max_length=50)
#     contract_status = models.CharField(verbose_name="契約状況", choices=CONTRACT_SET, default=CONTRACT_DEFAULT, max_length=50)
#     created_at = models.DateTimeField(verbose_name="登録日時", auto_now_add=True)
#     updated_at = models.DateTimeField(verbose_name="更新日時", auto_now_add=True)

#     def __str__(self):
#         return self.id

# class IryoAddress(models.Model):

#     class Meta:
#         db_table = "iryo_address"

#     id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
#     address_prefecture = models.CharField(verbose_name="ご利用を希望する都道府県", max_length=50)
#     address_city = models.CharField(verbose_name="ご利用を希望する市区町村", max_length=50)
#     iryo = models.ForeignKey(Iryo, verbose_name="利用者", on_delete=models.CASCADE, related_name="iryo")

#     def __str__(self):
#         return self.id