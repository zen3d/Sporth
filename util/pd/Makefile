default: current

current: 
	@echo Usage: make pd_linux pd_darwin

clean: ; rm -f *.pd_linux *.o *.pd_darwin

# If you're building kona, this is where the kona directory is
K_PATH=~/playground/kona/kona

# Location of the soundpipe source code
SP_PATH=~/proj/soundpipe

SPORTH_O=`find ../ -name "*.o" | grep -v sporth~ | grep -v chorth`
SP_O=`find $(SP_PATH) -name "*.o" `

# make linux BUILD_KONA=1

ifdef BUILD_KONA
LDFLAGS += -lpthread -ldl -lm
FLAGS += -DBUILD_KONA 
K_O=`find $(K_PATH) -name "*.o" | egrep -v "\.t\.o"`
endif

# ----------------------- LINUX i386 -----------------------

pd_linux: sporth~.pd_linux 


.SUFFIXES: .pd_linux

LINUXCFLAGS = -DPD -O2 -funroll-loops -fomit-frame-pointer \
    -Wall -Wno-unused -Wno-parentheses -Wno-switch -fPIC -g

.c.pd_linux:
	cc $(LINUXCFLAGS) $(LINUXINCLUDE) -o $*.o -c $*.c
	#ld -shared -o $*.pd_linux $*.o $(SP_O) $(SPORTH_O) $(K_) -lc -lm -lsndfile
	ld -o $*.pd_linux $*.o -lc -lsporth -lsoundpipe -lsndfile -lm -shared
	strip --strip-unneeded $*.pd_linux
	rm $*.o

# ----------------------- Mac OSX -----------------------

pd_darwin: sporth~.pd_darwin

.SUFFIXES: .pd_darwin

DARWINCFLAGS = -DPD -O2 -Wall -W -Wshadow -Wstrict-prototypes \
    -Wno-unused -Wno-parentheses -Wno-switch -I/usr/local/include

DARWINLDFLAGS = -L/usr/local/lib -lsporth -lsoundpipe -lsndfile -lm  

.c.pd_darwin:
	cc $(DARWINCFLAGS) -o $*.o -c $*.c
	cc -bundle -undefined suppress -flat_namespace -o $*.pd_darwin $*.o $(DARWINLDFLAGS)
	rm -f $*.o

