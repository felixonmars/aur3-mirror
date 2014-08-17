all: vsmatrix.so vsrandom.so

CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -Wno-unused-parameter -O3 -shared -g -I./VSExamples -I/usr/include/vapoursynth -fPIC

vsmatrix.so: ./VSMatrix/vsmatrix.cpp ./VSMatrix/matrix.h
	$(CXX) $(CXXFLAGS) ./VSMatrix/vsmatrix.cpp -o ./libvsmatrix.so

vsrandom.so: ./VSRandom/vsrandom.cpp ./VSRandom/random.h
	$(CXX) $(CXXFLAGS) ./VSRandom/vsrandom.cpp -o ./libvsrandom.so

clean:
	rm -rf *.so *.o

install:
	install -Dm755 libvsmatrix.so $(DESTDIR)/usr/lib/vapoursynth/libvsmatrix.so
	install -Dm755 libvsrandom.so $(DESTDIR)/usr/lib/vapoursynth/libvsrandom.so

