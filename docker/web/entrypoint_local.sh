#!/bin/bash

source env/bin/activate
python backend/manage.py runserver 0.0.0.0:8000 &
npm run --prefix frontend/ start &
bash -c "tail -f /dev/null"
