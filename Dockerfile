# Utiliser l'image de base officielle d'OpenVSCode Server
FROM gitpod/openvscode-server:latest

# Exposer le port 3000
EXPOSE 3000

# Commande pour lancer OpenVSCode Server
CMD ["--port", "3000", "--host", "0.0.0.0"]
