User.create!(name: "Tom Holland", email: "tom_holland@example.com", password: "password", is_admin: true)
Task.create!(title: "title task1", detail: "detail task1", status: "started", priority: "high", deadline: "2022-02-01", user_id: User.first.id)
Task.create!(title: "title task2", detail: "detail task2", status: "not started", priority: "middle", deadline: "2022-02-15", user_id: User.first.id)