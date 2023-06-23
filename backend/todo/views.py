from django.shortcuts import render
from rest_framework import viewsets
from django.middleware.csrf import get_token
from django.http import JsonResponse
from .serializers import TodoSerializer
from .models import Todo

# Create your views here.


def csrf_token_view(request):
    return JsonResponse({'csrfToken': get_token(request)})


def home_view(request):
    return render(request, 'index.html')


class TodoView(viewsets.ModelViewSet):
    serializer_class = TodoSerializer
    queryset = Todo.objects.all()
