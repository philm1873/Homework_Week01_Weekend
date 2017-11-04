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

def remove_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
        shop[:pets].delete(pet)
    end
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
  if customer[:cash] < pet[:price]
    return false
  end
  return true
end

def sell_pet_to_customer(shop, pet, customer)
  if pet == nil
    return p "No such pet in shop"
  elsif customer_can_afford_pet(customer, pet) == false
    return p "Customer can't afford pet"
  else
    add_or_remove_cash(shop, pet[:price])

    add_pet_to_customer(customer, shop)

    stock_count(shop)

    increase_pets_sold(shop, 1)
  end
end
