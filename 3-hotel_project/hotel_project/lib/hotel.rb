require_relative "room"

class Hotel                      
  def initialize (name , hash)   #(INN,{a=>1,b=>2})hash is a hash of room names and capacities , name is a string
    @name=name                   #name of the hotel  = INN
    @rooms={}                     #hash of rooms {room_name => instance capacity} = {a=>1,b=>2}
    hash.each do |room_name, capacity|
        @rooms[room_name] = Room.new(capacity) 
     #{name=INN ,{a,capacity=1,occupants=[]}}
     
  end
#   ----------------------------------------------------
  def name
    @name.split(" ").map(&:capitalize).join(" ") #split the name and capitalize each word
  end
# -------------------------------------------------------------------
  def rooms        #getter for rooms
    @rooms
  end
# --------------------------------------------------------------------
  def room_exists?(room_name) #check if room exists
    @rooms.has_key?(room_name)   #if room exists return true
  end
# -------------------------------------------------------------------
  def check_in(person, room_name)        #check in a person to a room
    unless self.room_exists?(room_name) #if room does not exist return & puts "sorry, room does not exist"
      puts "sorry, room does not exist"
      return
    end
    success = @rooms[room_name].add_occupant(person) 
    if success
      puts "check in successful"
    else
      puts "sorry, room is full"
    end
  end
# --------------------------------------------------------------------
  def has_vacancy?
    @rooms.values.any? { |room| !room.full? }
  end
# --------------------------------------------------------------------
  def list_rooms
    @rooms.each { |name, room| puts "#{name} : #{room.available_space}" }
  end
end
# ---------------------------------------------------------------------
end
