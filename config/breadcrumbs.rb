crumb :root do
  link "ホーム", root_path
end

# マイページ
crumb :mypage do 
  link "マイページ", mypages_path
  parent :root
end

# 検索
crumb :search do
  link "検索結果", search_items_path
  parent :root
end

# 商品一覧ページ
crumb :item_show do |item|
  link item.name, item_path(item.id)
  parent :root
end

# マイページから支払い方法
crumb :mypage_cards do 
  link "支払い方法", cards_path
  parent :mypage
end

# マイページからログアウト
crumb :mypage_logout do 
  link "ログアウト", destroy_user_session_path
  parent :mypage
end