import sys

dataset = [line.strip() for line in open('./dataRift.txt')]

outFile = open('./statesRift.txt', 'a')

for i in range(0,300):
	if (int(dataset[i]) < int(dataset[i+1])):
		outFile.write('1' + '\n')
	else:
		outFile.write('0' + '\n')

outFile.close()