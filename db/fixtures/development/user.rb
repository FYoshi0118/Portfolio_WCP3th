User.seed(:id,
  { id: 1, name_code: "@test1", nickname: "テスト1", email: "tester1@wcp.com", password: "password", status: 0 },
  { id: 2, name_code: "@test2", nickname: "テスト2", email: "tester2@wcp.com", password: "password", status: 0,
           introduction: "これはテストです。" },
  { id: 3, name_code: "@test3", nickname: "テスト3", email: "tester3@wcp.com", password: "password", status: 1 },
  { id: 4, name_code: "@test4", nickname: "テスト4", email: "tester4@wcp.com", password: "password", status: 2 },
  { id: 5, name_code: "@tozai", nickname: "東西", email: "tozai@wcp.com", password: "password", status: 0 }
)