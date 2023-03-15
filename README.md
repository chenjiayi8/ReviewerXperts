# ReviewerXperts
 ReviewerXperts is a Python-based repository that uses the Elsevier API and GPT-3 to generate high-quality reviews on a given topic. The code queries the Elsevier API to obtain a list of relevant articles with names, abstracts, and keywords. It then uses GPT-3 to rank the articles based on their relevance, and queries the full text of the best-ranked articles using the Elsevier API. Finally, the code generates a review paper by synthesizing information from the full text of the best-ranked articles.  This repository is designed for researchers, academics, or anyone who needs to generate a high-quality review on a given topic quickly and efficiently. It contains customizable Python code, as well as instructions for using the Elsevier API and GPT-3.  ReviewerXperts is continuously updated and maintained by a team of experts who ensure that the code is up-to-date and functional. It is licensed under the MIT license, which means it can be used freely for both commercial and non-commercial purposes. Join the ReviewerXperts community today and start generating high-quality reviews with ease!


 ## Setup

 ### Clone the repository and navigate to the project directory
 ```
git clone git@github.com:chenjiayi8/ReviewerXperts.git
cd ReviewerXperts
 ```

### Create a new virtual environment
```
chmod +x ./setup.sh
./setup.sh
source env/bin/activate
```

### Create a copy of the .env.example file and name it .env:
```
cp .env.example .env
```

### Set the SECRET_KEY environment variable in the .env file to a secure random string. 
You can generate a new secret key using the following command:
```
python -c 'import secrets; print(secrets.token_hex(32))'
```

### Set up the Django project
python manage.py migrate
python manage.py createsuperuser

### Running the Application
python manage.py runserver

The development server should now be running at http://127.0.0.1:8000/. You can access the admin site at http://127.0.0.1:8000/admin/.