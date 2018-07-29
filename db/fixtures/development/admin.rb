Admin.seed do |s|
  s.id = 1
  s.family_name = "管理者"
  s.given_name = "太郎"
  s.email = "kanrisya@tarou.com"
  s.password = "password"
  s.is_main_administer = "true"
  s.is_deleted = "false"
end

Admin.seed do |s|
  s.id = 2
  s.family_name = "管理者"
  s.given_name = "次郎"
  s.email = "kanrisya@jirou.com"
  s.password = "password"
  s.is_main_administer = "false"
  s.is_deleted = "false"
end

Admin.seed do |s|
  s.id = 3
  s.family_name = "管理者"
  s.given_name = "三郎"
  s.email = "kanrisya@saburou.com"
  s.password = "password"
  s.is_main_administer = "false"
  s.is_deleted = "true"
end