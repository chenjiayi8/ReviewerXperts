#!/bin/bash

# Create a new virtual environment
virtualenv --python=python3.10 env
source env/bin/activate

# Install dependencies from requirements.txt
pip install -r ./backend/requirements.txt

# Set up the Django project
#python manage.py migrate
#python manage.py createsuperuser
