# Just install the scripts in my home directory...

DESTDIR = $(HOME)/bin
SOURCE  =  cstyle.pl regex.pl
OBJECTS =  cstyle regex

install: $(OBJECTS)

% : %.pl
	@echo -e "Installing $@..."
	@install -Dm755 $? $(DESTDIR)/$@
