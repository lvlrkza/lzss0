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

clean:
	rm -rf $(TARGET) build dist $(NAME).egg-info lzss0.c

.PHONY: all clean
