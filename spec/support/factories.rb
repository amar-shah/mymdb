Factory.define:film do |film|
  film.name 'test film name'
  film.url 'http://www.simplybusiness.co.uk'
  film.description 'test film description'
  film.rating 3
end

Factory.define:admin do |admin|
  admin.email 'email@email.com'
  admin.password '123456'
end

Factory.define:user do |user|
  user.email 'email@email.com'
  user.password '123456'
end