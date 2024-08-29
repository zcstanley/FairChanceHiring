options nocenter validvarname=any;

*---Read in space-delimited ascii file;

data new_data;


infile 'no-industry-fairChance.dat' lrecl=642 missover DSD DLM=' ' print;
input
  E8022801
  E8022802
  E8022803
  E8022804
  E8022805
  E8022806
  E8022807
  E8022808
  E8022809
  E8022810
  E8022811
  E8022812
  E8022901
  E8022902
  E8022903
  E8022904
  E8022905
  E8022906
  E8022907
  E8022908
  E8022909
  E8022910
  E8022911
  E8022912
  E8023001
  E8023002
  E8023003
  E8023004
  E8023005
  E8023006
  E8023007
  E8023008
  E8023009
  E8023010
  E8023011
  E8023012
  E8023101
  E8023102
  E8023103
  E8023104
  E8023105
  E8023106
  E8023107
  E8023108
  E8023109
  E8023110
  E8023111
  E8023112
  E8023201
  E8023202
  E8023203
  E8023204
  E8023205
  E8023206
  E8023207
  E8023208
  E8023209
  E8023210
  E8023211
  E8023212
  E8023301
  E8023302
  E8023303
  E8023304
  E8023305
  E8023306
  E8023307
  E8023308
  E8023309
  E8023310
  E8023311
  E8023312
  E8023401
  E8023402
  E8023403
  E8023404
  E8023405
  E8023406
  E8023407
  E8023408
  E8023409
  E8023410
  E8023411
  E8023412
  E8023501
  E8023502
  E8023503
  E8023504
  E8023505
  E8023506
  E8023507
  E8023508
  E8023509
  E8023510
  E8023511
  E8023512
  E8023601
  E8023602
  E8023603
  E8023604
  E8023605
  E8023606
  E8023607
  E8023608
  E8023609
  E8023610
  E8023611
  E8023612
  E8023701
  E8023702
  E8023703
  E8023704
  E8023705
  E8023706
  E8023707
  E8023708
  E8023709
  E8023710
  E8023711
  E8023712
  E8023801
  E8023802
  E8023803
  E8023804
  E8023805
  E8023806
  E8023807
  E8023808
  E8023809
  E8023810
  E8023811
  E8023812
  E8023901
  E8023902
  E8023903
  E8023904
  E8023905
  E8023906
  E8023907
  E8023908
  E8023909
  E8023910
  E8023911
  E8023912
  E8024001
  E8024002
  E8024003
  E8024004
  E8024005
  E8024006
  E8024007
  E8024008
  E8024009
  E8024010
  E8024011
  E8024012
  E8024101
  E8024102
  E8024103
  E8024104
  E8024105
  E8024106
  E8024107
  E8024108
  E8024109
  E8024110
  E8024111
  E8024112
  E8024201
  E8024202
  E8024203
  E8024204
  E8024205
  E8024206
  E8024207
  E8024208
  E8024209
  E8024210
  R0000100
  R0536300
  R0536401
  R0536402
  R1235800
  R1482600
  T2012100
  T2791000
  T3003100
  T3602100
  T4406100
  T4502600
  T5202300
  T6055600
  T6151500
  T6652100
  T7545700
  T7646000
  T8123700
  T8976800
  T9045900
  U0001900
  U0957000
  U1037200
  U1838600
  U2857300
  U2924600
  U3438000
  U4282400
  U4943100
  U5753600
  U5825500
  U5867700
  U5867800
;
array nvarlist _numeric_;


*---Recode missing values to SAS custom system missing. See SAS
      documentation for use of MISSING option in procedures, e.g. PROC FREQ;

do over nvarlist;
  if nvarlist = -1 then nvarlist = .R;  /* Refused */
  if nvarlist = -2 then nvarlist = .D;  /* Dont know */
  if nvarlist = -3 then nvarlist = .I;  /* Invalid missing */
  if nvarlist = -4 then nvarlist = .V;  /* Valid missing */
  if nvarlist = -5 then nvarlist = .N;  /* Non-interview */
