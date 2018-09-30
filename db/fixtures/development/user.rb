User.seed(:id,
  { id: 1, nickname: "テスト1", email: "tester1@wcp.com", password: "password", status: 0 },
  { id: 2, nickname: "テスト2", email: "tester2@wcp.com", password: "password", status: 0,
           introduction: "これはテストです。" },
  { id: 3, nickname: "テスト3", email: "tester3@wcp.com", password: "password", status: 1 },
  { id: 4, nickname: "テスト4", email: "tester4@wcp.com", password: "password", status: 2 },
  { id: 5, nickname: "テスト太郎", email: "user@tarou.com", password: "password", status: 0 },
  { id: 6, nickname: "デバッグ太郎", email: "debug@tarou.com", password: "password", status: 0 }
)