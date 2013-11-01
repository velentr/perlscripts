# Just install the scripts in my home directory...

DESTDIR = $(HOME)/bin
SOURCE  =  cstyle.pl regex.pl rext.pl
OBJECTS =  cstyle regex rext

install: $(OBJECTS)

% : %.pl
	@echo -e "Installing $@..."
	@install -Dm755 $? $(DESTDIR)/$@
