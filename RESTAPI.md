# Авторизация
POST /api/v1/signup
{
    address, name, phone, birth_date,
}

Response:
- 201, {user_id}
- 400
- 500

POST /api/v1/signin
{
    login, password
}
Response:
- 200, {token}
- 400
- 500

# Подача заявления
POST /api/v1/application
{
    name,number,file_path
}
Response:
- 200
- 400
- 500

# Просмотр всех поданных заявлений у клиента
GET /api/v1/applications?user_id={user_id}

- 200
- 401
- 500
- 400

{
    applications: 
    [
        {
            id: 1,
            status: status_code
            file_path: file_path,
            date_submitted: date_submitted
        }
    ]
}
# Просмотр всех поданных заявлений у клиента
GET /api/v1/applications/{id}?user_id={user_id}

- 200
- 401
- 500
- 400

{
    data: 
    [
        {
            id: 1,
            status: status_code
            file_path: file_path,
            date_submitted: date_submitted
        }
    ]
}
# Admin API
GET /api/v1/admin/applications

- 200
- 401
- 500
- 400

{
    applications: 
    [
        {
            id: 1,
            status: status_code,
            user_applicant: user_id,
            file_path: file_path,
            date_submitted: date_submitted
        }
    ]
}
# Отклонение заявления
POST /api/v1/admin/applications/{id}/delete
{
    application_id,
}

Response:
- 200
- 400
- 401
- 500

# Одобрение заявления
POST /api/v1/admin/applications/{id}/accept
{
    application_id,
}

Response:
- 200
- 400
- 401
- 500