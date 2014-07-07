# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:

# run this task only on servers with the :db role in Capistrano
# see Capistrano roles section below
#every 3.hours, :roles => [:db] do
#  runner "MyModel.some_process"
#  rake "my:rake:task"
#  command "/usr/bin/my_great_command"
#end
#
#every 1.day, :at => '4:30 am', :roles => [:db] do
#  runner "MyModel.task_to_run_at_four_thirty_in_the_morning"
#end
#
#every :hour, :roles => [:db] do # Many shortcuts available: :hour, :day, :month, :year, :reboot
#  runner "SomeModel.ladeeda"
#end
#
#every :sunday, :at => '12pm', :roles => [:db] do # Use any day of the week or :weekend, :weekday
#  runner "Task.do_something_great"
#end
#
#every '0 0 27-31 * *', :roles => [:db] do
#  command "echo 'you can use raw cron syntax too'"
#end
#
#every :day, :at => '12:20am', :roles => [:db] do
#  rake "app_server:task"
#end

# end
# Learn more: http://github.com/javan/whenever

# After changing this script the crontab on the staging or production environment must be updated.
# Update crontab settings on staging envrionment
# cap staging whenever:update
# Update crontab setting on production environment
# cap production whenever:update
