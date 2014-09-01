TippGroup.create(name: "SuperTipper", user_id: 1, password:"password")
TippGroup.create(name: "Mix", user_id: 2, password:"password")
TippGroup.create(name: "User1", user_id: 10, password:"password")

(2..4).each do |n|
  GroupMember.create(user_id:n, tipp_group_id:1)
end
(1..10).each do |n|
  GroupMember.create(user_id:n, tipp_group_id:2) unless n == 2
end

(5..40).each do |n|
  GroupMember.create(user_id:n, tipp_group_id:3)
end
