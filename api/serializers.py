from dataclasses import fields
from django.contrib.auth import get_user_model
from rest_framework import serializers
from rest_framework.validators import UniqueTogetherValidator
from .models import User, UserProfile, UserService

class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = get_user_model()
        fields = "__all__"

        # write_onlyはextra_kwargsを使用
        # パスワードはクライアント側に持っていかないので
        extra_kwargs = { "password": {"write_only": True } }
    
    # fieldsのデータがvalidated_dataに辞書型で格納
    def create(self, validated_data):
        # get_user_model()が現在アクティブなUserクラスを取得。
        user = get_user_model().objects.create_user(**validated_data)
        return user

class UserProfileSerializer(serializers.ModelSerializer):

    class Meta:
        model = UserProfile
        fields = "__all__"
        # Serializerの対象外にするもの
        # exclude = ["created_at"]
        # read_onlyはread_only_fieldsを使用
        read_only_fields = ("created_at", )
        extra_kwargs = {
            "company_name": {
                "validators": [
                    UniqueTogetherValidator(
                        queryset=User.objects.all(),
                        fields=("company_name"),
                        message="病院名・もしくは法人名が既に存在しています"
                    )
                ]
            },
            "office_name": {
                "validators": [
                    UniqueTogetherValidator(
                    queryset=User.objects.all(),
                    fields=("office_name"),
                    message="事業所名が既に存在しています"
                    )
                ]
            },
            "email": {
                "validators": [
                    UniqueTogetherValidator(
                    queryset=User.objects.all(),
                    fields=("email"),
                    message="病院もしくは法人の担当者メールアドレスが既に存在しています"
                    )
                ]
            }
        }

class UserServiceSerializer(serializers.ModelSerializer):

    class Meta:
        model = UserService
        fields = "__all__"
        fields = "__all__"
        # exclude = ["created_at"]
        read_only_fields = ("created_at", )


# class IryoSerializer(serializers.ModelSerializer):

#     class Meta:
#         model = Iryo
#         fields = "__all__"
#         exclude = ["created_at"]
#         read_only_fields = ("created_at")

# class IryoAddressSerializer(serializers.ModelSerializer):

#     class Meta:
#         model = IryoAddress
#         fields = "__all__"
#         exclude = ["created_at"]
#         read_only_fields = ("created_at")