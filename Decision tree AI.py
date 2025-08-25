# Simple Decision Tree (Play Tennis Example)

def decision_tree(outlook, temp, humidity, windy):
    if outlook == "Sunny":
        if humidity == "High":
            return "No"
        else:
            return "Yes"
    elif outlook == "Overcast":
        return "Yes"
    elif outlook == "Rainy":
        if windy == "True":
            return "No"
        else:
            return "Yes"

# Test cases
print("Sunny, Hot, High, False ->", decision_tree("Sunny", "Hot", "High", "False"))
print("Rainy, Mild, Normal, True ->", decision_tree("Rainy", "Mild", "Normal", "True"))
print("Overcast, Cool, High, True ->", decision_tree("Overcast", "Cool", "High", "True"))
