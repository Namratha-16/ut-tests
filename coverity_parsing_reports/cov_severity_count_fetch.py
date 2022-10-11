import csv
with open(r'C:\Users\30370\Documents\Cov-report-parsing\sample.csv', newline='') as csvfile:
       issuereader = csv.reader(csvfile, delimiter=',', quotechar='|')
       a=[]
       b=[]
       c=0
       d=0
       e=0
       res=[]
       for row in issuereader:
              a.append(row[0])
              b.append(row[1])
              #print(row[1],row[0],row[3])

       for val in b:
              res.append(val)
high=res.count('" high"')
low=res.count('" low"')
med=res.count('" medium"')
print(high,low,med)


  #            if val=='" high"':
                     #c=c+1








# importing the csv module


#val=filter(lambda a: a==" high",a)
#print(list(val))




