# On utilise python comme image de base.
FROM python:3.8-slim-buster

# On renseigne dossier principale de l'application.
WORKDIR /app

# On copie le fichier requirements.txt
COPY requirements.txt .

# On lance le pip install du fichier requirements.
RUN pip install --no-cache-dir -r requirements.txt

# on copie les fichiers.
COPY host.json .
COPY __int__.py .
COPY function.json .
COPY sample.dat .
COPY readme.md /

# Commande d'exécution.