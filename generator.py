import csv, sys

def main(line, table_name):
  for i in range(len(line)):
    try:
      int(line[i])
    except:
      line[i] = '\"' + line[i] + '\"'

  statement = """INSERT INTO {}\nVALUES ({});\n""".format(table_name, ', '.join(line))
  return statement

def write_file(table_name):
  lines = []
  with open('{}.csv'.format(table_name)) as csv_file:
      csv_reader = csv.reader(csv_file, delimiter=',')
      line_count = 0
      for row in csv_reader:
          lines.append(main(row, table_name))
          line_count += 1
      print(f'Processed {line_count} lines.')

  with open('data/{}.sql'.format(table_name), 'w') as f:
    f.write('\n'.join(lines))

table = sys.argv[1]
write_file(table)
