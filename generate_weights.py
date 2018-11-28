import numpy as np


file_to_read = "WeightsPrecision5.txt"
file_to_write = 'weights5.v'
num_of_bits = 5





print(np.binary_repr(-3, width=3))

with open(file_to_read,'r') as f:
    for line in f:
        weights_values = f.readlines()

for i in range(len(weights_values)):
    weights_values[i] = str(int(weights_values[i]))

weights_values.append('0')
weights_values.append('0')
print (weights_values)

weights_arr = []
i=0
for item in weights_values:
    binary_item = str(np.binary_repr(int(item), width=num_of_bits))
    weights_arr.append(binary_item)
    i += 1



weights_united = []
i = 0
while i<12286:
    weights_united.append(weights_arr[i]+weights_arr[i+1]+weights_arr[i+2])
    i+=3




print (weights_arr)
print(weights_united)
size = num_of_bits*3
with open(file_to_write, 'a') as the_file:
    i=0
    for item in weights_united:
        #binary_item = str(np.binary_repr(int(item),width = num_of_bits))
        string_to_write = "M[{}] <= {}'b{};\n".format(str(i),size,item)
        the_file.write(string_to_write)
        i+=1


print(weights_arr[len(weights_arr)-1],weights_arr[len(weights_arr)-2],weights_arr[len(weights_arr)-3],weights_arr[len(weights_arr)-4],weights_arr[len(weights_arr)-5],weights_arr[len(weights_arr)-6])
print(weights_united[len(weights_united)-1],weights_united[len(weights_united)-2])



