puts 'Cleaning Database'
Poll.destroy_all if Rails.env.development?
PollOption.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

user = User.create!(email: 'patrik@gmail.com', password: '123qwe')

p = Poll.create!(
  title: 'What is your favorite programming language?',
  user: user,
  started: false
)
p.poll_options.create!(description: 'Ruby')
p.poll_options.create!(description: 'Python')
p.poll_options.create!(description: 'JavaScript')
p.poll_options.create!(description: 'Java')

user2 = User.create!(email: 'johnson@gmail.com', password: '123qwe')

p2 = Poll.create!(
  title: 'What is your first language?',
  user: user2,
  started: false
)
p2.poll_options.create!(description: 'English')
p2.poll_options.create!(description: 'Japanese')
p2.poll_options.create!(description: 'Portuguese')

puts "#{User.count} users created, #{Poll.count} polls created, #{PollOption.count} polls options created."
