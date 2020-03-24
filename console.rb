require('pry-byebug')
require_relative('models/properties.rb')

#Properties.delete_all

property1 = Properties.new({'address' => 'Glasgow',
                            'value' => 50000,
                            'num_rooms' => 3,
                            'year_built' => 2015
                            })

property2 = Properties.new({'address' => 'Hamilton',
                            'value' => 70000,
                            'num_rooms' => 5,
                            'year_built' => 1999
                            })

property3 = Properties.new({'address' => 'East Kilbride',
                            'value' => 100000,
                            'num_rooms' => 4,
                            'year_built' => 2000
                            })
#Implement Save
#property1.save()
#property2.save()
#property3.save()
#Implement delete
#property1.delete()
#property2.delete()
#property3.delete()
#Implement update
#property1.address = "Blantyre"
#property1.value = 40000
#property1.update()

#Prints properties.all method
#output = Properties.all
#p output

output = Properties.find_by_id
p output



#binding.pry
nil
