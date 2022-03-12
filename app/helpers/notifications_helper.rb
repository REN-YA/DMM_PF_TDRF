module NotificationsHelper

   def notification_form(notification)
      @visiter = notification.visiter
      @review = nil
      your_product = link_to 'あなたの商品', stores_product_path(notification), style:"font-weight: bold;"
      @visiter_review = notification.review_id
      #notification.actionがfollowかlikeかcommentか
      case notification.action
        when "comment" then
            @review = Review.find_by(id: @visiter_review)&.content
            tag.a(@visiter.name, href:users_user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの商品', href:stores_product_path(notification.product_id), style:"font-weight: bold;")+"にレビューしました"
      end
    end

end

def unchecked_notifications
    @notifications = current_store.passive_notifications.where(checked: false)
end