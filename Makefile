# Just install the scripts in my home directory...

DESTDIR = $(HOME)/bin
SOURCE  =  cdhist.pl cstyle.pl regex.pl rext.pl xkcd-dl.pl
OBJECTS =  cdhist cstyle regex rext xkcd-dl

install: $(OBJECTS)

% : %.pl
	@echo -e "Installing $@..."
	@install -Dm755 $? $(DESTDIR)/$@
