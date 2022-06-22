from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter

app_name = 'user'

# ModelViewSetと汎用APIViewで設定が異なる
# ModelViewSetの場合
router = DefaultRouter()
router.register("user_profile", views.UserProfileViewSet)
router.register("user_service", views.UserServiceViewSet)
# router.register("iryo", views.IryoViewSet)
# router.register("iryo_address", views.IryoAddressViewSet)

#汎用APIViewの場合
urlpatterns = [
    # .as_view()はつける決まり。nameは任意。
    path('register/', views.CreateUserView.as_view(), name='register'),
    # api（ルート）のパスに来たときにrouterの内容を読むようにしている
    # ModelViewSetの書き方
    path('', include(router.urls)),
]