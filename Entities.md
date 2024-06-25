# Пользователи
Users: {
    "id": "string",
    "name": "string",
    "phone": "string",
    "address": "string",
    "birthdate": "date",
    "role_id": "int"
}
# Роли
Roles: {
    "id": "int",
    "name": "string"
}
# Заявления
Applications: {
    "id": "int",
    "user_id": "int",
    "name": "string",
    "file_path": "string",
    "date_submitted": "date"
}
# Статусы заявления
ApplicationsStatuses: {
    "id": "int",
    "code": "string",
    "title": "string"
}