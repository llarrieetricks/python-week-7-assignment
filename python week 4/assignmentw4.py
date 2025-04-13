def calculate_discount(price, discount_percent):
    """
    Calculate the final price after applying discount if the discount is 30% or more.
    
    Parameters:
    price (float): The original price of the item.
    discount_percent (float): The discount percentage.

    Returns:
    float: The final price after applying discount or original price if discount < 20%.
    """
    if discount_percent >= 30:
        discount_amount = (discount_percent / 100) * price
        return price - discount_amount
    else:
        return price

try:
    original_price = float(input("Enter the original price of the item: "))
    discount = float(input("Enter the discount percentage: "))

    final_price = calculate_discount(original_price, discount)

    if discount >= 30:
        print(f"Discount applied. Final price: ${final_price:.2f}")
    else:
        print(f"No discount applied. Final price: ${final_price:.2f}")

except ValueError:
    print("Please enter valid numeric values for price and discount.")
