## Steps to reproduce the bug

1. Have Redis running (default config, port 6379 on localhost)
2. `bundle install`, `rake db:create`, `rake db:migrate` (the db will be db/development.sqlite3)
3. run `rspec`

12 of the 18 test cases fail:

```
rspec ./spec/rpush/single_table_inheritance_spec.rb:13 # Rpush App An Gcm app should NOT be included in the collection of Apns apps
rspec ./spec/rpush/single_table_inheritance_spec.rb:13 # Rpush App An Gcm app should NOT be included in the collection of Wpns apps
rspec ./spec/rpush/single_table_inheritance_spec.rb:13 # Rpush App An Apns app should NOT be included in the collection of Gcm apps
rspec ./spec/rpush/single_table_inheritance_spec.rb:13 # Rpush App An Apns app should NOT be included in the collection of Wpns apps
rspec ./spec/rpush/single_table_inheritance_spec.rb:13 # Rpush App An Wpns app should NOT be included in the collection of Gcm apps
rspec ./spec/rpush/single_table_inheritance_spec.rb:13 # Rpush App An Wpns app should NOT be included in the collection of Apns apps
rspec ./spec/rpush/single_table_inheritance_spec.rb:33 # Rpush Notification An Gcm notification should NOT be included in the collection of Apns notifications
rspec ./spec/rpush/single_table_inheritance_spec.rb:33 # Rpush Notification An Gcm notification should NOT be included in the collection of Wpns notifications
rspec ./spec/rpush/single_table_inheritance_spec.rb:33 # Rpush Notification An Apns notification should NOT be included in the collection of Gcm notifications
rspec ./spec/rpush/single_table_inheritance_spec.rb:33 # Rpush Notification An Apns notification should NOT be included in the collection of Wpns notifications
rspec ./spec/rpush/single_table_inheritance_spec.rb:33 # Rpush Notification An Wpns notification should NOT be included in the collection of Gcm notifications
rspec ./spec/rpush/single_table_inheritance_spec.rb:33 # Rpush Notification An Wpns notification should NOT be included in the collection of Apns notifications
```

This does not appear to happen with ActiveRecord storage, so it could be a bug in either `rpush` or `rpush-redis`.
