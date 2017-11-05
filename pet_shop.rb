def pet_shop_name(shop)
 return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, amount)
   shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
  return pets_sold = shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, amount)
  return shop[:admin][:pets_sold] += amount
end

def stock_count(shop)
  pet_count = shop[:pets].length
  return pet_count
end

def pets_by_breed(shop, breed)
  count_of_pets = []
  for pets in shop[:pets]
    count_of_pets.unshift(breed) if (pets[:breed] == breed)
  end
  return count_of_pets
end

def find_pet_by_name(hash, name)
  for pet in hash[:pets]
    return pet if (pet[:name] == name)
  end
  return nil
end

def remove_pet_by_name(shop, name)
  for pet in shop[:pets]
    shop[:pets].delete(pet) if (pet[:name] == name)
  end
end

def add_pet_to_stock(shop, new_pet)
  return shop[:pets].push(new_pet)
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, pet)
  return customer[:pets].push(pet)
end

#OPTIONAL

def customer_can_afford_pet(customer, pet)
  return false if (customer[:cash] < pet[:price])
  return true
end

def sell_pet_to_customer(shop, pet, customer)
  return nil if (pet == nil || customer_can_afford_pet(customer, pet) == false)
  add_or_remove_cash(shop, pet[:price])
  add_pet_to_customer(customer, shop)
  stock_count(shop)
  increase_pets_sold(shop, 1)
end
