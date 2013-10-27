# Just install the scripts in my home directory...

DESTDIR = $(HOME)/bin
SOURCE  =  regex.pl
OBJECTS =  regex

install: $(OBJECTS)

% : %.pl
	@echo -e "Installing $@..."
	@install -Dm755 $? $(DESTDIR)/$@
