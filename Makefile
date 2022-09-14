CFLAGS = -Wall -Wextra -Werror -mmacosx-version-min=10.9 -framework Foundation -framework IOBluetooth

all: build

build: blueutil

clean:
	$(RM) blueutil
