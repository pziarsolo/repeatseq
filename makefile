# $* is prefix shared by target and dependent;  $@ is name of target file
CFLAGS = -c -O3 -Ibamtools/src -Ibamtools/build/src
OBJS= repeatseq.o structures.o CLParse.o
NAME= repeatseq

$(NAME): $(OBJS)
	g++ -o $@ $(OBJS) fastahack/Fasta.cpp fastahack/split.cpp -lpthread -lbamtools -Lbamtools/lib 

# Suffix rules: tell how to  take file with first suffix and make it into
#	file with second suffix
	
.cpp.o:
	g++ $(CFLAGS) $*.cpp	
clean:
	rm *.o
