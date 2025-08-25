import math

def sigmoid(x): return 1 / (1 + math.exp(-x))

# inputs
x1, x2 = 0.5, 0.8

# weights and biases
w_hidden = [[0.2, 0.4], [0.3, 0.7]]
b_hidden = [0.1, 0.2]
w_out    = [0.6, 0.9]
b_out    = 0.3

# hidden layer
h1 = sigmoid(x1*w_hidden[0][0] + x2*w_hidden[0][1] + b_hidden[0])
h2 = sigmoid(x1*w_hidden[1][0] + x2*w_hidden[1][1] + b_hidden[1])

# output layer
out = sigmoid(h1*w_out[0] + h2*w_out[1] + b_out)

print("Output:", out)
