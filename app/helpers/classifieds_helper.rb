module ClassifiedsHelper
  def list_station
    #take all ville in an array
    villes = Classified.group("ville").order("ville").pluck("ville")
    #iterate over the array
    list_of_station = []

    villes.each do |i|
        if Classified.where("ville":"#{i}").count > 10
          list_of_station.push(i)
        end
      end

  regions = ['66612786','66612960','66612917','66612918','66612972','66612919','66612803','66612962'] #Les trois vallées
  regions.each do |r|
    puts r 
    list_of_station << Resort.find_by_region_number(r).ville
    puts Resort.find_by_region_number(r).ville
  end


    return(list_of_station)

  end
end
