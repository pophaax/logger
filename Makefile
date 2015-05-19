#######################################################
#
#    Aland Sailing Robot
#    ===========================================
#    logger
#    -------------------------------------------
#
#######################################################

CC = g++
FLAGS = -Wall -pedantic -Werror -pthread -std=c++14
LIBS =  -lboost_system -lboost_log_setup -lboost_log -lboost_date_time -lboost_thread -lrt -lboost_filesystem

SOURCES = Logger.cpp
HEADERS = Logger.h
FILE = Logger.o



all : $(FILE)
$(FILE) : $(SOURCES) $(HEADERS)
	$(CC) $(SOURCES) $(FLAGS) $(LIBS) -c -o $(FILE)

example : $(SOURCES) $(HEADERS) example.cpp
	$(CC) $(SOURCES) example.cpp $(FLAGS) $(LIBS) -o example

#test : $(SOURCES) $(HEADERS) ../catch.hpp testLogger.cpp
#	$(CC) $(SOURCES) testLogger.cpp $(LIBS) -o test

metatest : $(SOURCES) $(HEADERS) $$SAILINGROBOTS_HOME/catch.hpp testLogger.cpp
	$(CC) $(SOURCES) testLogger.cpp -fprofile-arcs -ftest-coverage $(LIBS) -o metatest 


clean :
	rm -f $(FILE)
	rm -f example
	rm -f test
	rm -f metatest
	rm -f *.gcda
	rm -f *.gcno
	
metalog :
	make metatest
	./metatest
	gcov -r Logger.cpp
	grep -wE "(#####)" Logger.cpp.gcov >> metatestlog.txt	
	sed -i '1s/^/Codelines below not tested by test*.cpp\n/' metatestlog.txt
	gcov -r Logger.cpp >> metatestlog.txt
	make clean