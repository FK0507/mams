#中間テーブルはdb-seed記法ではなく、ActiveRecordで直接挿入します。
#その場合、再実行時される度にレコードが追加されるため、事前に初期化します。
#seed-fu外で挿入されたレコードは重複するため削除する
# TRUNCATEではなくDELETEなのは、sqlite3がTRUNCATEサポートしてないため
ActiveRecord::Base.connection.execute(  "DELETE FROM buyer_users;")

user1 = User.find_by_email("example5@m-match.com")
user1.buyers << Buyer.find_by_cname("買収工業")
user2 = User.find_by_email("example6@m-match.com")
user2.buyers << Buyer.find_by_cname("買収工業")

user3 = User.find_by_email("example7@m-match.com")
user3.buyers << Buyer.find_by_cname("買収鉄工所")
user4 = User.find_by_email("example8@m-match.com")
user4.buyers << Buyer.find_by_cname("買収鉄工所")