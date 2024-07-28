# Utiliser l'image de base Python appropriée pour Alpine
FROM python:3.13.0a2-alpine

# Créer un répertoire pour l'application
WORKDIR /opt/webapp

# Ajouter le fichier requirements.txt
ADD ./webapp/requirements.txt /tmp/requirements.txt

# Installer les dépendances
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# Ajouter le reste du code de l'application
ADD ./webapp /opt/webapp/

# Créer et utiliser un utilisateur non-root
RUN adduser -D myuser
USER myuser

# Définir la commande par défaut pour lancer l'application
CMD ["gunicorn", "--bind", "0.0.0.0:$PORT", "wsgi"]
