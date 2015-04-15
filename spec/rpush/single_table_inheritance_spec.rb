require_relative '../rails_helper'

describe 'Rpush App' do
  %w[Gcm Apns Wpns].each do |app_type|
    %w[Gcm Apns Wpns].each do |test_type|
      if app_type == test_type
        it "An #{app_type} app should be included in the collection of #{test_type} apps" do
          app = Rpush.const_get(app_type)::App.new(name: "#{app_type} app")
          app.save(validate: false)
          expect(Rpush.const_get(test_type)::App.all).to include(app)
        end
      else
        it "An #{app_type} app should NOT be included in the collection of #{test_type} apps" do
          app = Rpush.const_get(app_type)::App.new(name: "#{app_type} app")
          app.save(validate: false)
          expect(Rpush.const_get(test_type)::App.all).not_to include(app)
        end
      end
    end
  end
end

describe 'Rpush Notification' do
  %w[Gcm Apns Wpns].each do |notification_type|
    %w[Gcm Apns Wpns].each do |test_type|
      if notification_type == test_type
        it "An #{notification_type} notification should be included in the collection of #{test_type} notifications" do
          notification = Rpush.const_get(notification_type)::Notification.new(name: "#{notification_type} notification")
          notification.save(validate: false)
          expect(Rpush.const_get(test_type)::Notification.all).to include(notification)
        end
      else
        it "An #{notification_type} notification should NOT be included in the collection of #{test_type} notifications" do
          notification = Rpush.const_get(notification_type)::Notification.new(name: "#{notification_type} notification")
          notification.save(validate: false)
          expect(Rpush.const_get(test_type)::Notification.all).not_to include(notification)
        end
      end
    end
  end
end
