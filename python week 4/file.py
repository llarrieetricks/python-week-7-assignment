
try:
    with open("input.txt", "r") as infile:
        content = infile.read()

    # Modify the content (e.g., convert to uppercase)
    modified_content = content.upper()

    with open("output.txt", "w") as outfile:
        outfile.write(modified_content)

    print("✅ File has been modified and saved as output.txt")

except FileNotFoundError:
    print("input.txt not found.")
except Exception as e:
    print(f"⚠️ An error occurred: {e}")
