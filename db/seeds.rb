3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end
puts "3 topics created"

10.times do |blog|
  Blog.create!(
    topic_id: rand(1..3),
    title: "My Blog Post #{blog}",
    body: "Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum",
    status: 0
  )
end
puts "10 Blog posts created!"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end
puts "5 Skills created!"

7.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolo",
    main_image: "https://place-hold.it/600x400",
    thumb_image: "https://place-hold.it/350x200"
  )
end
puts "7 Ruby on Rails Portfolio items created!"

2.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title #{portfolio_item}",
    subtitle: "Angular",
    body:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolo",
    main_image: "https://place-hold.it/600x400",
    thumb_image: "https://place-hold.it/350x200"
  )
end
puts "2 Angular Portfolio items created!"

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "#{technology}"
  )
end
puts "3 technologies created!"
