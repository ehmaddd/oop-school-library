require 'json'
require_relative 'book'
require_relative 'person'

module PreserveDataModule
  include BookClass
  def preserve_book(books)
    book = "book.json"
    if File.exist?(book)
      preserve_data = books.map(&:to_hash)
      json = JSON.generate(preserve_data)
      File.write(book, json)
    else
      preserve_data = books.map(&:to_hash)
      json = JSON.generate(preserve_data)
      File.write(book, json, mode: "a")
    end
  end

  def preserve_member(members)
    member_file = "members.json"
    if File.exist?(member_file)
      preserve_data = members.map(&:to_hash)
      json = JSON.generate(preserve_data)
      File.write(member_file, json)
    else
      preserve_data = members.map(&:to_hash)
      json = JSON.generate(preserve_data)
      File.write(member_file, json, mode: "a")
    end
  end

  def preserve_rental(rentals)
    rental_file = "rentals.json"
    if File.exist?(rental_file)
      preserve_data = rentals.map(&:to_hash)
      json = JSON.generate(preserve_data)
      File.write(rental_file, json)
    else
      preserve_data = rentals.map(&:to_hash)
      json = JSON.generate(preserve_data)
      File.write(rental_file, json, mode: "a")
    end
  end

  def restore_books
    book = "book.json"
    if File.exist?(book)
      if File.empty?(book)
        return []
      else
        json_data = File.read(book)
        JSON.parse(json_data)
      end
    end
  end

  def restore_members
    members = "members.json"
    if File.exist?(members)
      if File.empty?(members)
        return []
      else
        json_data = File.read(members)
        JSON.parse(json_data)
      end
    end
  end
end

# object = {foo: 0, bar: 's', baz: :bat}
# json = JSON.generate(object)

# file = File.open("preserve_data.json")

# file_data = file.read
# puts file_data

# File.write("preserve_data.json", json, mode: "a")
# puts file_data
# file.close

# json = '["foo", 1, 1.0, 2.0e2, true, false, null]'
# ruby = JSON.parse(json)
# ruby
