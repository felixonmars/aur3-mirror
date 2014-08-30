CXX=g++
CXXFLAGS=-DIB_USE_STD_STRING -Wall -Wno-switch -g
ROOT_DIR=source/PosixClient
BASE_SRC_DIR=${ROOT_DIR}/src
INCLUDES=-I${ROOT_DIR}/Shared/ -I${BASE_SRC_DIR}

default:
	$(CXX) $(CXXFLAGS) $(INCLUDES) -fpic -o EClientSocketBase.o -c $(BASE_SRC_DIR)/EClientSocketBase.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -fpic -o EPosixClientSocket.o -c $(BASE_SRC_DIR)/EPosixClientSocket.cpp
	$(CXX) -shared -o libtwsapi.so EClientSocketBase.o EPosixClientSocket.o

clean:
	rm -f $(TARGET) *.o
