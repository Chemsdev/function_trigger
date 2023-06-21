import mysql.connector
from mysql.connector import connect


# Fonction permettent de faire la connexion à la base de données.
def connect(host:str, user:str, password:str, database:str):
    db = mysql.connector.connect(
        host=host,
        user=user,
        password=password,
        database=database
    )
    return db

# Fonction permettent d'injecter de la données en bdd.
def requete():
    conn = connect(
        host     = "chemsdineserver.mysql.database.azure.com", 
        user     = "chemsdine", 
        password = "Ounissi69800",
        database = "bdd_trigger"
    )
    cursor = conn.cursor()
    
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS `trigger`
        (id INT AUTO_INCREMENT PRIMARY KEY,
        value TEXT)
    ''')
    
    cursor.execute("INSERT INTO `trigger` (value) VALUES ('fonctionne')")
    conn.commit()
    print("Donnée insérée avec succès !")