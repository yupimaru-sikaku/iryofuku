from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter

# ModelViewSetと汎用APIViewで設定が異なる

# ModelViewSet
app_name = 'user'

router = DefaultRouter()
# 'service'とServiceViewSetを紐付ける
router.register('service', views.ServiceViewSet)


#汎用APIView
urlpatterns = [
    # .as_view()はつける決まり。nameは任意。
    path('register/', views.CreateUserView.as_view(), name='register'),
    # api（ルート）のパスに来たときにrouterの内容を読むようにしている
    path('', include(router.urls))
]