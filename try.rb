require 'json'

arr = [{"title":"Zavia","author":"Ashfaq","rentals":[]},{"title":"Fire","author":"Musharraf","rentals":[]}]
arr = JSON.parse(arr);
arr.each { |ind| puts ind['title']}
