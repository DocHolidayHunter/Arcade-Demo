INCDIRS = -Iinclude
CXX = skm g++ $(INCDIRS)
src = $(wildcard src/*.cpp)
obj = $(src:.cpp=.o)

LDFLAGS = -std=c++14

ifeq ($(OS),Windows_NT)
    LDFLAGS += -lstdc++fs
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        LDFLAGS += -lstdc++fs
    endif
endif

OSFLAGS = -O3

ArcadeMachine: $(obj)
	-.scripts/generate-stats.sh
	$(CXX) -o $@ $^ $(LDFLAGS) $(OSFLAGS)

clean:
	rm $(obj)
