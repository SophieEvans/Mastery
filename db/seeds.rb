gabriel = User.create!(email: "gabrieldcpaiva@gmail.com", password: "123456")
sophie = User.create!(email: "sophie@gmail.com", password: "654321")

flips = Category.create!(name: "Flips")

backflip = SubCategory.create!(name: "Backflip", category_id: flips.id)
aerial = SubCategory.create!(name: "Aerial", category_id: flips.id)
backside = SubCategory.create!(name: "Backside", category_id: flips.id)

handstands = Category.create!(name: "Handstands")

hollowback = SubCategory.create!(name: "Hollowback", category_id: handstands.id)
straight = SubCategory.create!(name: "Straight", category_id: handstands.id)
garudasana = SubCategory.create!(name: "Garudasana", category_id: handstands.id)

pushups = Category.create!(name: "Pushups")

traditional = SubCategory.create!(name: "Traditional", category_id: pushups.id)
staggered = SubCategory.create!(name: "Staggered"), category_id: pushups.id
superman = SubCategory.create!(name: "Superman", category_id: pushups.id)

video = Video.create!(drill: true, tutorial: true, rating: 0, difficulty: 1,
  user_id: gabriel.id, sub_category_id: backflip.id, you_tube_key: "uC5tlDPxwAU")

interaction1 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video.id, viewed: true)
