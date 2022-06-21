from math import fabs
from re import A
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.conf import settings
import uuid

class UserManager(BaseUserManager):
    def create_user(self, company_name, office_name, postal_code, address, representative_name, phone_number, email, password=None):

        email = self.normalize_email(email)

        user = self.model(
            company_name=company_name,
            office_name=office_name,
            postal_code=postal_code,
            address=address,
            representative_name=representative_name,
            phone_number=phone_number,
            email=email
        )

        user.set_password(password)
        user.save(using=self._db)
        return user
    
    def create_superuser(self, company_name, office_name, service, postal_code, address, representative_name, phone_number, email, password=None):

        user = self.create_user(
            company_name=company_name,
            office_name=office_name,
            service=service,
            postal_code=postal_code,
            address=address,
            representative_name=representative_name,
            phone_number=phone_number,
            email=email
        )

        user.is_superuser = True
        user.is_staff = True
        
        user.save(using=self._db)

        return user

class User(AbstractBaseUser, PermissionsMixin):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False) 
    company_name = models.CharField(verbose_name="病院名・もしくは法人名", max_length=50, unique=True)
    office_name = models.CharField(verbose_name="事業所名", max_length=50, unique=True)
    postal_code = models.CharField(verbose_name="病院もしくは法人の郵便番号", max_length=7)
    address = models.CharField(verbose_name="病院もしくは法人の住所", max_length=50)
    representative_name = models.CharField(verbose_name="病院もしくは法人の担当者名", max_length=50)
    phone_number = models.CharField(verbose_name="病院もしくは法人の担当者電話番号", max_length=11)
    email = models.EmailField(verbose_name="病院もしくは法人の担当者メールアドレス", max_length=255, unique=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)

    objects = UserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = [
        'company_name',
        'office_name',
        'postal_code',
        'address',
        'representative_name',
        'phone_number'
    ]

    def __str__(self):
        return self.email

class Service(models.Model):

    class Meta:
        db_table = "service"

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
    users = models.ManyToManyField(settings.AUTH_USER_MODEL, related_name="user", blank=True)
    
    def __str__(self):
        return self.title