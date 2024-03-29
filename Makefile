NAME=lzss0
EXT=so

ifeq ($(OS),Windows_NT)
EXT=dll
endif

TARGET=$(NAME).$(EXT)

all: $(TARGET)

$(TARGET):
	python setup.py build_ext --inplace
	mv *.$(EXT) $(TARGET)

install:
	python setup.py install

uninstall:
	# --break-system-packages SPECIFICALLY for archlinux lol
	pip uninstall --break-system-packages $(NAME)

clean:
	rm -rf $(TARGET) build dist $(NAME).egg-info lzss0.c

.PHONY: all clean
