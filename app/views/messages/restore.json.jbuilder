json.message @message.message
json.message_id @message.id
json.user_nickname @message.user.nickname
json.user_id @message.user.id
json.created_at @message.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.item_seller @seller_of_item
json.item_id @item