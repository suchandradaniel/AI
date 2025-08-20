import itertools

def solve_cryptarithmetic():
    # Example puzzle: SEND + MORE = MONEY
    letters = "SENDMORY"   # unique letters
    digits = "0123456789"

    for perm in itertools.permutations(digits, len(letters)):
        assign = dict(zip(letters, perm))
        if assign['S'] == '0' or assign['M'] == '0':  # no leading zero
            continue

        send  = int(assign['S']+assign['E']+assign['N']+assign['D'])
        more  = int(assign['M']+assign['O']+assign['R']+assign['E'])
        money = int(assign['M']+assign['O']+assign['N']+assign['E']+assign['Y'])

        if send + more == money:
            print("Solution found:")
            for k,v in assign.items():
                print(f"{k} = {v}")
            print(f"\n{send} + {more} = {money}")
            return

    print("No solution found.")

# Run
solve_cryptarithmetic()
