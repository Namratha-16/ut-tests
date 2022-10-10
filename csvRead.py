import csv

row = 2; col = 3  # A2 = (2,1) cell
with open("PLOT.csv") as f:
    reader = csv.reader(f)
    for i in range(row):
        row = next(reader)  
    value = row[col-1]  # because python index starts at zero
print(value)



