User.destroy_all
Category.destroy_all
SubCategory.destroy_all
Video.destroy_all
Interaction.destroy_all

# users
gabriel = User.create!(email: "gabrieldcpaiva@gmail.com", password: "123456")
sophie = User.create!(email: "sophie@gmail.com", password: "654321")

aerial = SubCategory.create!(name: "Aerial", category_id: flips.id)
backside = SubCategory.create!(name: "Backside", category_id: flips.id)

hollowback = SubCategory.create!(name: "Hollowback", category_id: handstands.id)
straight = SubCategory.create!(name: "Straight", category_id: handstands.id)
garudasana = SubCategory.create!(name: "Garudasana", category_id: handstands.id)

traditional = SubCategory.create!(name: "Traditional", category_id: pushups.id)
staggered = SubCategory.create!(name: "Staggered"), category_id: pushups.id
superman = SubCategory.create!(name: "Superman", category_id: pushups.id)

# category
handstands = Category.create!(name: "Handstands")
# subcategory
one_armed = SubCategory.create!(name: "One-armed handstand", category_id: handstands.id)
# videos and interactions
video_one_armed = Video.create!(drill: true, tutorial: false, rating: 0, difficulty: 1,
  user_id: gabriel.id, sub_category_id: one_armed.id, you_tube_key: "f7bOSY83548")
interaction = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_one_armed.id, viewed: true)

video_one_armed1 = Video.create!(drill: false, tutorial: true, rating: 0, difficulty: 1,
  user_id: gabriel.id, sub_category_id: one_armed.id, you_tube_key: "eXRrcSIE7G4")
interaction1 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_one_armed1.id, viewed: true)

video_one_armed2 = Video.create!(drill: false, tutorial: true, rating: 0, difficulty: 1,
  user_id: gabriel.id, sub_category_id: one_armed.id, you_tube_key: "CYWIk-mjbiM")
interaction2 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_one_armed.id, viewed: true)

# category
flips = Category.create!(name: "Flips")
# subcategory and interactions
backflip = SubCategory.create!(name: "Backflip", category_id: flips.id)
# videos and interactions
video_backflip = Video.create!(drill: false, tutorial: true, rating: 0, difficulty: 1,
  user_id: gabriel.id, sub_category_id: backflip.id, you_tube_key: "VIcdyNfwe5Q")
interaction3 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_backflip.id, viewed: true)

video_backflip1 = Video.create!(drill: false, tutorial: true, rating: 0, difficulty: 1,
  user_id: gabriel.id, sub_category_id: backflip.id, you_tube_key: "gBm1nAM_tww")
interaction4 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_backflip1.id, viewed: true)

video_backflip2 = Video.create!(drill: true, tutorial: false, rating: 0, difficulty: 1,
  user_id: gabriel.id, sub_category_id: backflip.id, you_tube_key: "T_DYae728C4")
interaction5 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_backflip2.id, viewed: true)

# category
pushups = Category.create!(name: "Pushups")
# subcategory and interactions
wide_grip_pushup = SubCategory.create!(name: "Wide grip pushup", category_id: pushups.id)
# videos and interactions
video_wide_grip_pushup = Video.create!(drill: false, tutorial: true, rating: 0, difficulty: 1,
  user_id: gabriel.id, sub_category_id: backflip.id, you_tube_key: "Z8nUVpSZAhE")
interaction6 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_wide_grip_pushup.id, viewed: true)

video_wide_grip_pushup1 = Video.create!(drill: false, tutorial: true, rating: 0, difficulty: 1,
  user_id: gabriel.id, sub_category_id: backflip.id, you_tube_key: "NJPS2d5JME0")
interaction7 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_wide_grip_pushup1.id, viewed: true)

video_wide_grip_pushup2 = Video.create!(drill: false, tutorial: true, rating: 0, difficulty: 1,
  user_id: gabriel.id, sub_category_id: backflip.id, you_tube_key: "d4lT37mRRPM")
interaction8 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_wide_grip_pushup2.id, viewed: true)
