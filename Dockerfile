# To enable ssh & remote debugging on app service change the base image to the one below
# FROM mcr.microsoft.com/azure-functions/python:4-python3.8-appservice
FROM mcr.microsoft.com/azure-functions/python:4-python3.8

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

COPY requirements.txt /
RUN pip install -r /requirements.txt
COPY . /home/site/wwwroot

# On renseigne dossier principale de l'application.
WORKDIR /app

# On copie et on lance le pip install du fichier requirements.
COPY requirements.txt .
COPY host.json .

# Création du dossier "transdev_forecast" et copie des fichiers correspondants
WORKDIR /app/transdev_forecast
COPY transdev_forecast/__init__.py .
COPY transdev_forecast/collect.py .
COPY transdev_forecast/function.json .
COPY transdev_forecast/readme.md .
COPY transdev_forecast/sample.dat .



