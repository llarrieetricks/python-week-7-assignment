filename = input("Enter the filename to read: ")

try:
    with open(filename, "r") as file:
        content = file.read()
        print("content of file:")
        print(content)
except FileNotFoundError:
    print("That file does not exist.")
except PermissionError:
    print(" You don’t have permission to read that file.")
except Exception as e:
    print(f"⚠️ An unexpected error occurred: {e}")
