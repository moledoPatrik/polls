puts 'Cleaning Database'
Poll.destroy_all if Rails.env.development?
PollOption.destroy_all if Rails.env.development?

p = Poll.create!(title: 'What is your favorite programming language?', is_valid: false)
p.poll_options.create!(description: 'Ruby')
p.poll_options.create!(description: 'Python')
p.poll_options.create!(description: 'JavaScript')
p.poll_options.create!(description: 'Java')

puts "#{Poll.count} polls created, #{PollOption.count} polls options created."