end;

  label E8022801 = "2008 INCARCERATION STATUS L1";
  label E8022802 = "2008 INCARCERATION STATUS L2";
  label E8022803 = "2008 INCARCERATION STATUS L3";
  label E8022804 = "2008 INCARCERATION STATUS L4";
  label E8022805 = "2008 INCARCERATION STATUS L5";
  label E8022806 = "2008 INCARCERATION STATUS L6";
  label E8022807 = "2008 INCARCERATION STATUS L7";
  label E8022808 = "2008 INCARCERATION STATUS L8";
  label E8022809 = "2008 INCARCERATION STATUS L9";
  label E8022810 = "2008 INCARCERATION STATUS L10";
  label E8022811 = "2008 INCARCERATION STATUS L11";
  label E8022812 = "2008 INCARCERATION STATUS L12";
  label E8022901 = "2009 INCARCERATION STATUS L1";
  label E8022902 = "2009 INCARCERATION STATUS L2";
  label E8022903 = "2009 INCARCERATION STATUS L3";
  label E8022904 = "2009 INCARCERATION STATUS L4";
  label E8022905 = "2009 INCARCERATION STATUS L5";
  label E8022906 = "2009 INCARCERATION STATUS L6";
  label E8022907 = "2009 INCARCERATION STATUS L7";
  label E8022908 = "2009 INCARCERATION STATUS L8";
  label E8022909 = "2009 INCARCERATION STATUS L9";
  label E8022910 = "2009 INCARCERATION STATUS L10";
  label E8022911 = "2009 INCARCERATION STATUS L11";
  label E8022912 = "2009 INCARCERATION STATUS L12";
  label E8023001 = "2010 INCARCERATION STATUS L1";
  label E8023002 = "2010 INCARCERATION STATUS L2";
  label E8023003 = "2010 INCARCERATION STATUS L3";
  label E8023004 = "2010 INCARCERATION STATUS L4";
  label E8023005 = "2010 INCARCERATION STATUS L5";
  label E8023006 = "2010 INCARCERATION STATUS L6";
  label E8023007 = "2010 INCARCERATION STATUS L7";
  label E8023008 = "2010 INCARCERATION STATUS L8";
  label E8023009 = "2010 INCARCERATION STATUS L9";
  label E8023010 = "2010 INCARCERATION STATUS L10";
  label E8023011 = "2010 INCARCERATION STATUS L11";
  label E8023012 = "2010 INCARCERATION STATUS L12";
  label E8023101 = "2011 INCARCERATION STATUS L1";
  label E8023102 = "2011 INCARCERATION STATUS L2";
  label E8023103 = "2011 INCARCERATION STATUS L3";
  label E8023104 = "2011 INCARCERATION STATUS L4";
  label E8023105 = "2011 INCARCERATION STATUS L5";
  label E8023106 = "2011 INCARCERATION STATUS L6";
  label E8023107 = "2011 INCARCERATION STATUS L7";
  label E8023108 = "2011 INCARCERATION STATUS L8";
  label E8023109 = "2011 INCARCERATION STATUS L9";
  label E8023110 = "2011 INCARCERATION STATUS L10";
  label E8023111 = "2011 INCARCERATION STATUS L11";
  label E8023112 = "2011 INCARCERATION STATUS L12";
  label E8023201 = "2012 INCARCERATION STATUS L1";
  label E8023202 = "2012 INCARCERATION STATUS L2";
  label E8023203 = "2012 INCARCERATION STATUS L3";
  label E8023204 = "2012 INCARCERATION STATUS L4";
  label E8023205 = "2012 INCARCERATION STATUS L5";
  label E8023206 = "2012 INCARCERATION STATUS L6";
  label E8023207 = "2012 INCARCERATION STATUS L7";
  label E8023208 = "2012 INCARCERATION STATUS L8";
  label E8023209 = "2012 INCARCERATION STATUS L9";
  label E8023210 = "2012 INCARCERATION STATUS L10";
  label E8023211 = "2012 INCARCERATION STATUS L11";
  label E8023212 = "2012 INCARCERATION STATUS L12";
  label E8023301 = "2013 INCARCERATION STATUS L1";
  label E8023302 = "2013 INCARCERATION STATUS L2";
  label E8023303 = "2013 INCARCERATION STATUS L3";
  label E8023304 = "2013 INCARCERATION STATUS L4";
  label E8023305 = "2013 INCARCERATION STATUS L5";
  label E8023306 = "2013 INCARCERATION STATUS L6";
  label E8023307 = "2013 INCARCERATION STATUS L7";
  label E8023308 = "2013 INCARCERATION STATUS L8";
  label E8023309 = "2013 INCARCERATION STATUS L9";
  label E8023310 = "2013 INCARCERATION STATUS L10";
  label E8023311 = "2013 INCARCERATION STATUS L11";
  label E8023312 = "2013 INCARCERATION STATUS L12";
  label E8023401 = "2014 INCARCERATION STATUS L1";
  label E8023402 = "2014 INCARCERATION STATUS L2";
  label E8023403 = "2014 INCARCERATION STATUS L3";
  label E8023404 = "2014 INCARCERATION STATUS L4";
  label E8023405 = "2014 INCARCERATION STATUS L5";
  label E8023406 = "2014 INCARCERATION STATUS L6";
  label E8023407 = "2014 INCARCERATION STATUS L7";
  label E8023408 = "2014 INCARCERATION STATUS L8";
  label E8023409 = "2014 INCARCERATION STATUS L9";
  label E8023410 = "2014 INCARCERATION STATUS L10";
  label E8023411 = "2014 INCARCERATION STATUS L11";
  label E8023412 = "2014 INCARCERATION STATUS L12";
  label E8023501 = "2015 INCARCERATION STATUS L1";
  label E8023502 = "2015 INCARCERATION STATUS L2";
  label E8023503 = "2015 INCARCERATION STATUS L3";
  label E8023504 = "2015 INCARCERATION STATUS L4";
  label E8023505 = "2015 INCARCERATION STATUS L5";
  label E8023506 = "2015 INCARCERATION STATUS L6";
  label E8023507 = "2015 INCARCERATION STATUS L7";
  label E8023508 = "2015 INCARCERATION STATUS L8";
  label E8023509 = "2015 INCARCERATION STATUS L9";
  label E8023510 = "2015 INCARCERATION STATUS L10";
  label E8023511 = "2015 INCARCERATION STATUS L11";
  label E8023512 = "2015 INCARCERATION STATUS L12";
  label E8023601 = "2016 INCARCERATION STATUS L1";
  label E8023602 = "2016 INCARCERATION STATUS L2";
  label E8023603 = "2016 INCARCERATION STATUS L3";
  label E8023604 = "2016 INCARCERATION STATUS L4";
  label E8023605 = "2016 INCARCERATION STATUS L5";
  label E8023606 = "2016 INCARCERATION STATUS L6";
  label E8023607 = "2016 INCARCERATION STATUS L7";
  label E8023608 = "2016 INCARCERATION STATUS L8";
  label E8023609 = "2016 INCARCERATION STATUS L9";
  label E8023610 = "2016 INCARCERATION STATUS L10";
  label E8023611 = "2016 INCARCERATION STATUS L11";
  label E8023612 = "2016 INCARCERATION STATUS L12";
  label E8023701 = "2017 INCARCERATION STATUS L1";
  label E8023702 = "2017 INCARCERATION STATUS L2";
  label E8023703 = "2017 INCARCERATION STATUS L3";
  label E8023704 = "2017 INCARCERATION STATUS L4";
  label E8023705 = "2017 INCARCERATION STATUS L5";
  label E8023706 = "2017 INCARCERATION STATUS L6";
  label E8023707 = "2017 INCARCERATION STATUS L7";
  label E8023708 = "2017 INCARCERATION STATUS L8";
  label E8023709 = "2017 INCARCERATION STATUS L9";
  label E8023710 = "2017 INCARCERATION STATUS L10";
  label E8023711 = "2017 INCARCERATION STATUS L11";
  label E8023712 = "2017 INCARCERATION STATUS L12";
  label E8023801 = "2018 INCARCERATION STATUS L1";
  label E8023802 = "2018 INCARCERATION STATUS L2";
  label E8023803 = "2018 INCARCERATION STATUS L3";
  label E8023804 = "2018 INCARCERATION STATUS L4";
  label E8023805 = "2018 INCARCERATION STATUS L5";
  label E8023806 = "2018 INCARCERATION STATUS L6";
  label E8023807 = "2018 INCARCERATION STATUS L7";
  label E8023808 = "2018 INCARCERATION STATUS L8";
  label E8023809 = "2018 INCARCERATION STATUS L9";
  label E8023810 = "2018 INCARCERATION STATUS L10";
  label E8023811 = "2018 INCARCERATION STATUS L11";
  label E8023812 = "2018 INCARCERATION STATUS L12";
  label E8023901 = "2019 INCARCERATION STATUS L1";
  label E8023902 = "2019 INCARCERATION STATUS L2";
  label E8023903 = "2019 INCARCERATION STATUS L3";
  label E8023904 = "2019 INCARCERATION STATUS L4";
  label E8023905 = "2019 INCARCERATION STATUS L5";
  label E8023906 = "2019 INCARCERATION STATUS L6";
  label E8023907 = "2019 INCARCERATION STATUS L7";
  label E8023908 = "2019 INCARCERATION STATUS L8";
  label E8023909 = "2019 INCARCERATION STATUS L9";
  label E8023910 = "2019 INCARCERATION STATUS L10";
  label E8023911 = "2019 INCARCERATION STATUS L11";
  label E8023912 = "2019 INCARCERATION STATUS L12";
  label E8024001 = "2020 INCARCERATION STATUS L1";
  label E8024002 = "2020 INCARCERATION STATUS L2";
  label E8024003 = "2020 INCARCERATION STATUS L3";
  label E8024004 = "2020 INCARCERATION STATUS L4";
  label E8024005 = "2020 INCARCERATION STATUS L5";
  label E8024006 = "2020 INCARCERATION STATUS L6";
  label E8024007 = "2020 INCARCERATION STATUS L7";
  label E8024008 = "2020 INCARCERATION STATUS L8";
  label E8024009 = "2020 INCARCERATION STATUS L9";
  label E8024010 = "2020 INCARCERATION STATUS L10";
  label E8024011 = "2020 INCARCERATION STATUS L11";
  label E8024012 = "2020 INCARCERATION STATUS L12";
  label E8024101 = "2021 INCARCERATION STATUS L1";
  label E8024102 = "2021 INCARCERATION STATUS L2";
  label E8024103 = "2021 INCARCERATION STATUS L3";
  label E8024104 = "2021 INCARCERATION STATUS L4";
  label E8024105 = "2021 INCARCERATION STATUS L5";
  label E8024106 = "2021 INCARCERATION STATUS L6";
  label E8024107 = "2021 INCARCERATION STATUS L7";
  label E8024108 = "2021 INCARCERATION STATUS L8";
  label E8024109 = "2021 INCARCERATION STATUS L9";
  label E8024110 = "2021 INCARCERATION STATUS L10";
  label E8024111 = "2021 INCARCERATION STATUS L11";
  label E8024112 = "2021 INCARCERATION STATUS L12";
  label E8024201 = "2022 INCARCERATION STATUS L1";
  label E8024202 = "2022 INCARCERATION STATUS L2";
  label E8024203 = "2022 INCARCERATION STATUS L3";
  label E8024204 = "2022 INCARCERATION STATUS L4";
  label E8024205 = "2022 INCARCERATION STATUS L5";
  label E8024206 = "2022 INCARCERATION STATUS L6";
  label E8024207 = "2022 INCARCERATION STATUS L7";
  label E8024208 = "2022 INCARCERATION STATUS L8";
  label E8024209 = "2022 INCARCERATION STATUS L9";
  label E8024210 = "2022 INCARCERATION STATUS L10";
  label R0000100 = "PUBID - YTH ID CODE 1997";
  label R0536300 = "KEY!SEX (SYMBOL) 1997";
  label R0536401 = "KEY!BDATE M/Y (SYMBOL) 1997";
  label R0536402 = "KEY!BDATE M/Y (SYMBOL) 1997";
  label R1235800 = "CV_SAMPLE_TYPE 1997";
  label R1482600 = "KEY!RACE_ETHNICITY (SYMBOL) 1997";
  label T2012100 = "CV_CENSUS_REGION 2008";
  label T2791000 = "R CONVICTED OF FELONY SDLI? 2008";
  label T3003100 = "EST INC WAGES, TIPS PAST YR 2008";
  label T3602100 = "CV_CENSUS_REGION 2009";
  label T4406100 = "EST INC WAGES, TIPS PAST YR 2009";
  label T4502600 = "R CONVICTED OF FELONY SDLI? 2009";
  label T5202300 = "CV_CENSUS_REGION 2010";
  label T6055600 = "EST INC WAGES, TIPS PAST YR 2010";
  label T6151500 = "R CONVICTED OF FELONY SDLI? 2010";
  label T6652100 = "CV_CENSUS_REGION 2011";
  label T7545700 = "EST INC WAGES, TIPS PAST YR 2011";
  label T7646000 = "R CONVICTED OF FELONY SDLI? 2011";
  label T8123700 = "CV_CENSUS_REGION 2013";
  label T8976800 = "EST INC WAGES, TIPS PAST YR 2013";
  label T9045900 = "R CONVICTED OF FELONY SDLI? 2013";
  label U0001900 = "CV_CENSUS_REGION 2015";
  label U0957000 = "EST INC WAGES, TIPS PAST YR 2015";
  label U1037200 = "R CONVICTED OF FELONY SDLI? 2015";
  label U1838600 = "CV_CENSUS_REGION 2017";
  label U2857300 = "EST INC WAGES, TIPS PAST YR 2017";
  label U2924600 = "R CONVICTED OF FELONY SDLI? 2017";
  label U3438000 = "CV_CENSUS_REGION 2019";
  label U4282400 = "EST INC WAGES, TIPS PAST YR 2019";
  label U4943100 = "CV_CENSUS_REGION 2021";
  label U5753600 = "EST INC WAGES, TIPS PAST YR 2021";
  label U5825500 = "R CONVICTED OF FELONY SDLI? 2021";
  label U5867700 = "BKGRD CHK - TIME SINCE R LAST APP FOR JOB 2021";
  label U5867800 = "BKGRD CHK - WHEN EMP ASKD CONVCT HIST 2021";

