all: vsmatrix.so vsrandom.so

CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -Wno-unused-parameter -O3 -shared -g -I./VSExamples -fPIC

vsmatrix.so: ./VSMatrix/vsmatrix.cpp ./VSMatrix/matrix.h
	$(CXX) $(CXXFLAGS) ./VSMatrix/vsmatrix.cpp -o ./vsmatrix.so

vsrandom.so: ./VSRandom/vsrandom.cpp ./VSRandom/random.h
	$(CXX) $(CXXFLAGS) ./VSRandom/vsrandom.cpp -o ./vsrandom.so


clean:
	rm -rf *.so *.o
