require 'pry'
def nyc_pigeon_organizer(data)
  # write your code here!
  # new hash
  pigeons_by_name = {}
  # iterate over first level of hash
  data.each do |attribute, details|
    # iterate over second level of hash
    details.each do |detail, p_names|
      # access array of names
      p_names.each do |p_name|
        # if the pigeon's name is not already in the new hash, 
        # create a key for that pigeon and nest data about that pigeon
        if pigeons_by_name.include?(p_name) == false
          # create empty nested hash for new pigeon
          pigeons_by_name[p_name] = {}
        end
        # if the pigeon is already represented by a key in the new hash...
        if pigeons_by_name.include?(p_name) == true
          # if the current array in the original hash includes the pigeon we are adding to the new hash...
          if p_names.include?(p_name) == true
            # if the attribute is already in the new hash, add any new values to that key in the new hash
            if pigeons_by_name[p_name].include?(attribute) == true
              pigeons_by_name[p_name][attribute] << detail.to_s
            else
              # if the attribute for a pigeon doesn't exist in the new hash, create it
              pigeons_by_name[p_name][attribute] = []
              pigeons_by_name[p_name][attribute] << detail.to_s
            end
          end
        end
      end
    end
  end
  pigeons_by_name
end