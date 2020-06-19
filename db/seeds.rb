puts "Erasing all the work done so far..."
User.destroy_all
SubCategory.destroy_all
Video.destroy_all
Interaction.destroy_all
puts "Done with that!"
puts "Now putting some seeds in..."
# users
gabriel = User.create!(username: "tricksta101", email: "gabrieldcpaiva@gmail.com", password: "123456")
sophie = User.create!(username: "luckysevans", email: "sophie@gmail.com", password: "654321")
vinny = User.create!(username: "skatelondon12", email: "vinny@gmail.com", password: "123456")
user1 = User.create!(username: "rioskater77", email: "rioskater77@gmail.com", password: "123456")
user2 = User.create!(username: "skatergirl", email: "skatergirl@gmail.com", password: "123456")
user3 = User.create!(username: "deathskate3", email: "deathskate3@gmail.com", password: "123456")
user4 = User.create!(username: "sk8er", email: "sk8er@gmail.com", password: "123456")
user5 = User.create!(username: "skaterattleroll", email: "katerattleroll@gmail.com", password: "123456")
user6 = User.create!(username: "mickeyskate88", email: "mickeyskate88@gmail.com", password: "123456")
user7 = User.create!(username: "greatskate", email: "greatskate@gmail.com", password: "123456")
user8 = User.create!(username: "kateskate5", email: "kate@gmail.com", password: "123456")
user9 = User.create!(username: "ollie_frontside1", email: "ollie@gmail.com", password: "123456")
user9 = User.create!(username: "pop1980", email: "pop@gmail.com", password: "123456")
# subcategory
ollie = SubCategory.create!(name: "ollie", difficulty: "rookie")
nollie = SubCategory.create!(name: "nollie", difficulty: "rookie")
shuvit = SubCategory.create!(name: "shuvit", difficulty: "rookie")
frontside180 = SubCategory.create!(name: "frontside 180", difficulty: "rookie")
kickflip = SubCategory.create!(name: "kickflip", difficulty: "rookie")
casperflip = SubCategory.create!(name: "casper flip", difficulty: "rookie")
frontside_ollie = SubCategory.create!(name: "frontside ollie", difficulty: "rookie")
drop_in = SubCategory.create!(name: "drop in", difficulty: "rookie")
# videos and interactions
video_ollie = Video.create!(title: "ollie slo-mo",
  user_id: gabriel.id, sub_category_id: ollie.id, you_tube_key: "QjuuRA-b94I")
interaction = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_ollie.id, viewed: true)
video_ollie2 = Video.create!(title: "ollie from above",
  user_id: sophie.id, sub_category_id: ollie.id, you_tube_key: "4-Y8Dsmh7fE")
interaction1 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_ollie2.id, viewed: true)
video_ollie3 = Video.create!(title: "high ollie",
  user_id: vinny.id, sub_category_id: ollie.id, you_tube_key: "ewS6fbFszo8")
interaction2 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_ollie3.id, viewed: true)
video_nollie = Video.create!(title: "crack nollie",
  user_id: gabriel.id, sub_category_id: nollie.id, you_tube_key: "6N_Ku9HlhgA")
interaction2a = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_nollie.id, viewed: true)
video_nollie2 = Video.create!(title: "nollie slo-mo",
  user_id: sophie.id, sub_category_id: nollie.id, you_tube_key: "fp_UMkZabvk")
interaction2b = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_nollie2.id, viewed: true)
video_frontside180 = Video.create!(title: "frontside 180 slo-mo",
  user_id: gabriel.id, sub_category_id: frontside180.id, you_tube_key: "__u6Kdqa0WA")
interaction2b = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_frontside180.id, viewed: true)
# subcategory
varial_kickflip = SubCategory.create!(name: "varial kickflip", difficulty: "intermediate")
frontside_pop_shove_it = SubCategory.create!(name: "frontside pop shuvit", difficulty: "intermediate")
frontside_180_ollie = SubCategory.create!(name: "frontside 180 ollie", difficulty: "intermediate")
fifty_fifty_grind = SubCategory.create!(name: "50-50 grind", difficulty: "intermediate")
frontside_disaster = SubCategory.create!(name: "frontside disaster", difficulty: "intermediate")
board_slide = SubCategory.create!(name: "board slide", difficulty: "intermediate")
frontside_tailslide = SubCategory.create!(name: "frontside tailslide", difficulty: "intermediate")
threesixty_flip = SubCategory.create!(name: "360 flip", difficulty: "intermediate")
# videos and interactions
video_varial_kickflip = Video.create!(title: "clean varial kickflip",
  user_id: vinny.id, sub_category_id: varial_kickflip.id, you_tube_key: "ocFOCVHE0Ho")
