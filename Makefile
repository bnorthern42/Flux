APP := flux.out

all: build

build:
	odin build . -out:$(APP)

run: build
	./$(APP)

clean:
	rm -f $(APP)