/*---------------------------------------------------------------------*
 *  Crosswalk for Reference number & Question name                     *
 *---------------------------------------------------------------------*
 * Uncomment and edit this RENAME statement to rename variables
 * for ease of use.  You may need to use  name literal strings
 * e.g.  'variable-name'n   to create valid SAS variable names, or 
 * alter variables similarly named across years.
 * This command does not guarantee uniqueness

 * See SAS documentation for use of name literals and use of the
 * VALIDVARNAME=ANY option.     
 *---------------------------------------------------------------------*/
  /* *start* */

* RENAME
  E8022801 = 'INCARC_STATUS_2008.01_XRND'n
  E8022802 = 'INCARC_STATUS_2008.02_XRND'n
  E8022803 = 'INCARC_STATUS_2008.03_XRND'n
  E8022804 = 'INCARC_STATUS_2008.04_XRND'n
  E8022805 = 'INCARC_STATUS_2008.05_XRND'n
  E8022806 = 'INCARC_STATUS_2008.06_XRND'n
  E8022807 = 'INCARC_STATUS_2008.07_XRND'n
  E8022808 = 'INCARC_STATUS_2008.08_XRND'n
  E8022809 = 'INCARC_STATUS_2008.09_XRND'n
  E8022810 = 'INCARC_STATUS_2008.10_XRND'n
  E8022811 = 'INCARC_STATUS_2008.11_XRND'n
  E8022812 = 'INCARC_STATUS_2008.12_XRND'n
  E8022901 = 'INCARC_STATUS_2009.01_XRND'n
  E8022902 = 'INCARC_STATUS_2009.02_XRND'n
  E8022903 = 'INCARC_STATUS_2009.03_XRND'n
  E8022904 = 'INCARC_STATUS_2009.04_XRND'n
  E8022905 = 'INCARC_STATUS_2009.05_XRND'n
  E8022906 = 'INCARC_STATUS_2009.06_XRND'n
  E8022907 = 'INCARC_STATUS_2009.07_XRND'n
  E8022908 = 'INCARC_STATUS_2009.08_XRND'n
  E8022909 = 'INCARC_STATUS_2009.09_XRND'n
  E8022910 = 'INCARC_STATUS_2009.10_XRND'n
  E8022911 = 'INCARC_STATUS_2009.11_XRND'n
  E8022912 = 'INCARC_STATUS_2009.12_XRND'n
  E8023001 = 'INCARC_STATUS_2010.01_XRND'n
  E8023002 = 'INCARC_STATUS_2010.02_XRND'n
  E8023003 = 'INCARC_STATUS_2010.03_XRND'n
  E8023004 = 'INCARC_STATUS_2010.04_XRND'n
  E8023005 = 'INCARC_STATUS_2010.05_XRND'n
  E8023006 = 'INCARC_STATUS_2010.06_XRND'n
  E8023007 = 'INCARC_STATUS_2010.07_XRND'n
  E8023008 = 'INCARC_STATUS_2010.08_XRND'n
  E8023009 = 'INCARC_STATUS_2010.09_XRND'n
  E8023010 = 'INCARC_STATUS_2010.10_XRND'n
  E8023011 = 'INCARC_STATUS_2010.11_XRND'n
  E8023012 = 'INCARC_STATUS_2010.12_XRND'n
  E8023101 = 'INCARC_STATUS_2011.01_XRND'n
  E8023102 = 'INCARC_STATUS_2011.02_XRND'n
  E8023103 = 'INCARC_STATUS_2011.03_XRND'n
  E8023104 = 'INCARC_STATUS_2011.04_XRND'n
  E8023105 = 'INCARC_STATUS_2011.05_XRND'n
  E8023106 = 'INCARC_STATUS_2011.06_XRND'n
  E8023107 = 'INCARC_STATUS_2011.07_XRND'n
  E8023108 = 'INCARC_STATUS_2011.08_XRND'n
  E8023109 = 'INCARC_STATUS_2011.09_XRND'n
  E8023110 = 'INCARC_STATUS_2011.10_XRND'n
  E8023111 = 'INCARC_STATUS_2011.11_XRND'n
  E8023112 = 'INCARC_STATUS_2011.12_XRND'n
  E8023201 = 'INCARC_STATUS_2012.01_XRND'n
  E8023202 = 'INCARC_STATUS_2012.02_XRND'n
  E8023203 = 'INCARC_STATUS_2012.03_XRND'n
  E8023204 = 'INCARC_STATUS_2012.04_XRND'n
  E8023205 = 'INCARC_STATUS_2012.05_XRND'n
  E8023206 = 'INCARC_STATUS_2012.06_XRND'n
  E8023207 = 'INCARC_STATUS_2012.07_XRND'n
  E8023208 = 'INCARC_STATUS_2012.08_XRND'n
  E8023209 = 'INCARC_STATUS_2012.09_XRND'n
  E8023210 = 'INCARC_STATUS_2012.10_XRND'n
  E8023211 = 'INCARC_STATUS_2012.11_XRND'n
  E8023212 = 'INCARC_STATUS_2012.12_XRND'n
  E8023301 = 'INCARC_STATUS_2013.01_XRND'n
  E8023302 = 'INCARC_STATUS_2013.02_XRND'n
  E8023303 = 'INCARC_STATUS_2013.03_XRND'n
  E8023304 = 'INCARC_STATUS_2013.04_XRND'n
  E8023305 = 'INCARC_STATUS_2013.05_XRND'n
  E8023306 = 'INCARC_STATUS_2013.06_XRND'n
  E8023307 = 'INCARC_STATUS_2013.07_XRND'n
  E8023308 = 'INCARC_STATUS_2013.08_XRND'n
  E8023309 = 'INCARC_STATUS_2013.09_XRND'n
  E8023310 = 'INCARC_STATUS_2013.10_XRND'n
  E8023311 = 'INCARC_STATUS_2013.11_XRND'n
  E8023312 = 'INCARC_STATUS_2013.12_XRND'n
  E8023401 = 'INCARC_STATUS_2014.01_XRND'n
  E8023402 = 'INCARC_STATUS_2014.02_XRND'n
  E8023403 = 'INCARC_STATUS_2014.03_XRND'n
  E8023404 = 'INCARC_STATUS_2014.04_XRND'n
  E8023405 = 'INCARC_STATUS_2014.05_XRND'n
  E8023406 = 'INCARC_STATUS_2014.06_XRND'n
  E8023407 = 'INCARC_STATUS_2014.07_XRND'n
  E8023408 = 'INCARC_STATUS_2014.08_XRND'n
  E8023409 = 'INCARC_STATUS_2014.09_XRND'n
  E8023410 = 'INCARC_STATUS_2014.10_XRND'n
  E8023411 = 'INCARC_STATUS_2014.11_XRND'n
  E8023412 = 'INCARC_STATUS_2014.12_XRND'n
  E8023501 = 'INCARC_STATUS_2015.01_XRND'n
  E8023502 = 'INCARC_STATUS_2015.02_XRND'n
  E8023503 = 'INCARC_STATUS_2015.03_XRND'n
  E8023504 = 'INCARC_STATUS_2015.04_XRND'n
  E8023505 = 'INCARC_STATUS_2015.05_XRND'n
  E8023506 = 'INCARC_STATUS_2015.06_XRND'n
  E8023507 = 'INCARC_STATUS_2015.07_XRND'n
  E8023508 = 'INCARC_STATUS_2015.08_XRND'n
  E8023509 = 'INCARC_STATUS_2015.09_XRND'n
  E8023510 = 'INCARC_STATUS_2015.10_XRND'n
  E8023511 = 'INCARC_STATUS_2015.11_XRND'n
  E8023512 = 'INCARC_STATUS_2015.12_XRND'n
  E8023601 = 'INCARC_STATUS_2016.01_XRND'n
  E8023602 = 'INCARC_STATUS_2016.02_XRND'n
  E8023603 = 'INCARC_STATUS_2016.03_XRND'n
  E8023604 = 'INCARC_STATUS_2016.04_XRND'n
  E8023605 = 'INCARC_STATUS_2016.05_XRND'n
  E8023606 = 'INCARC_STATUS_2016.06_XRND'n
  E8023607 = 'INCARC_STATUS_2016.07_XRND'n
  E8023608 = 'INCARC_STATUS_2016.08_XRND'n
  E8023609 = 'INCARC_STATUS_2016.09_XRND'n
  E8023610 = 'INCARC_STATUS_2016.10_XRND'n
  E8023611 = 'INCARC_STATUS_2016.11_XRND'n
  E8023612 = 'INCARC_STATUS_2016.12_XRND'n
  E8023701 = 'INCARC_STATUS_2017.01_XRND'n
  E8023702 = 'INCARC_STATUS_2017.02_XRND'n
  E8023703 = 'INCARC_STATUS_2017.03_XRND'n
  E8023704 = 'INCARC_STATUS_2017.04_XRND'n
  E8023705 = 'INCARC_STATUS_2017.05_XRND'n
  E8023706 = 'INCARC_STATUS_2017.06_XRND'n
  E8023707 = 'INCARC_STATUS_2017.07_XRND'n
  E8023708 = 'INCARC_STATUS_2017.08_XRND'n
  E8023709 = 'INCARC_STATUS_2017.09_XRND'n
  E8023710 = 'INCARC_STATUS_2017.10_XRND'n
  E8023711 = 'INCARC_STATUS_2017.11_XRND'n
  E8023712 = 'INCARC_STATUS_2017.12_XRND'n
  E8023801 = 'INCARC_STATUS_2018.01_XRND'n
  E8023802 = 'INCARC_STATUS_2018.02_XRND'n
  E8023803 = 'INCARC_STATUS_2018.03_XRND'n
  E8023804 = 'INCARC_STATUS_2018.04_XRND'n
  E8023805 = 'INCARC_STATUS_2018.05_XRND'n
  E8023806 = 'INCARC_STATUS_2018.06_XRND'n
  E8023807 = 'INCARC_STATUS_2018.07_XRND'n
  E8023808 = 'INCARC_STATUS_2018.08_XRND'n
  E8023809 = 'INCARC_STATUS_2018.09_XRND'n
  E8023810 = 'INCARC_STATUS_2018.10_XRND'n
  E8023811 = 'INCARC_STATUS_2018.11_XRND'n
  E8023812 = 'INCARC_STATUS_2018.12_XRND'n
  E8023901 = 'INCARC_STATUS_2019.01_XRND'n
  E8023902 = 'INCARC_STATUS_2019.02_XRND'n
  E8023903 = 'INCARC_STATUS_2019.03_XRND'n
  E8023904 = 'INCARC_STATUS_2019.04_XRND'n
  E8023905 = 'INCARC_STATUS_2019.05_XRND'n
  E8023906 = 'INCARC_STATUS_2019.06_XRND'n
  E8023907 = 'INCARC_STATUS_2019.07_XRND'n
  E8023908 = 'INCARC_STATUS_2019.08_XRND'n
  E8023909 = 'INCARC_STATUS_2019.09_XRND'n
  E8023910 = 'INCARC_STATUS_2019.10_XRND'n
  E8023911 = 'INCARC_STATUS_2019.11_XRND'n
  E8023912 = 'INCARC_STATUS_2019.12_XRND'n
  E8024001 = 'INCARC_STATUS_2020.01_XRND'n
  E8024002 = 'INCARC_STATUS_2020.02_XRND'n
  E8024003 = 'INCARC_STATUS_2020.03_XRND'n
  E8024004 = 'INCARC_STATUS_2020.04_XRND'n
  E8024005 = 'INCARC_STATUS_2020.05_XRND'n
  E8024006 = 'INCARC_STATUS_2020.06_XRND'n
  E8024007 = 'INCARC_STATUS_2020.07_XRND'n
  E8024008 = 'INCARC_STATUS_2020.08_XRND'n
  E8024009 = 'INCARC_STATUS_2020.09_XRND'n
  E8024010 = 'INCARC_STATUS_2020.10_XRND'n
  E8024011 = 'INCARC_STATUS_2020.11_XRND'n
  E8024012 = 'INCARC_STATUS_2020.12_XRND'n
  E8024101 = 'INCARC_STATUS_2021.01_XRND'n
  E8024102 = 'INCARC_STATUS_2021.02_XRND'n
  E8024103 = 'INCARC_STATUS_2021.03_XRND'n
  E8024104 = 'INCARC_STATUS_2021.04_XRND'n
  E8024105 = 'INCARC_STATUS_2021.05_XRND'n
  E8024106 = 'INCARC_STATUS_2021.06_XRND'n
  E8024107 = 'INCARC_STATUS_2021.07_XRND'n
  E8024108 = 'INCARC_STATUS_2021.08_XRND'n
  E8024109 = 'INCARC_STATUS_2021.09_XRND'n
  E8024110 = 'INCARC_STATUS_2021.10_XRND'n
  E8024111 = 'INCARC_STATUS_2021.11_XRND'n
  E8024112 = 'INCARC_STATUS_2021.12_XRND'n
  E8024201 = 'INCARC_STATUS_2022.01_XRND'n
  E8024202 = 'INCARC_STATUS_2022.02_XRND'n
  E8024203 = 'INCARC_STATUS_2022.03_XRND'n
  E8024204 = 'INCARC_STATUS_2022.04_XRND'n
  E8024205 = 'INCARC_STATUS_2022.05_XRND'n
  E8024206 = 'INCARC_STATUS_2022.06_XRND'n
  E8024207 = 'INCARC_STATUS_2022.07_XRND'n
  E8024208 = 'INCARC_STATUS_2022.08_XRND'n
  E8024209 = 'INCARC_STATUS_2022.09_XRND'n
  E8024210 = 'INCARC_STATUS_2022.10_XRND'n
  R0000100 = 'PUBID_1997'n
  R0536300 = 'KEY!SEX_1997'n
  R0536401 = 'KEY!BDATE_M_1997'n
  R0536402 = 'KEY!BDATE_Y_1997'n
  R1235800 = 'CV_SAMPLE_TYPE_1997'n
  R1482600 = 'KEY!RACE_ETHNICITY_1997'n
  T2012100 = 'CV_CENSUS_REGION_2008'n
  T2791000 = 'YSAQ-443C5_2008'n
  T3003100 = 'YINC-1800_2008'n
  T3602100 = 'CV_CENSUS_REGION_2009'n
  T4406100 = 'YINC-1800_2009'n
  T4502600 = 'YSAQ-443C5_2009'n
  T5202300 = 'CV_CENSUS_REGION_2010'n
  T6055600 = 'YINC-1800_2010'n
  T6151500 = 'YSAQ-443C5_2010'n
  T6652100 = 'CV_CENSUS_REGION_2011'n
  T7545700 = 'YINC-1800_2011'n
  T7646000 = 'YSAQ-443C5_2011'n
  T8123700 = 'CV_CENSUS_REGION_2013'n
  T8976800 = 'YINC-1800_2013'n
  T9045900 = 'YSAQ-443C5_2013'n
  U0001900 = 'CV_CENSUS_REGION_2015'n
  U0957000 = 'YINC-1800_2015'n
  U1037200 = 'YSAQ-443C5_2015'n
  U1838600 = 'CV_CENSUS_REGION_2017'n
  U2857300 = 'YINC-1800_2017'n
  U2924600 = 'YSAQF-443C5_2017'n
  U3438000 = 'CV_CENSUS_REGION_2019'n
  U4282400 = 'YINC-1800_2019'n
  U4943100 = 'CV_CENSUS_REGION_2021'n
  U5753600 = 'YINC-1800_2021'n
  U5825500 = 'YSAQF-443C5_2021'n
  U5867700 = 'YEND-BACKGR1_2021'n
  U5867800 = 'YEND-BACKGR2_2021'n
