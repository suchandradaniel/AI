def vacuum_cleaner(world, start):
    loc = start
    steps = 0
    print("Initial world:", world, "Vacuum at", loc)

    while "Dirty" in world.values():
        if world[loc] == "Dirty":
            print(f"Step {steps}: {loc} is Dirty → SUCK")
            world[loc] = "Clean"
        else:
            new_loc = "B" if loc == "A" else "A"
            print(f"Step {steps}: {loc} is Clean → MOVE to {new_loc}")
            loc = new_loc
        steps += 1

    print(f"Final world: {world}, Total steps = {steps}")


# Example
world = {"A": "Dirty", "B": "Dirty"}
vacuum_cleaner(world, start="A")
