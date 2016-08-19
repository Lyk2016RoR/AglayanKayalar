# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1 = User.create(email: "user@gmail.com", password: "123456")
u2 = User.create(email: "user2@gmail.com", password: "123456")

e1 = Editor.create(email: "editor@gmail.com", password: "123456")
e2 = Editor.create(email: "editor2@gmail.com", password: "123456")

Publisher.create(name: "Epsilon Yayınarı")
Publisher.create(name: "Kolektif Kitap")
Publisher.create(name: "Doğan Kitap")
Publisher.create(name: "Can Yayınları")
Publisher.create(name: "Yapı Kredi Yayınları")
Publisher.create(name: "İş Bankası Kültür Yayınları")
Publisher.create(name: "Can Yayınları")
Publisher.create(name: "Everest Yayınları")
Publisher.create(name: "Pegasus")
Publisher.create(name: "Dergah Yayınları")
Publisher.create(name: "İletişim Yayıncılık")
Publisher.create(name: "Timaş Yayınları")
Publisher.create(name: "Alfa Yayıncılık")
Publisher.create(name: "Kırmızı Kedi")

Author.create(name: "Rifat", surname: "Ilgaz", biography: "Benim adim rifat ilgaz")
Author.create(name: "Albert", surname:"Camus", biography: "Benim adım albert camus")
Author.create(name: "Alexandre Dumas", surname:"Pere", biography: "Benim adım Dumas pere")
Author.create(name: "Alphonse", surname:"Daudet", biography: "Benim adım Alphonse")
Author.create(name: "Anatole", surname: "France", biography: "Benim adım Anatole")
Author.create(name: "Andre" ,surname: "Gide", biography: "Benim adım Andre")
Author.create(name: "Anton Pavloviç", surname:"Çehov", biography: "Benim adım anton")
Author.create(name: "Emile", surname:"Zola", biography: "Benim adım emile")
Author.create(name: "Erich Maria", surname:"Remarque", biography: "Benim adım erich")
Author.create(name: "Ernest", surname:"Hemıngway", biography: "Benim adım ernest")
Author.create(name: "George", surname:"Sand", biography: "Benim adım george")

Interpreter.create(name:"Orhan", surname: "Pamuk")
Interpreter.create(name:"Oguz", surname: "Atay")
Interpreter.create(name:"Peyami", surname: "Safa")
Interpreter.create(name:"Sait Faik", surname: "Abasıyanık")
Interpreter.create(name:"Orhan", surname: "Kemal")
Interpreter.create(name:"Nazım", surname:"Hikmet")
Interpreter.create(name:"Aziz", surname:"Nesin")
Interpreter.create(name:"Yaşar", surname:"Kemal")
Interpreter.create(name: "Necip FazıL", surname:"Kısakürek")

Category.create(title:"Felsefe")
Category.create(title:"Din-Mİtoloji")
Category.create(title:"Araştırma-Tarih")
Category.create(title:"Mizah")
Category.create(title:"Çizgi Roman")
Category.create(title:"Sanat-Tasarım")
Category.create(title:"Çocuk ve Gençlik")
Category.create(title:"Edebiyat")
Category.create(title:"Foreign Languages")

Book.create(name: "Felsefe Kitabı", description: "Felsefe Özeti", page_count: 240,
publication_year: "2016-08-12", ISBN: 123123, category_id: 1, publisher_id: 2, interpreter_id: 3, author_id: 1)
Book.create(name: "Din Kitabı", description: "Din Özeti", page_count: 100,
publication_year: "2010-11-25", ISBN: 478975, category_id: 2, publisher_id: 3, interpreter_id: 5, author_id: 2)
Book.create(name: "Ataştırma Kitabı", description: "Araştırma Özeti", page_count: 150,
publication_year: "1990-01-05", ISBN: 789745, category_id: 3, publisher_id: 1, interpreter_id: 2, author_id: 3)
Book.create(name: "Mizah Kitabı", description: " Mizah Özeti", page_count: 121,
publication_year: "1900-04-04", ISBN: 97854, category_id: 4, publisher_id: 6, interpreter_id: 4, author_id: 4)
Book.create(name: "Edebiyat Kitabı", description: "Edebiyat Özeti", page_count: 110,
publication_year: "1980-08-08", ISBN: 687997, category_id: 5, publisher_id: 5, interpreter_id: 1, author_id: 5)
Book.create(name: "Çocuk Kitabı", description: "Çocuk Özeti", page_count: 850,
publication_year: "2000-08-11", ISBN: 456123, category_id: 6, publisher_id: 4, interpreter_id: 1, author_id: 6)

Bcomment.create(body: "Süper Kitap" , user_id: 1 , book_id: 1)
Bcomment.create(body: "Kötü Kitap" , user_id: 2 , book_id: 2)
Bcomment.create(body: "İdare eder Kitap" , user_id: 1 , book_id: 3)
Bcomment.create(body: "Eh işte Kitap" , user_id: 2 , book_id: 4)
Bcomment.create(body: "Berbat Kitap" , user_id: 2 , book_id: 5)
Bcomment.create(body: "Omg Kitap" , user_id: 1 , book_id: 6)
Bcomment.create(body: "Dandik Kitap" , user_id: 2 , book_id: 1)


Acomment.create(body: "Süper Kitap" , user_id: 1 , author_id: 1)
Acomment.create(body: "Kötü Kitap" , user_id: 2 , author_id: 2)
Acomment.create(body: "İdare eder Kitap" , user_id: 1 , author_id: 3)
Acomment.create(body: "Eh işte Kitap" , user_id: 2 , author_id: 4)
Acomment.create(body: "Berbat Kitap" , user_id: 2 , author_id: 5)
Acomment.create(body: "Omg Kitap" , user_id: 1 , author_id: 6)
Acomment.create(body: "Dandik Kitap" , user_id: 2 , author_id: 1)
