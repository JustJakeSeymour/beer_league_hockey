# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@d2_mw = Division.create!(name: "D2 Mon/Wed", difficulty: 2, weekends: false)
@d2_s = Division.create!(name: "D2 South", difficulty: 2, weekends: true)
@d3_nu = Division.create!(name: "D3 North Upper", difficulty: 3, weekends: true)
@d3_nl = Division.create!(name: "D3 North Lower", difficulty: 3, weekends: true)
@d3_c = Division.create!(name: "D3 Central", difficulty: 3, weekends: true)
@d3_mt = Division.create!(name: "D3 Mon/Tues", difficulty: 3, weekends: false)
@d3_su = Division.create!(name: "D3 South Upper", difficulty: 3, weekends: true)
@d3_sl = Division.create!(name: "D3 South Lower", difficulty: 3, weekends: true)
@d4 = Division.create!(name: "D4", difficulty: 4, weekends: true)
@d5 = Division.create!(name: "D5", difficulty: 5, weekends: true)
@a = Division.create!(name: "A Division", difficulty: 1, weekends: false)
@w = Division.create!(name: "Women's", difficulty: 1, weekends: true)

@pigeons = @w.teams.create!(name: "Pigeons", won: 4, lost: 1, shootout_loss: 2, active_team: true)
@drunk_dragons = @w.teams.create!(name: "Drunk Dragons", won: 4, lost: 2, shootout_loss: 0, active_team: true)
@harley_quinns = @w.teams.create!(name: "Harley Quinns", won: 2, lost: 2, shootout_loss: 3, active_team: true)
@tomb_raiders = @w.teams.create!(name: "Tomb Raiders", won: 2, lost: 4, shootout_loss: 0, active_team: true)
@squad = @w.teams.create!(name: "Squad", won: 1, lost: 4, shootout_loss: 1, active_team: true)
@tbd_w = @w.teams.create!(name: "Women's TBD", won: 0, lost: 5, shootout_loss: 1, active_team: false)

@liquid_death = @a.teams.create!(name: "Liquid Death", won: 5, lost: 3, shootout_loss: 0, active_team: true)
@smartel = @a.teams.create!(name: "Smartel", won: 5, lost: 3, shootout_loss: 0, active_team: true)
@otters = @a.teams.create!(name: "Otters", won: 3, lost: 4, shootout_loss: 1, active_team: true)
@bison = @a.teams.create!(name: "Bison", won: 2, lost: 5, shootout_loss: 0, active_team: true)
@no_longer_a = @a.teams.create!(name: "No Longer", won: 0, lost: 7, shootout_loss: 0, active_team: false)

@hat_trick_swayzies = @d5.teams.create!(name: "Hat Trick Swayzies", won: 6, lost: 2, shootout_loss: 0, active_team: true)
@hat_trick_swayzies = @d5.teams.create!(name: "Terrordactyls", won: 2, lost: 6, shootout_loss: 0, active_team: true)
@ice_monkeys = @d5.teams.create!(name: "Ice Monkeys", won: 2, lost: 7, shootout_loss: 0, active_team: true)
@ice_dawgs = @d5.teams.create!(name: "Ice Dawgs", won: 0, lost: 8, shootout_loss: 0, active_team: true)
@bad_buoys = @d5.teams.create!(name: "Bad Buoys", won: 0, lost: 8, shootout_loss: 0, active_team: false)

@puck_n_warriors = @d4.teams.create!(name: "Puck 'n' Warriors", won: 8, lost: 0, shootout_loss: 0, active_team: true)
@blizzard_dawgs = @d4.teams.create!(name: "Blizzard Dawgs", won: 5, lost: 1, shootout_loss: 2, active_team: true)
@tnt = @d4.teams.create!(name: "TNT", won: 5, lost: 1, shootout_loss: 1, active_team: true)
@t_dacs = @d4.teams.create!(name: "T-Dacs", won: 5, lost: 3, shootout_loss: 0, active_team: true)
@breadfish = @d4.teams.create!(name: "Breadfish", won: 4, lost: 2, shootout_loss: 1, active_team: true)
@south_denver_degens = @d4.teams.create!(name: "South Denver Degens", won: 3, lost: 4, shootout_loss: 2, active_team: true)
@zamboloni = @d4.teams.create!(name: "Zamboloni", won: 2, lost: 4, shootout_loss: 1, active_team: true)
@mid_ice_crisis = @d4.teams.create!(name: "Mid Ice Crisis", won: 0, lost: 7, shootout_loss: 0, active_team: true)
@channel_4_news_team = @d4.teams.create!(name: "(Channel 4 News Team)", won: 0, lost: 7, shootout_loss: 0, active_team: true)
@d4_no_more = @d4.teams.create!(name: "No More", won: 0, lost: 7, shootout_loss: 0, active_team: false)

@thoroughblades = @d3_sl.teams.create!(name: "Thoroughblades", won: 7, lost: 2, shootout_loss: 1, active_team: true)
@good_fellas = @d3_sl.teams.create!(name: "Good Fellas", won: 7, lost: 2, shootout_loss: 0, active_team: true)
@mountaineers = @d3_sl.teams.create!(name: "Mountaineers", won: 5, lost: 1, shootout_loss: 0, active_team: true)
@gilmore_red_lions = @d3_sl.teams.create!(name: "Gilmore Red Lions", won: 4, lost: 3, shootout_loss: 0, active_team: true)
@netstix_n_chill = @d3_sl.teams.create!(name: "Netstix N Chill", won: 3, lost: 4, shootout_loss: 0, active_team: true)
@rocky_mountain_oysters = @d3_sl.teams.create!(name: "Rocky Mountain Oysters", won: 2, lost: 5, shootout_loss: 0, active_team: true)
@gone_homers = @d3_sl.teams.create!(name: "Gone Homers", won: 0, lost: 7, shootout_loss: 0, active_team: false)

@punx = @d3_su.teams.create!(name: "PUNX", won: 6, lost: 2, shootout_loss: 0, active_team: true)
@backdoor_bandits = @d3_su.teams.create!(name: "Backdoor Bandits", won: 6, lost: 2, shootout_loss: 0, active_team: true)
@monkey_wrench = @d3_su.teams.create!(name: "Monkey Wrench", won: 5, lost: 2, shootout_loss: 0, active_team: true)
@always_dark = @d3_su.teams.create!(name: "#Always Dark", won: 3, lost: 5, shootout_loss: 0, active_team: true)
@joint_forces = @d3_su.teams.create!(name: "Joint Forces", won: 3, lost: 4, shootout_loss: 0, active_team: true)
@unhealthy_scratch = @d3_su.teams.create!(name: "Unhealthy Scratch", won: 0, lost: 7, shootout_loss: 0, active_team: true)