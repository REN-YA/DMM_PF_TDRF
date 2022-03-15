module NotificationsHelper

def notification_form(notification)
    @visiter = notification.visiter
    @review = nil
    your_product = link_to 'あなたの商品', store_store_product_path(notification.product_id, current_store.id), style:"font-weight: bold;"
    @visiter_review = notification.review_id
    #notification.actionがfollowかlikeかcommentか
    case notification.action
    when "review" then
      @review = Review.find_by(id: @visiter_review)
      tag.a(@visiter.name, href:user_user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの商品', href:store_store_product_path(notification.product_id, current_store.id), style:"font-weight: bold;")+"にレビューしました"
    end
end

end

def unchecked_notifications
    @notifications = current_store.passive_notifications.where(checked: false)
end