import random

# Floor size
rows = 3
cols = 3

# 0 means Clean and 1 means Dirty
floor = []

# Creating random floor
for i in range(rows):
    row = []
    for j in range(cols):
        row.append(random.randint(0, 1))
    floor.append(row)

print("Initial Floor Condition")
print("0 = Clean and 1 = Dirty\n")

for row in floor:
    print(row)

# Vacuum starts from first tile
vacuum_row = 0
vacuum_col = 0

# Performance measurement
cleaned = 0
moves = 0

print("\nVacuum is placed at position (0,0)")
print("\nCleaning Started...\n")

# Move through the floor in a zig-zag pattern
for i in range(rows):

    # Even row -> left to right
    if i % 2 == 0:
        path = range(cols)

    # Odd row -> right to left
    else:
        path = range(cols - 1, -1, -1)

    for j in path:
        vacuum_row = i
        vacuum_col = j

        print("Vacuum at:", (i, j))

        # Simple Reflex Rule
        if floor[i][j] == 1:
            print("Tile is Dirty")
            print("Action: Clean")
            floor[i][j] = 0
            cleaned += 1
        else:
            print("Tile is already Clean")
            print("Action: Move")

        print()

        # Count movement between consecutive tiles
        if not (i == 0 and j == 0):
            moves += 1

print("Final Floor Condition")
for row in floor:
    print(row)

# Performance Measurement
print("\nPerformance Measurement")
print("-----------------------")
print("Tiles Cleaned :", cleaned)
print("Movement Steps:", moves)
print("Total Actions :", cleaned + moves)

# Check whether any dirty tile remains
dirty_left = 0
for row in floor:
    dirty_left += row.count(1)

if dirty_left == 0:
    print("Result        : Floor is completely clean")
else:
    print("Result        : Some tiles are still dirty")
