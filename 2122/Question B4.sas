/* a.	import data HoroData.csv from the provided path and store it to variable Horo */
proc import
	out = Horo
/* 	datafile = '/home/u44771062/Data/HoroData.csv' */
	datafile = '/home/u64265971/4475_Lab06_1A/PersonalInfo.csv'
	dbms = csv
	replace;
run;

/* b. display SEVEN rows of data that the Horoscope is Gemini. */
proc print data = work.horo(obs=7);
/* WHERE Horo = “Gemini”; */
WHERE horo = 'Gemini';
run;

/* c.	Plot a bar chart about the average Weight of members by their Horoscope by */
/* template and sgrender proc. */
proc template;
	define statgraph barchart;
		begingraph;
			layout lattice / columns = 1 rows = 1;
/* 				barchart category = Horo response = height / stat = mean; */
				barchart category = horo response = height / stat = mean;
			endlayout;
		endgraph;
	end;
run;

proc sgrender data = work.horo template=barchart;
run;