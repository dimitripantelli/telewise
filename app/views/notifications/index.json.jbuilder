json.array! @notifications do |notification|
  json.user notification.user
  json.notifiable notification.notifiable
  json.url show_path(notification.notifiable.show, anchor: dom_id(notification.notifiable))
end
