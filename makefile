.PHONY: all clean

files = summer-coding-notes.pdf

all: $(files)

%.pdf: %.txt
	pandoc -o $@ $<

clean:
	rm -f $(files)
