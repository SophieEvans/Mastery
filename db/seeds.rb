puts "Erasing all the work done so far..."

User.destroy_all
Category.destroy_all
SubCategory.destroy_all
Video.destroy_all
Interaction.destroy_all

puts "Done with that!"

puts "Now putting some seeds in..."
# users
gabriel = User.create!(email: "gabrieldcpaiva@gmail.com", password: "123456")
sophie = User.create!(email: "sophie@gmail.com", password: "654321")

# category
rookie = Category.create!(name: "Rookie")

# subcategory
ollie = SubCategory.create!(name: "ollie", category_id: rookie.id)
nollie = SubCategory.create!(name: "nollie", category_id: rookie.id)
shove_it = SubCategory.create!(name: "shove it", category_id: rookie.id)
frontside180 = SubCategory.create!(name: "frontside 180", category_id: rookie.id)
kickflip = SubCategory.create!(name: "kickflip", category_id: rookie.id)
casperflip = SubCategory.create!(name: "casper flip", category_id: rookie.id)
# videos and interactions
video_ollie = Video.create!(title: "ollie slo-mo", rating: 22, difficulty: "rookie",
  user_id: gabriel.id, sub_category_id: ollie.id, you_tube_key: "QjuuRA-b94I")
interaction = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_ollie.id, viewed: true)

video_ollie2 = Video.create!(title: "ollie from above", rating: 75, difficulty: "rookie",
  user_id: gabriel.id, sub_category_id: ollie.id, you_tube_key: "4-Y8Dsmh7fE")
interaction1 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_ollie2.id, viewed: true)

video_ollie3 = Video.create!(title: "high ollie", rating: 54, difficulty: "rookie",
  user_id: gabriel.id, sub_category_id: ollie.id, you_tube_key: "ewS6fbFszo8")
interaction2 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_ollie3.id, viewed: true)

video_nollie = Video.create!(title: "crack nollie", rating: 78, difficulty: "rookie",
  user_id: gabriel.id, sub_category_id: nollie.id, you_tube_key: "6N_Ku9HlhgA")
interaction2a = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_nollie.id, viewed: true)

video_nollie2 = Video.create!(title: "nollie slo-mo", rating: 78, difficulty: "rookie",
  user_id: gabriel.id, sub_category_id: nollie.id, you_tube_key: "fp_UMkZabvk")
interaction2b = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_nollie2.id, viewed: true)


video_frontside180 = Video.create!(title: "frontside 180 slo-mo", rating: 62, difficulty: "rookie",
  user_id: gabriel.id, sub_category_id: frontside180.id, you_tube_key: "__u6Kdqa0WA")
interaction2b = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_frontside180.id, viewed: true)

# category
intermediate = Category.create!(name: "intermediate")
# subcategory and interactions
varial_kickflip = SubCategory.create!(name: "varial kickflip", category_id: intermediate.id)
frontside_pop_shove_it = SubCategory.create!(name: "frontside pop shove it", category_id: intermediate.id)
frontside_180_ollie = SubCategory.create!(name: "frontside 180 ollie", category_id: intermediate.id)
fifty_fifty_grind = SubCategory.create!(name: "50-50 grind", category_id: intermediate.id)
# videos and interactions

video_varial_kickflip = Video.create!(title: "varial kickflip", rating: 101, difficulty: "Intermediate",
  user_id: gabriel.id, sub_category_id: varial_kickflip.id, you_tube_key: "KU9rxL-zDis")
interaction3 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_varial_kickflip.id, viewed: true)

video_frontside_pop_shove_it = Video.create!(title: "frontside pop shoveit", rating: 12, difficulty: "Intermediate",
  user_id: gabriel.id, sub_category_id: frontside_pop_shove_it.id, you_tube_key: "9uU9lu7BzfQ")
interaction4 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_frontside_pop_shove_it.id, viewed: true)

video_frontside_180_ollie = Video.create!(title: "frontside 180 ollie", rating: 44, difficulty: "Intermediate",
  user_id: gabriel.id, sub_category_id: frontside_180_ollie.id, you_tube_key: "CJqXUfM67mU")
interaction5 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_frontside_180_ollie.id, viewed: true)

puts "Seed complete."
