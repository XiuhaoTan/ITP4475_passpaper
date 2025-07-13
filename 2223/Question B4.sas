/* a. import dat.csv from the provided path and store it in variable ballot. */
proc import
	out = ballot
/* 	datafile = "/home/u44771062/Data/Ballot.csv" */
	datafile='/home/u64265971/4475_Lab06_1A/TrySaS.csv'
	dbms = csv
	replace;
run;



/* c.	Plot proportion of voter gender by template and sgrender proc. */
proc template;
	define statgraph piechart;
		begingraph;
			layout lattice / columns = 1 rows = 1;
				piechart category = gender / stat = freq;
			endlayout;
		endgraph;
	end;
run;

proc sgrender data = work.ballot template = piechart;
run;