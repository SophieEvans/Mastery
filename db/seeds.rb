User.destroy_all
Category.destroy_all
SubCategory.destroy_all
Video.destroy_all
Interaction.destroy_all

# users
gabriel = User.create!(email: "gabrieldcpaiva@gmail.com", password: "123456")
sophie = User.create!(email: "sophie@gmail.com", password: "654321")

# category
handstands = Category.create!(name: "Handstands")
# subcategory
one_armed = SubCategory.create!(name: "One-armed handstand", category_id: handstands.id)
hollowback = SubCategory.create!(name: "Hollowback", category_id: handstands.id)
# videos and interactions
video_one_armed = Video.create!(title: "One arm handstand", rating: 0, difficulty: "Advanced",
  user_id: gabriel.id, sub_category_id: one_armed.id, you_tube_key: "f7bOSY83548")
interaction = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_one_armed.id, viewed: true)

video_one_armed1 = Video.create!(title: "Yoga one-handed handstand (at the wall)", rating: 0, difficulty: "Advanced",
  user_id: gabriel.id, sub_category_id: one_armed.id, you_tube_key: "eXRrcSIE7G4")
interaction1 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_one_armed1.id, viewed: true)

video_one_armed2 = Video.create!(title: "How to do a One-Handed Handstand", rating: 0, difficulty: "Advanced",
  user_id: gabriel.id, sub_category_id: one_armed.id, you_tube_key: "CYWIk-mjbiM")
interaction2 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_one_armed.id, viewed: true)

# subcategory
straight = SubCategory.create!(name: "Straight", category_id: handstands.id)
# videos and interactions
video_straight = Video.create!(title: "How to do a Handstand", rating: 0, difficulty: "Advanced",
  user_id: gabriel.id, sub_category_id: video_straight.id, you_tube_key: "ZH3PkhtOUwg")
interaction2a = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_straight.id, viewed: true)

# category
flips = Category.create!(name: "Flips")
# subcategory and interactions
backflip = SubCategory.create!(name: "Backflip", category_id: flips.id)
aerial = SubCategory.create!(name: "Aerial", category_id: flips.id)
backside = SubCategory.create!(name: "Backside", category_id: flips.id)
# videos and interactions

video_backflip = Video.create!(title: "How to do a backflip", rating: 0, difficulty: "Intermediate",
  user_id: gabriel.id, sub_category_id: backflip.id, you_tube_key: "VIcdyNfwe5Q")
interaction3 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_backflip.id, viewed: true)

video_backflip1 = Video.create!(title: "Backflip on the ground", rating: 0, difficulty: "Intermediate",
  user_id: gabriel.id, sub_category_id: backflip.id, you_tube_key: "gBm1nAM_tww")
interaction4 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_backflip1.id, viewed: true)

video_backflip2 = Video.create!(title: "Tuck Conditioning Drills", rating: 0, difficulty: "Intermediate",
  user_id: gabriel.id, sub_category_id: backflip.id, you_tube_key: "T_DYae728C4")
interaction5 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_backflip2.id, viewed: true)

