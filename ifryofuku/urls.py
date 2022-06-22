from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('api.urls')),
    # これがdjoserを使うメリット
    # /authen/jwt/createでEメールとパスワードでPOSTするとJWTトークンを返してくれる
    # /authen/jwt/refreshでトークンを再取得
    # /authen/jwt/verifyでトークンを検証
    # localStorageにjwtTokenを格納。ただし有効期限を短くする。
    path('authen/', include('djoser.urls.jwt'))
]