gabriel = User.create!(email: "gabrieldcpaiva@gmail.com", password: "123456")
sophie = User.create!(email: "sophie@gmail.com", password: "654321")

skate = Category.create!(name: "Skate")

backflip = SubCategory.create!(name: "Backflip", category_id: skate.id)

video = Video.create!(drill: true, tutorial: true, rating: 0, difficulty: 1,
  user_id: gabriel.id, sub_category_id: backflip.id, you_tube_key: "uC5tlDPxwAU")

interaction1 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video.id, viewed: true)