;
  /* *finish* */

run;

proc means data=new_data n mean min max;
run;


/*---------------------------------------------------------------------*
 *  FORMATTED TABULATIONS                                              *
 *---------------------------------------------------------------------*
 * You can uncomment and edit the PROC FORMAT and PROC FREQ statements 
 * provided below to obtain formatted tabulations. The tabulations 
 * should reflect codebook values.
 * 
 * Please edit the formats below reflect any renaming of the variables
 * you may have done in the first data step. 
 *---------------------------------------------------------------------*/

/*
proc format; 
value vx0f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx1f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx2f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx3f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx4f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx5f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx6f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx7f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx8f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx9f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx10f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx11f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx12f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx13f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx14f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx15f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx16f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx17f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx18f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx19f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx20f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx21f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx22f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx23f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx24f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx25f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx26f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx27f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx28f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx29f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx30f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx31f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx32f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx33f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx34f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx35f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx36f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx37f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx38f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx39f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx40f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx41f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx42f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx43f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx44f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx45f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx46f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx47f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx48f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx49f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx50f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx51f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx52f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx53f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx54f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx55f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx56f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx57f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx58f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx59f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx60f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx61f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx62f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx63f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx64f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx65f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx66f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx67f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx68f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx69f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx70f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx71f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx72f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx73f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx74f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx75f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx76f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx77f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx78f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx79f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx80f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx81f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx82f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx83f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx84f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx85f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx86f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx87f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx88f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx89f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx90f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx91f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx92f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx93f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx94f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx95f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx96f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx97f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx98f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx99f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx100f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx101f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx102f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx103f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx104f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx105f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx106f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx107f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx108f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx109f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx110f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx111f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx112f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx113f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx114f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx115f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx116f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx117f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx118f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx119f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx120f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx121f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx122f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx123f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx124f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx125f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx126f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx127f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx128f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx129f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx130f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx131f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx132f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx133f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx134f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx135f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx136f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx137f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx138f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx139f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx140f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx141f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx142f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx143f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx144f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx145f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx146f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx147f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx148f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx149f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx150f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx151f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx152f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx153f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx154f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx155f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx156f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx157f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx158f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx159f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx160f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx161f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx162f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx163f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx164f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx165f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx166f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx167f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx168f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx169f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx170f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx171f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx172f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx173f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx174f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx175f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx176f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx177f
  0='0: R not incarcerated in this month and not incarcerated in a previous month'
  1='1: R was incarcerated during all or some of this month'
  99='99: R incarcerated previously but not in this month'
;
value vx178f
  0='0'
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
;
value vx179f
  1='Male'
  2='Female'
  0='No Information'
;
value vx180f
  1='1: January'
  2='2: February'
  3='3: March'
  4='4: April'
  5='5: May'
  6='6: June'
  7='7: July'
  8='8: August'
  9='9: September'
  10='10: October'
  11='11: November'
  12='12: December'
;
value vx182f
  1='Cross-sectional'
  0='Oversample'
;
value vx183f
  1='Black'
  2='Hispanic'
  3='Mixed Race (Non-Hispanic)'
  4='Non-Black / Non-Hispanic'
;
value vx184f
  1='Northeast (CT, ME, MA, NH, NJ, NY, PA, RI, VT)'
  2='North Central (IL, IN, IA, KS, MI, MN, MO, NE, OH, ND, SD, WI)'
  3='South (AL, AR, DE, DC, FL, GA, KY, LA, MD, MS, NC, OK, SC, TN , TX, VA, WV)'
  4='West (AK, AZ, CA, CO, HI, ID, MT, NV, NM, OR, UT, WA, WY)'
;
value vx185f
  1='YES'
  0='NO'
;
value vx186f
  1='A.  $1               -       $5,000'
  2='B.   $5,001      -     $10,000'
  3='C.   $10,001    -     $25,000'
  4='D.   $25,001    -     $50,000'
  5='E.    $50,001   -    $100,000'
  6='F.    $100,001       $250,000'
  7='G.    More than $250,000'
;
value vx187f
  1='Northeast (CT, ME, MA, NH, NJ, NY, PA, RI, VT)'
  2='North Central (IL, IN, IA, KS, MI, MN, MO, NE, OH, ND, SD, WI)'
  3='South (AL, AR, DE, DC, FL, GA, KY, LA, MD, MS, NC, OK, SC, TN , TX, VA, WV)'
  4='West (AK, AZ, CA, CO, HI, ID, MT, NV, NM, OR, UT, WA, WY)'
;
value vx188f
  1='A. $1 - $5,000'
  2='B. $5,001 - $10,000'
  3='C. $10,001 - $25,000'
  4='D. $25,001 - $50,000'
  5='E. $50,001 - $100,000'
  6='F. $100,001 - $250,000'
  7='G. More than $250,000'
;
value vx189f
  1='YES'
  0='NO'
;
value vx190f
  1='Northeast (CT, ME, MA, NH, NJ, NY, PA, RI, VT)'
  2='North Central (IL, IN, IA, KS, MI, MN, MO, NE, OH, ND, SD, WI)'
  3='South (AL, AR, DE, DC, FL, GA, KY, LA, MD, MS, NC, OK, SC, TN , TX, VA, WV)'
  4='West (AK, AZ, CA, CO, HI, ID, MT, NV, NM, OR, UT, WA, WY)'
;
value vx191f
  1='A. $1 - $5,000'
  2='B. $5,001 - $10,000'
  3='C. $10,001 - $25,000'
  4='D. $25,001 - $50,000'
  5='E. $50,001 - $100,000'
  6='F. $100,001 - $250,000'
  7='G. More than $250,000'
;
value vx192f
  1='YES'
  0='NO'
;
value vx193f
  1='Northeast (CT, ME, MA, NH, NJ, NY, PA, RI, VT)'
  2='North Central (IL, IN, IA, KS, MI, MN, MO, NE, OH, ND, SD, WI)'
  3='South (AL, AR, DE, DC, FL, GA, KY, LA, MD, MS, NC, OK, SC, TN , TX, VA, WV)'
  4='West (AK, AZ, CA, CO, HI, ID, MT, NV, NM, OR, UT, WA, WY)'
;
value vx194f
  1='A. $1 - $5,000'
  2='B. $5,001 - $10,000'
  3='C. $10,001 - $25,000'
  4='D. $25,001 - $50,000'
  5='E. $50,001 - $100,000'
  6='F. $100,001 - $250,000'
  7='G. More than $250,000'
;
value vx195f
  1='YES'
  0='NO'
;
value vx196f
  1='Northeast (CT, ME, MA, NH, NJ, NY, PA, RI, VT)'
  2='North Central (IL, IN, IA, KS, MI, MN, MO, NE, OH, ND, SD, WI)'
  3='South (AL, AR, DE, DC, FL, GA, KY, LA, MD, MS, NC, OK, SC, TN , TX, VA, WV)'
  4='West (AK, AZ, CA, CO, HI, ID, MT, NV, NM, OR, UT, WA, WY)'
;
value vx197f
  1='A. $1 - $5,000'
  2='B. $5,001 - $10,000'
  3='C. $10,001 - $25,000'
  4='D. $25,001 - $50,000'
  5='E. $50,001 - $100,000'
  6='F. $100,001 - $250,000'
  7='G. More than $250,000'
;
value vx198f
  1='YES'
  0='NO'
;
value vx199f
  1='Northeast (CT, ME, MA, NH, NJ, NY, PA, RI, VT)'
  2='North Central (IL, IN, IA, KS, MI, MN, MO, NE, OH, ND, SD, WI)'
  3='South (AL, AR, DE, DC, FL, GA, KY, LA, MD, MS, NC, OK, SC, TN , TX, VA, WV)'
  4='West (AK, AZ, CA, CO, HI, ID, MT, NV, NM, OR, UT, WA, WY)'
;
value vx200f
  1='A. $1 - $5,000'
  2='B. $5,001 - $10,000'
  3='C. $10,001 - $25,000'
  4='D. $25,001 - $50,000'
  5='E. $50,001 - $100,000'
  6='F. $100,001 - $250,000'
  7='G. More than $250,000'
;
value vx201f
  1='YES'
  0='NO'
;
value vx202f
  1='Northeast (CT, ME, MA, NH, NJ, NY, PA, RI, VT)'
  2='North Central (IL, IN, IA, KS, MI, MN, MO, NE, OH, ND, SD, WI)'
  3='South (AL, AR, DE, DC, FL, GA, KY, LA, MD, MS, NC, OK, SC, TN , TX, VA, WV)'
  4='West (AK, AZ, CA, CO, HI, ID, MT, NV, NM, OR, UT, WA, WY)'
;
value vx203f
  1='A. $1 - $5,000'
  2='B. $5,001 - $10,000'
  3='C. $10,001 - $25,000'
  4='D. $25,001 - $50,000'
  5='E. $50,001 - $100,000'
  6='F. $100,001 - $250,000'
  7='G. More than $250,000'
;
value vx204f
  1='YES'
  0='NO'
;
value vx205f
  1='Northeast (CT, ME, MA, NH, NJ, NY, PA, RI, VT)'
  2='North Central (IL, IN, IA, KS, MI, MN, MO, NE, OH, ND, SD, WI)'
  3='South (AL, AR, DE, DC, FL, GA, KY, LA, MD, MS, NC, OK, SC, TN , TX, VA, WV)'
  4='West (AK, AZ, CA, CO, HI, ID, MT, NV, NM, OR, UT, WA, WY)'
;
value vx206f
  1='A. $1 - $5,000'
  2='B. $5,001 - $10,000'
  3='C. $10,001 - $25,000'
  4='D. $25,001 - $50,000'
  5='E. $50,001 - $100,000'
  6='F. $100,001 - $250,000'
  7='G. More than $250,000'
;
value vx207f
  1='Northeast (CT, ME, MA, NH, NJ, NY, PA, RI, VT)'
  2='North Central (IL, IN, IA, KS, MI, MN, MO, NE, OH, ND, SD, WI)'
  3='South (AL, AR, DE, DC, FL, GA, KY, LA, MD, MS, NC, OK, SC, TN , TX, VA, WV)'
  4='West (AK, AZ, CA, CO, HI, ID, MT, NV, NM, OR, UT, WA, WY)'
;
value vx208f
  1='A. $1 - $5,000'
  2='B. $5,001 - $10,000'
  3='C. $10,001 - $25,000'
  4='D. $25,001 - $50,000'
  5='E. $50,001 - $100,000'
  6='F. $100,001 - $250,000'
  7='G. More than $250,000'
;
value vx209f
  1='YES'
  0='NO'
;
value vx210f
  1='I HAVE NEVER APPLIED FOR A JOB'
  2='LESS THAN 1 YEAR'
  3='1 TO 2 YEARS'
  4='3 TO 4 YEARS'
  5='5 TO 10 YEARS'
  6='MORE THAN 10 YEARS'
;
value vx211f
  1='At the initial application stage (i.e., on the application form)'
  2='At the interview stage, before the final hiring decision'
  3='After the final hiring decision'
  4='Never, the employer didn''t ask'
;
*/

