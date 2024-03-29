# Generated by Django 3.0.7 on 2022-06-22 08:48

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0011_update_proxy_permissions'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('email', models.EmailField(max_length=50, unique=True, verbose_name='病院もしくは法人の担当者メールアドレス')),
                ('is_active', models.BooleanField(default=True)),
                ('is_staff', models.BooleanField(default=False)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'db_table': 'user',
            },
        ),
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('company_name', models.CharField(max_length=50, unique=True, verbose_name='病院名・もしくは法人名')),
                ('office_name', models.CharField(max_length=50, unique=True, verbose_name='事業所名')),
                ('postal_code', models.CharField(max_length=7, verbose_name='病院もしくは法人の郵便番号')),
                ('address', models.CharField(max_length=50, verbose_name='病院もしくは法人の住所')),
                ('representative_name', models.CharField(max_length=50, verbose_name='病院もしくは法人の担当者名')),
                ('phone_number', models.CharField(max_length=11, verbose_name='病院もしくは法人の担当者電話番号')),
                ('email', models.EmailField(max_length=255, unique=True, verbose_name='病院もしくは法人の担当者メールアドレス')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='登録日時')),
                ('updated_at', models.DateTimeField(auto_now_add=True, verbose_name='更新日時')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='user', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'user_table',
            },
        ),
        migrations.CreateModel(
            name='UserService',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('title', models.CharField(choices=[('共同生活援助（介護サービス包括型）', '共同生活援助（介護サービス包括型）'), ('就労継続支援B型', '就労継続支援B型'), ('生活介護', '生活介護'), ('計画相談支援', '計画相談支援'), ('重度訪問介護', '重度訪問介護'), ('児童発達支援', '児童発達支援'), ('障がい児相談支援', '障がい児相談支援')], default='共同生活援助（介護サービス包括型）', max_length=50, verbose_name='サービス名')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='登録日時')),
                ('updated_at', models.DateTimeField(auto_now_add=True, verbose_name='更新日時')),
                ('user_profile', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='user_profile', to='api.UserProfile', verbose_name='病院名・もしくは法人のプロフィール')),
            ],
            options={
                'db_table': 'user_service',
            },
        ),
    ]
