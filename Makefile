.PHONY: all clean

all: permtosh

permtosh:	
	chmod -R 777 $(CURDIR);
	echo "source $(CURDIR)/functions.sh" >> ~/.bash_profile;
	
#unmake :
#	rm -rf $(pwd)/.*
