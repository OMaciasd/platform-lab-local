import bcrypt

# Cambia la contraseña por la que desees
password = "NUEVA_CONTRASEÑA"

# Generar el hash bcrypt
hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

# Mostrar el hash
print(hashed_password.decode('utf-8'))
