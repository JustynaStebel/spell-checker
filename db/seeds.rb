User.delete_all
User.create! id: 1, email: "admin@example.com", password: "password", admin: true
User.create! id: 2, email: "user@example.com", password: "password", admin: false
