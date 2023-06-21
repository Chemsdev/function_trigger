# On utilise python comme image de base.
FROM python:3.8-slim-buster

# On renseigne dossier principale de l'application.
WORKDIR /app

# On copie et on lance le pip install du fichier requirements.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8501

# Création du dossier "transdev_forecast" et copie des fichiers correspondants
WORKDIR /app/transdev_forecast
COPY transdev_forecast/__init__.py .
COPY transdev_forecast/collect.py .
COPY transdev_forecast/function.json .
COPY transdev_forecast/readme.md .
COPY transdev_forecast/sample.dat .

# Copie des autres fichiers à la racine de l'application
WORKDIR /app
COPY host.json .
COPY requirements.txt .

CMD ["func", "start"]
