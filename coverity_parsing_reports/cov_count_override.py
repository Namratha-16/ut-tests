import cov_severity_count_fetch as val
import csv

header = ['high', 'low','medium']
data = [val.high,val.low,val.med ]

with open(r'C:\Users\30370\Documents\Cov-report-parsing/PLOT.csv', 'w', encoding='UTF8') as f:
    writer = csv.writer(f)

    # write the header
    writer.writerow(header)

    # write the data
    writer.writerow(data)

