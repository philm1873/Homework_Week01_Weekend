def pet_shop_name(hash)
 return hash[:name]
end

def total_cash(hash)
  return hash[:admin][:total_cash]
end

def add_or_remove_cash(hash, amount)
   hash[:admin][:total_cash] += amount
end

def pets_sold(hash)
  return pets_sold = hash[:admin][:pets_sold]
end

def increase_pets_sold(hash1, amount)
  return hash1[:admin][:pets_sold] += amount
end

def stock_count(hash)
  pet_count = hash[:pets].length
  return pet_count
end

def pets_by_breed(hash, breed)
  count_of_pets = []
  for pets in hash[:pets]
    if pets[:breed] == breed
      count_of_pets.unshift(breed)
    end
  end
  return count_of_pets
end

def find_pet_by_name(hash, name)
  for pet in hash[:pets]
    if pet[:name] == name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(hash, name)
  for pet in hash[:pets]
    if pet[:name] == name
        hash[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(hash, new_pet)
  return hash[:pets].push(new_pet)
end

def customer_pet_count(array)
  return array[:pets].count
end

def add_pet_to_customer(array, hash)
  return array[:pets].push(hash)
end

def customer_can_afford_pet(array, hash)
  if array[:cash] < hash[:price]
    return false
  end
  return true
end

def sell_pet_to_customer(pet_shop_hash, pet_hash, customer_element_of_array)
  if pet_hash == nil
    return pet_hash
  elsif customer_can_afford_pet(customer_element_of_array, pet_hash) == false
    return p "Customer can't afford pet"  
  else
    add_or_remove_cash(pet_shop_hash , pet_hash[:price])

    add_pet_to_customer(customer_element_of_array, pet_shop_hash)

    stock_count(pet_shop_hash)

    increase_pets_sold(pet_shop_hash, 1)
  end
end
