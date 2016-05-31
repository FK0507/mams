#中間テーブルはdb-seed記法ではなく、ActiveRecordで直接挿入します。
#その場合、再実行時される度にレコードが追加されるため、事前に初期化します。
#seed-fu外で挿入されたレコードは重複するため削除する
# TRUNCATEではなくDELETEなのは、sqlite3がTRUNCATEサポートしてないため
ActiveRecord::Base.connection.execute(  "DELETE FROM seller_users;")

user1 = User.find_by_email("example1@m-match.com")
user1.sellers << Seller.find_by_cname("売却商店")
user2 = User.find_by_email("example2@m-match.com")
user2.sellers << Seller.find_by_cname("売却商店")

user3 = User.find_by_email("example3@m-match.com")
user3.sellers << Seller.find_by_cname("売却製作所")
user4 = User.find_by_email("example4@m-match.com")
user4.sellers << Seller.find_by_cname("売却製作所")