interaction3 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_varial_kickflip.id, viewed: true)
video_frontside_pop_shove_it = Video.create!(title: "fs pop shuvit",
  user_id: gabriel.id, sub_category_id: frontside_pop_shove_it.id, you_tube_key: "Q_Fa2Fhi0FI")
interaction4 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_frontside_pop_shove_it.id, viewed: true)
video_frontside_180_ollie = Video.create!(title: "fs 180 ollie",
  user_id: gabriel.id, sub_category_id: frontside_180_ollie.id, you_tube_key: "_7omy5Vqi-0")
interaction5 = Interaction.create!(viewed_on: DateTime.now, user_id: sophie.id,
  video_id: video_frontside_180_ollie.id, viewed: true)
video_threesixty_flip = Video.create!(title: "360 flip super slo-mo",
  user_id: vinny.id, sub_category_id: frontside_180_ollie.id, you_tube_key: "h0ZCMsgjZgs")
# subcategory
gazelle_flip = SubCategory.create!(name: "gazelle flip", difficulty: "pro")
nollie_flip = SubCategory.create!(name: "nollie flip", difficulty: "pro")
fs_nosegrind = SubCategory.create!(name: "fs nosegrind", difficulty: "pro")
nollie_heel_flip = SubCategory.create!(name: "nollie heelflip", difficulty: "pro")
fs_smithgrind = SubCategory.create!(name: "fs smith grind", difficulty: "pro")
hard_flip = SubCategory.create!(name: "hard flip", difficulty: "pro")
frontside_ollie = SubCategory.create!(name: "frontside ollie", difficulty: "pro")
threesixty_shuvit = SubCategory.create!(name: "360 shuvit", difficulty: "pro")
backside_tailslide = SubCategory.create!(name: "backside tailslide", difficulty: "pro")
crooked_grind = SubCategory.create!(name: "crooked grind", difficulty: "pro")
blunt_fakie = SubCategory.create!(name: "blunt fakie", difficulty: "pro")
frontside_blunt = SubCategory.create!(name: "frontside blunt", difficulty: "pro")
# videos
video_gazelle_flip = Video.create!(title: "quick gazelle flip",
  user_id: sophie.id, sub_category_id: gazelle_flip.id, you_tube_key: "3S9FM0W0rm0")
video_gazelle_flip2 = Video.create!(title: "720 gazelle flip",
  user_id: sophie.id, sub_category_id: gazelle_flip.id, you_tube_key: "h-hKDXxvPxk")
video_gazelle_flip3 = Video.create!(title: "fakie gazelle flip",
  user_id: sophie.id, sub_category_id: gazelle_flip.id, you_tube_key: "uUQKKHStR3c")
nollie_flip_video = Video.create!(title: "nose manual nollie flip",
  user_id: sophie.id, sub_category_id: nollie_flip.id, you_tube_key: "90mKo6iXTZQ")
fs_nosegrind_video = Video.create!(title: "fs nosegrind fast n slo",
  user_id: sophie.id, sub_category_id: fs_nosegrind.id, you_tube_key: "Acx4qNTUIk8")
nollie_heel_flip_video = Video.create!(title: "nollie heelflip slomo",
  user_id: sophie.id, sub_category_id: nollie_heel_flip.id, you_tube_key: "2UYQXkuHXEo")
fs_smithgrind_video = Video.create!(title: "fs smithgrind loop",
  user_id: sophie.id, sub_category_id: fs_smithgrind.id, you_tube_key: "QB3yccR6HGA")
hard_flip_video = Video.create!(title: "fs smithgrind loop",
  user_id: sophie.id, sub_category_id: hard_flip.id, you_tube_key: "5RegzKzq3is")
frontside_ollie_video = Video.create!(title: "mini fs ollie",
  user_id: sophie.id, sub_category_id: frontside_ollie.id, you_tube_key: "Xt3e7Rj2R2M")
threesixty_shuvit_video = Video.create!(title: "360 pop shuvit repeat",
  user_id: sophie.id, sub_category_id: threesixty_shuvit.id, you_tube_key: "TIc-OJoAwl8")
puts "Seed complete."









