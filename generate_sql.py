import csv, sys

def convert_row(row):
  for i in range(len(row)):
    try:
      int(row[i])
    except:
      row[i] = '\"' + row[i] + '\"'

  return '({})'.format(','.join(row))


def write_file(table_name):
  initial_stmt = 'INSERT INTO {} VALUES\n'.format(table_name)
  lines = []
  with open('data/{}.csv'.format(table_name), encoding='utf-8-sig') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    for row in csv_reader:
      lines.append(convert_row(row))
    print('Processed {} lines.'.format(len(lines)))

  sql_stmt = initial_stmt + ',\n'.join(lines) + ';'

  with open('src/{}.sql'.format(table_name), 'w') as f:
    f.write(sql_stmt)


write_file(sys.argv[1])