/* 
 *--- Tabulations using reference number variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format E8022801 vx0f.;
  format E8022802 vx1f.;
  format E8022803 vx2f.;
  format E8022804 vx3f.;
  format E8022805 vx4f.;
  format E8022806 vx5f.;
  format E8022807 vx6f.;
  format E8022808 vx7f.;
  format E8022809 vx8f.;
  format E8022810 vx9f.;
  format E8022811 vx10f.;
  format E8022812 vx11f.;
  format E8022901 vx12f.;
  format E8022902 vx13f.;
  format E8022903 vx14f.;
  format E8022904 vx15f.;
  format E8022905 vx16f.;
  format E8022906 vx17f.;
  format E8022907 vx18f.;
  format E8022908 vx19f.;
  format E8022909 vx20f.;
  format E8022910 vx21f.;
  format E8022911 vx22f.;
  format E8022912 vx23f.;
  format E8023001 vx24f.;
  format E8023002 vx25f.;
  format E8023003 vx26f.;
  format E8023004 vx27f.;
  format E8023005 vx28f.;
  format E8023006 vx29f.;
  format E8023007 vx30f.;
  format E8023008 vx31f.;
  format E8023009 vx32f.;
  format E8023010 vx33f.;
  format E8023011 vx34f.;
  format E8023012 vx35f.;
  format E8023101 vx36f.;
  format E8023102 vx37f.;
  format E8023103 vx38f.;
  format E8023104 vx39f.;
  format E8023105 vx40f.;
  format E8023106 vx41f.;
  format E8023107 vx42f.;
  format E8023108 vx43f.;
  format E8023109 vx44f.;
  format E8023110 vx45f.;
  format E8023111 vx46f.;
  format E8023112 vx47f.;
  format E8023201 vx48f.;
  format E8023202 vx49f.;
  format E8023203 vx50f.;
  format E8023204 vx51f.;
  format E8023205 vx52f.;
  format E8023206 vx53f.;
  format E8023207 vx54f.;
  format E8023208 vx55f.;
  format E8023209 vx56f.;
  format E8023210 vx57f.;
  format E8023211 vx58f.;
  format E8023212 vx59f.;
  format E8023301 vx60f.;
  format E8023302 vx61f.;
  format E8023303 vx62f.;
  format E8023304 vx63f.;
  format E8023305 vx64f.;
  format E8023306 vx65f.;
  format E8023307 vx66f.;
  format E8023308 vx67f.;
  format E8023309 vx68f.;
  format E8023310 vx69f.;
  format E8023311 vx70f.;
  format E8023312 vx71f.;
  format E8023401 vx72f.;
  format E8023402 vx73f.;
  format E8023403 vx74f.;
  format E8023404 vx75f.;
  format E8023405 vx76f.;
  format E8023406 vx77f.;
  format E8023407 vx78f.;
  format E8023408 vx79f.;
  format E8023409 vx80f.;
  format E8023410 vx81f.;
  format E8023411 vx82f.;
  format E8023412 vx83f.;
  format E8023501 vx84f.;
  format E8023502 vx85f.;
  format E8023503 vx86f.;
  format E8023504 vx87f.;
  format E8023505 vx88f.;
  format E8023506 vx89f.;
  format E8023507 vx90f.;
  format E8023508 vx91f.;
  format E8023509 vx92f.;
  format E8023510 vx93f.;
  format E8023511 vx94f.;
  format E8023512 vx95f.;
  format E8023601 vx96f.;
  format E8023602 vx97f.;
  format E8023603 vx98f.;
  format E8023604 vx99f.;
  format E8023605 vx100f.;
  format E8023606 vx101f.;
  format E8023607 vx102f.;
  format E8023608 vx103f.;
  format E8023609 vx104f.;
  format E8023610 vx105f.;
  format E8023611 vx106f.;
  format E8023612 vx107f.;
  format E8023701 vx108f.;
  format E8023702 vx109f.;
  format E8023703 vx110f.;
  format E8023704 vx111f.;
  format E8023705 vx112f.;
  format E8023706 vx113f.;
  format E8023707 vx114f.;
  format E8023708 vx115f.;
  format E8023709 vx116f.;
  format E8023710 vx117f.;
  format E8023711 vx118f.;
  format E8023712 vx119f.;
  format E8023801 vx120f.;
  format E8023802 vx121f.;
  format E8023803 vx122f.;
  format E8023804 vx123f.;
  format E8023805 vx124f.;
  format E8023806 vx125f.;
  format E8023807 vx126f.;
  format E8023808 vx127f.;
  format E8023809 vx128f.;
  format E8023810 vx129f.;
  format E8023811 vx130f.;
  format E8023812 vx131f.;
  format E8023901 vx132f.;
  format E8023902 vx133f.;
  format E8023903 vx134f.;
  format E8023904 vx135f.;
  format E8023905 vx136f.;
  format E8023906 vx137f.;
  format E8023907 vx138f.;
  format E8023908 vx139f.;
  format E8023909 vx140f.;
  format E8023910 vx141f.;
  format E8023911 vx142f.;
  format E8023912 vx143f.;
  format E8024001 vx144f.;
  format E8024002 vx145f.;
  format E8024003 vx146f.;
  format E8024004 vx147f.;
  format E8024005 vx148f.;
  format E8024006 vx149f.;
  format E8024007 vx150f.;
  format E8024008 vx151f.;
  format E8024009 vx152f.;
  format E8024010 vx153f.;
  format E8024011 vx154f.;
  format E8024012 vx155f.;
  format E8024101 vx156f.;
  format E8024102 vx157f.;
  format E8024103 vx158f.;
  format E8024104 vx159f.;
  format E8024105 vx160f.;
  format E8024106 vx161f.;
  format E8024107 vx162f.;
  format E8024108 vx163f.;
  format E8024109 vx164f.;
  format E8024110 vx165f.;
  format E8024111 vx166f.;
  format E8024112 vx167f.;
  format E8024201 vx168f.;
  format E8024202 vx169f.;
  format E8024203 vx170f.;
  format E8024204 vx171f.;
  format E8024205 vx172f.;
  format E8024206 vx173f.;
  format E8024207 vx174f.;
  format E8024208 vx175f.;
  format E8024209 vx176f.;
  format E8024210 vx177f.;
  format R0000100 vx178f.;
  format R0536300 vx179f.;
  format R0536401 vx180f.;
  format R1235800 vx182f.;
  format R1482600 vx183f.;
  format T2012100 vx184f.;
  format T2791000 vx185f.;
  format T3003100 vx186f.;
  format T3602100 vx187f.;
  format T4406100 vx188f.;
  format T4502600 vx189f.;
  format T5202300 vx190f.;
  format T6055600 vx191f.;
  format T6151500 vx192f.;
  format T6652100 vx193f.;
  format T7545700 vx194f.;
  format T7646000 vx195f.;
  format T8123700 vx196f.;
  format T8976800 vx197f.;
  format T9045900 vx198f.;
  format U0001900 vx199f.;
  format U0957000 vx200f.;
  format U1037200 vx201f.;
  format U1838600 vx202f.;
  format U2857300 vx203f.;
  format U2924600 vx204f.;
  format U3438000 vx205f.;
  format U4282400 vx206f.;
  format U4943100 vx207f.;
  format U5753600 vx208f.;
  format U5825500 vx209f.;
  format U5867700 vx210f.;
  format U5867800 vx211f.;
run;
*/

