def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end


def increase_pets_sold(pet_shop, amt_sold_pets)
 pet_shop[:admin][:pets_sold] += amt_sold_pets
end

def stock_count(pet_shop)
 return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, breed)
  breed_count = []
  pet_array = pet_shop[:pets]
  for pet in pet_array
    if pet[:breed] == breed
      breed_count.push(breed)  # or << shovel operator
    end
  end
  return breed_count
end


def find_pet_by_name(pet_shop, name)
  pet_array = pet_shop[:pets]
  for pet in pet_array
    if pet[:name] == name
      return pet  # returns an object which is then accessed in the test by pet[:name]
    end
  end

  return nil

end

def remove_pet_by_name(pet_shop, name)
  removepet = find_pet_by_name(pet_shop, name)
  pet_shop[:pets].delete(removepet)
end


def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  answer = customer[:cash] -= amount
  return answer
end


def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)

  if customer_can_afford_pet(customer, pet) == true
    add_pet_to_customer(customer, pet)
    pets_sold(pet_shop)
    customer_cash(customer)
    total_cash(pet_shop)
  end

end
