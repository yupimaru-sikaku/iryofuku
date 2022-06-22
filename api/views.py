from rest_framework import generics
from rest_framework import viewsets
# settings.pyで認証済のみ許可にしているため。AllowAnyで上書きする
from rest_framework.permissions import AllowAny
from .models import UserProfile, UserService

from api.models import UserService
from . import serializers

class CreateUserView(generics.CreateAPIView):
    serializer_class = serializers.UserSerializer
    permission_classes = (AllowAny,)

class UserProfileViewSet(viewsets.ModelViewSet):
    queryset = UserProfile.objects.all()
    serializer_class = serializers.UserProfileSerializer
    permission_classes = (AllowAny,)

class UserServiceViewSet(viewsets.ModelViewSet):
    queryset = UserService.objects.all()
    serializer_class = serializers.UserServiceSerializer
    permission_classes = (AllowAny,)

# class IryoViewSet(viewsets.ModelViewSet):
#     queryset = Iryo.objects.all()
#     serializer_class = serializers.IryoSerializer

# class IryoAddressViewSet(viewsets.ModelViewSet):
#     queryset = IryoAddress.objects.all()
#     serializer_class = serializers.IryoAddressSerializer