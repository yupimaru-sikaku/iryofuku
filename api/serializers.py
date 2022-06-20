from dataclasses import fields
from django.contrib.auth import get_user_model
from rest_framework import serializers
from .models import Service

class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = get_user_model()
        fields = (
            'id',
            'company_name',
            'office_number',
            'postal_code',
            'address',
            'representative_name',
            'phone_number',
            'email',
            'password'
        )

        extra_kwargs = {'password': {'write_only': True} }

    def create(self, validated_data):
        user = get_user_model().objects.create_user(**validated_data)
        return user
    
class ServiceSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Service
        fields = (
            'id',
            'title',
            'users'
        )