/*
*--- Tabulations using default named variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format 'INCARC_STATUS_2008.01_XRND'n vx0f.;
  format 'INCARC_STATUS_2008.02_XRND'n vx1f.;
  format 'INCARC_STATUS_2008.03_XRND'n vx2f.;
  format 'INCARC_STATUS_2008.04_XRND'n vx3f.;
  format 'INCARC_STATUS_2008.05_XRND'n vx4f.;
  format 'INCARC_STATUS_2008.06_XRND'n vx5f.;
  format 'INCARC_STATUS_2008.07_XRND'n vx6f.;
  format 'INCARC_STATUS_2008.08_XRND'n vx7f.;
  format 'INCARC_STATUS_2008.09_XRND'n vx8f.;
  format 'INCARC_STATUS_2008.10_XRND'n vx9f.;
  format 'INCARC_STATUS_2008.11_XRND'n vx10f.;
  format 'INCARC_STATUS_2008.12_XRND'n vx11f.;
  format 'INCARC_STATUS_2009.01_XRND'n vx12f.;
  format 'INCARC_STATUS_2009.02_XRND'n vx13f.;
  format 'INCARC_STATUS_2009.03_XRND'n vx14f.;
  format 'INCARC_STATUS_2009.04_XRND'n vx15f.;
  format 'INCARC_STATUS_2009.05_XRND'n vx16f.;
  format 'INCARC_STATUS_2009.06_XRND'n vx17f.;
  format 'INCARC_STATUS_2009.07_XRND'n vx18f.;
  format 'INCARC_STATUS_2009.08_XRND'n vx19f.;
  format 'INCARC_STATUS_2009.09_XRND'n vx20f.;
  format 'INCARC_STATUS_2009.10_XRND'n vx21f.;
  format 'INCARC_STATUS_2009.11_XRND'n vx22f.;
  format 'INCARC_STATUS_2009.12_XRND'n vx23f.;
  format 'INCARC_STATUS_2010.01_XRND'n vx24f.;
  format 'INCARC_STATUS_2010.02_XRND'n vx25f.;
  format 'INCARC_STATUS_2010.03_XRND'n vx26f.;
  format 'INCARC_STATUS_2010.04_XRND'n vx27f.;
  format 'INCARC_STATUS_2010.05_XRND'n vx28f.;
  format 'INCARC_STATUS_2010.06_XRND'n vx29f.;
  format 'INCARC_STATUS_2010.07_XRND'n vx30f.;
  format 'INCARC_STATUS_2010.08_XRND'n vx31f.;
  format 'INCARC_STATUS_2010.09_XRND'n vx32f.;
  format 'INCARC_STATUS_2010.10_XRND'n vx33f.;
  format 'INCARC_STATUS_2010.11_XRND'n vx34f.;
  format 'INCARC_STATUS_2010.12_XRND'n vx35f.;
  format 'INCARC_STATUS_2011.01_XRND'n vx36f.;
  format 'INCARC_STATUS_2011.02_XRND'n vx37f.;
  format 'INCARC_STATUS_2011.03_XRND'n vx38f.;
  format 'INCARC_STATUS_2011.04_XRND'n vx39f.;
  format 'INCARC_STATUS_2011.05_XRND'n vx40f.;
  format 'INCARC_STATUS_2011.06_XRND'n vx41f.;
  format 'INCARC_STATUS_2011.07_XRND'n vx42f.;
  format 'INCARC_STATUS_2011.08_XRND'n vx43f.;
  format 'INCARC_STATUS_2011.09_XRND'n vx44f.;
  format 'INCARC_STATUS_2011.10_XRND'n vx45f.;
  format 'INCARC_STATUS_2011.11_XRND'n vx46f.;
  format 'INCARC_STATUS_2011.12_XRND'n vx47f.;
  format 'INCARC_STATUS_2012.01_XRND'n vx48f.;
  format 'INCARC_STATUS_2012.02_XRND'n vx49f.;
  format 'INCARC_STATUS_2012.03_XRND'n vx50f.;
  format 'INCARC_STATUS_2012.04_XRND'n vx51f.;
  format 'INCARC_STATUS_2012.05_XRND'n vx52f.;
  format 'INCARC_STATUS_2012.06_XRND'n vx53f.;
  format 'INCARC_STATUS_2012.07_XRND'n vx54f.;
  format 'INCARC_STATUS_2012.08_XRND'n vx55f.;
  format 'INCARC_STATUS_2012.09_XRND'n vx56f.;
  format 'INCARC_STATUS_2012.10_XRND'n vx57f.;
  format 'INCARC_STATUS_2012.11_XRND'n vx58f.;
  format 'INCARC_STATUS_2012.12_XRND'n vx59f.;
  format 'INCARC_STATUS_2013.01_XRND'n vx60f.;
  format 'INCARC_STATUS_2013.02_XRND'n vx61f.;
  format 'INCARC_STATUS_2013.03_XRND'n vx62f.;
  format 'INCARC_STATUS_2013.04_XRND'n vx63f.;
  format 'INCARC_STATUS_2013.05_XRND'n vx64f.;
  format 'INCARC_STATUS_2013.06_XRND'n vx65f.;
  format 'INCARC_STATUS_2013.07_XRND'n vx66f.;
  format 'INCARC_STATUS_2013.08_XRND'n vx67f.;
  format 'INCARC_STATUS_2013.09_XRND'n vx68f.;
  format 'INCARC_STATUS_2013.10_XRND'n vx69f.;
  format 'INCARC_STATUS_2013.11_XRND'n vx70f.;
  format 'INCARC_STATUS_2013.12_XRND'n vx71f.;
  format 'INCARC_STATUS_2014.01_XRND'n vx72f.;
  format 'INCARC_STATUS_2014.02_XRND'n vx73f.;
  format 'INCARC_STATUS_2014.03_XRND'n vx74f.;
  format 'INCARC_STATUS_2014.04_XRND'n vx75f.;
  format 'INCARC_STATUS_2014.05_XRND'n vx76f.;
  format 'INCARC_STATUS_2014.06_XRND'n vx77f.;
  format 'INCARC_STATUS_2014.07_XRND'n vx78f.;
  format 'INCARC_STATUS_2014.08_XRND'n vx79f.;
  format 'INCARC_STATUS_2014.09_XRND'n vx80f.;
  format 'INCARC_STATUS_2014.10_XRND'n vx81f.;
  format 'INCARC_STATUS_2014.11_XRND'n vx82f.;
  format 'INCARC_STATUS_2014.12_XRND'n vx83f.;
  format 'INCARC_STATUS_2015.01_XRND'n vx84f.;
  format 'INCARC_STATUS_2015.02_XRND'n vx85f.;
  format 'INCARC_STATUS_2015.03_XRND'n vx86f.;
  format 'INCARC_STATUS_2015.04_XRND'n vx87f.;
  format 'INCARC_STATUS_2015.05_XRND'n vx88f.;
  format 'INCARC_STATUS_2015.06_XRND'n vx89f.;
  format 'INCARC_STATUS_2015.07_XRND'n vx90f.;
  format 'INCARC_STATUS_2015.08_XRND'n vx91f.;
  format 'INCARC_STATUS_2015.09_XRND'n vx92f.;
  format 'INCARC_STATUS_2015.10_XRND'n vx93f.;
  format 'INCARC_STATUS_2015.11_XRND'n vx94f.;
  format 'INCARC_STATUS_2015.12_XRND'n vx95f.;
  format 'INCARC_STATUS_2016.01_XRND'n vx96f.;
  format 'INCARC_STATUS_2016.02_XRND'n vx97f.;
  format 'INCARC_STATUS_2016.03_XRND'n vx98f.;
  format 'INCARC_STATUS_2016.04_XRND'n vx99f.;
  format 'INCARC_STATUS_2016.05_XRND'n vx100f.;
  format 'INCARC_STATUS_2016.06_XRND'n vx101f.;
  format 'INCARC_STATUS_2016.07_XRND'n vx102f.;
  format 'INCARC_STATUS_2016.08_XRND'n vx103f.;
  format 'INCARC_STATUS_2016.09_XRND'n vx104f.;
  format 'INCARC_STATUS_2016.10_XRND'n vx105f.;
  format 'INCARC_STATUS_2016.11_XRND'n vx106f.;
  format 'INCARC_STATUS_2016.12_XRND'n vx107f.;
  format 'INCARC_STATUS_2017.01_XRND'n vx108f.;
  format 'INCARC_STATUS_2017.02_XRND'n vx109f.;
  format 'INCARC_STATUS_2017.03_XRND'n vx110f.;
  format 'INCARC_STATUS_2017.04_XRND'n vx111f.;
  format 'INCARC_STATUS_2017.05_XRND'n vx112f.;
  format 'INCARC_STATUS_2017.06_XRND'n vx113f.;
  format 'INCARC_STATUS_2017.07_XRND'n vx114f.;
  format 'INCARC_STATUS_2017.08_XRND'n vx115f.;
  format 'INCARC_STATUS_2017.09_XRND'n vx116f.;
  format 'INCARC_STATUS_2017.10_XRND'n vx117f.;
  format 'INCARC_STATUS_2017.11_XRND'n vx118f.;
  format 'INCARC_STATUS_2017.12_XRND'n vx119f.;
  format 'INCARC_STATUS_2018.01_XRND'n vx120f.;
  format 'INCARC_STATUS_2018.02_XRND'n vx121f.;
  format 'INCARC_STATUS_2018.03_XRND'n vx122f.;
  format 'INCARC_STATUS_2018.04_XRND'n vx123f.;
  format 'INCARC_STATUS_2018.05_XRND'n vx124f.;
  format 'INCARC_STATUS_2018.06_XRND'n vx125f.;
  format 'INCARC_STATUS_2018.07_XRND'n vx126f.;
  format 'INCARC_STATUS_2018.08_XRND'n vx127f.;
  format 'INCARC_STATUS_2018.09_XRND'n vx128f.;
  format 'INCARC_STATUS_2018.10_XRND'n vx129f.;
  format 'INCARC_STATUS_2018.11_XRND'n vx130f.;
  format 'INCARC_STATUS_2018.12_XRND'n vx131f.;
  format 'INCARC_STATUS_2019.01_XRND'n vx132f.;
  format 'INCARC_STATUS_2019.02_XRND'n vx133f.;
  format 'INCARC_STATUS_2019.03_XRND'n vx134f.;
  format 'INCARC_STATUS_2019.04_XRND'n vx135f.;
  format 'INCARC_STATUS_2019.05_XRND'n vx136f.;
  format 'INCARC_STATUS_2019.06_XRND'n vx137f.;
  format 'INCARC_STATUS_2019.07_XRND'n vx138f.;
  format 'INCARC_STATUS_2019.08_XRND'n vx139f.;
  format 'INCARC_STATUS_2019.09_XRND'n vx140f.;
  format 'INCARC_STATUS_2019.10_XRND'n vx141f.;
  format 'INCARC_STATUS_2019.11_XRND'n vx142f.;
  format 'INCARC_STATUS_2019.12_XRND'n vx143f.;
  format 'INCARC_STATUS_2020.01_XRND'n vx144f.;
  format 'INCARC_STATUS_2020.02_XRND'n vx145f.;
  format 'INCARC_STATUS_2020.03_XRND'n vx146f.;
  format 'INCARC_STATUS_2020.04_XRND'n vx147f.;
  format 'INCARC_STATUS_2020.05_XRND'n vx148f.;
  format 'INCARC_STATUS_2020.06_XRND'n vx149f.;
  format 'INCARC_STATUS_2020.07_XRND'n vx150f.;
  format 'INCARC_STATUS_2020.08_XRND'n vx151f.;
  format 'INCARC_STATUS_2020.09_XRND'n vx152f.;
  format 'INCARC_STATUS_2020.10_XRND'n vx153f.;
  format 'INCARC_STATUS_2020.11_XRND'n vx154f.;
  format 'INCARC_STATUS_2020.12_XRND'n vx155f.;
  format 'INCARC_STATUS_2021.01_XRND'n vx156f.;
  format 'INCARC_STATUS_2021.02_XRND'n vx157f.;
  format 'INCARC_STATUS_2021.03_XRND'n vx158f.;
  format 'INCARC_STATUS_2021.04_XRND'n vx159f.;
  format 'INCARC_STATUS_2021.05_XRND'n vx160f.;
  format 'INCARC_STATUS_2021.06_XRND'n vx161f.;
  format 'INCARC_STATUS_2021.07_XRND'n vx162f.;
  format 'INCARC_STATUS_2021.08_XRND'n vx163f.;
  format 'INCARC_STATUS_2021.09_XRND'n vx164f.;
  format 'INCARC_STATUS_2021.10_XRND'n vx165f.;
  format 'INCARC_STATUS_2021.11_XRND'n vx166f.;
  format 'INCARC_STATUS_2021.12_XRND'n vx167f.;
  format 'INCARC_STATUS_2022.01_XRND'n vx168f.;
  format 'INCARC_STATUS_2022.02_XRND'n vx169f.;
  format 'INCARC_STATUS_2022.03_XRND'n vx170f.;
  format 'INCARC_STATUS_2022.04_XRND'n vx171f.;
  format 'INCARC_STATUS_2022.05_XRND'n vx172f.;
  format 'INCARC_STATUS_2022.06_XRND'n vx173f.;
  format 'INCARC_STATUS_2022.07_XRND'n vx174f.;
  format 'INCARC_STATUS_2022.08_XRND'n vx175f.;
  format 'INCARC_STATUS_2022.09_XRND'n vx176f.;
  format 'INCARC_STATUS_2022.10_XRND'n vx177f.;
  format 'PUBID_1997'n vx178f.;
  format 'KEY!SEX_1997'n vx179f.;
  format 'KEY!BDATE_M_1997'n vx180f.;
  format 'CV_SAMPLE_TYPE_1997'n vx182f.;
  format 'KEY!RACE_ETHNICITY_1997'n vx183f.;
  format 'CV_CENSUS_REGION_2008'n vx184f.;
  format 'YSAQ-443C5_2008'n vx185f.;
  format 'YINC-1800_2008'n vx186f.;
  format 'CV_CENSUS_REGION_2009'n vx187f.;
  format 'YINC-1800_2009'n vx188f.;
  format 'YSAQ-443C5_2009'n vx189f.;
  format 'CV_CENSUS_REGION_2010'n vx190f.;
  format 'YINC-1800_2010'n vx191f.;
  format 'YSAQ-443C5_2010'n vx192f.;
  format 'CV_CENSUS_REGION_2011'n vx193f.;
  format 'YINC-1800_2011'n vx194f.;
  format 'YSAQ-443C5_2011'n vx195f.;
  format 'CV_CENSUS_REGION_2013'n vx196f.;
  format 'YINC-1800_2013'n vx197f.;
  format 'YSAQ-443C5_2013'n vx198f.;
  format 'CV_CENSUS_REGION_2015'n vx199f.;
  format 'YINC-1800_2015'n vx200f.;
  format 'YSAQ-443C5_2015'n vx201f.;
  format 'CV_CENSUS_REGION_2017'n vx202f.;
  format 'YINC-1800_2017'n vx203f.;
  format 'YSAQF-443C5_2017'n vx204f.;
  format 'CV_CENSUS_REGION_2019'n vx205f.;
  format 'YINC-1800_2019'n vx206f.;
  format 'CV_CENSUS_REGION_2021'n vx207f.;
  format 'YINC-1800_2021'n vx208f.;
  format 'YSAQF-443C5_2021'n vx209f.;
  format 'YEND-BACKGR1_2021'n vx210f.;
  format 'YEND-BACKGR2_2021'n vx211f.;
run;
*/