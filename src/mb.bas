  10  REMMB010
 200  REMTI99 & COCO CONVERSION PROGRAM BY HLO
 300  HOME 
 620  PRINT : PRINT : PRINT "APPLE II MILLE BORNES": PRINT 
 650  PRINT "WANT TO PLAY:": PRINT "1) LONG GAME 1000/5000": PRINT "2) SHORT GAME 700/3000 "
 655  INPUT I: IF I < 1 OR I > 2 THEN  HOME : GOTO 650
 660  IF I = 1 THEN MS = 1000:WS = 5000: GOTO 670
 665 MS = 700:WS = 3000
 670  INPUT "PRESS ENTER TO START";A$:X =  RND ( - 1 * ( PEEK (78) + 256 *  PEEK (79)))
 680  HOME 
 700  PRINT "APPLE II MILLE BORNES": PRINT "A CARD GAME OF AUTO RACING"
 800  DIM CR$(115),HZ$(2),YR$(2,7),ST$(2),SC(2),SF$(2,7),CT(2),SL$(2)
 900  DIM SB(2),SF(2),WR(2),MX(2),CC(2),SU(2),TL(2)
 950  DIM SI$(2),CF(2)
1000 TL(1) = 0:TL(2) = 0:TD = 0:G8 = 0
1050  REMREMREM RESTART POINT
1100  FOR I = 1 TO 2:HZ$(I) = "":ST$(I) = "":SC(I) = 0:CT(I) = 0:SL$(I) = ""
1111 CF(1) = 0:CF(2) = 0
1200 SB(I) = 0:SF(I) = 0:WR(I) = 0:MX(I) = 0:CC(I) = 0:SU(I) = 0
1300  FOR J = 1 TO 7:YR$(I,J) = "":SF$(I,J) = "": NEXT J: NEXT I
1400 DS = 0:YN$ = "":NC = 15:T$ = "":OW = 0:RO = 0:ZH = 0:ST = 0:SL = 0
1500 R11 = 0:R = 0:D = 0:Q = 0:T1$ = "":T2$ = "":Z = 0:RR = 0:R22 = 0:I = 0:X = 0:Y = 0:A$ = "":PR = 0
1600 VL = 0:NS = 0:S9 = 0:H$ = "":SW = 0:KP = 0:D$ = "":P = 0:C = 0:PO = 0:WN = 0:HZ = 0:SP = 0:SL = 0
1700 HI = 0:I = 0
1950  PRINT "READING AND SHUFFLING CARDS":I = 0
1960  RESTORE 
2000  READ D$: IF D$ = "END-DATA" THEN  GOTO 2200
2100 I = I + 1:CR$(I) = D$: GOTO 2000
2200 Q = 0:P = 0:TD = I
2410  FOR Z = 1 TO 200:A =  INT ( RND (1) * 99) + 1:B =  INT ( RND (1) * 99) + 1
2500 T1$ = CR$(A):CR$(A) = CR$(B):CR$(B) = T1$: NEXT Z: REMREM REM@@@ 5 CARDS EACH
3000 C = 1
3100  FOR I = 1 TO 14 STEP 2
3200 YR$(1,C) = CR$(I):YR$(2,C) = CR$(I + 1)
3300 C = C + 1
3400  NEXT I
3600  HOME 
3670  REMREM REM@@ DISPLAY INTERFACE
3700 Y = 1:X = 6:A$ = "APPLE II MILLE BORNES": GOSUB 32000
3800 Y = 2:X = 1:A$ = "YOUR CARDS   CARDS LEFT=": GOSUB 32000
3900 Y = 3:X = 1:A$ = "(1)": GOSUB 32000:Y = 4:X = 1:A$ = "(2)": GOSUB 32000
3920 Y = 5:X = 1:A$ = "(3)": GOSUB 32000:Y = 6:X = 1:A$ = "(4)": GOSUB 32000
4000 Y = 7:X = 1:A$ = "(5)": GOSUB 32000
4050 Y = 8:X = 1:A$ = "(6)": GOSUB 32000:Y = 9:X = 1:A$ = "(7)": GOSUB 32000
4100 Y = 10:X = 1:A$ = "LAST CARD:": GOSUB 32000
4200 Y = 12:X = 2:A$ = "PLAYER:": GOSUB 32000
4210 Y = 13:X = 8:A$ = ":": GOSUB 32000
4300 Y = 14:X = 2:A$ = "STATUS:": GOSUB 32000
4310 Y = 15:X = 8:A$ = ":": GOSUB 32000
4400 Y = 16:X = 1:A$ = "HAZARDS:": GOSUB 32000
4410 Y = 17:X = 8:A$ = ":": GOSUB 32000
4500 Y = 18:X = 1:A$ = "SAFETYS:": GOSUB 32000
4510 Y = 19:X = 8:A$ = ":": GOSUB 32000
4520 Y = 20:X = 8:A$ = ":": GOSUB 32000
4530 Y = 21:X = 8:A$ = ":": GOSUB 32000
4540 Y = 22:X = 8:A$ = ":": GOSUB 32000
4600 Y = 23:X = 3:A$ = "MILES:": GOSUB 32000
4700 PR = 1:PO = 2: GOSUB 18200
4800  REMREM REM ***MAIN LOOP***
4900  REMREM REM LOOP BACK
5000 X = 9:A$ = "YOU     ":Z = 20:PR = 1:PO = 2:DS = 0:C = 0
5100 Y = 12: GOSUB 32000:Y = 12:X = Z:A$ = "        ": GOSUB 32000
5200  REMA$=INKEY$:IF A$="" THEN 5200 ELSE K=ASC(A$)
5220  GET A$:K =  ASC (A$)
5300  IF (K > 48 AND K < 56) THEN  GOTO 5500
5320  GOTO 5200
5500 KP = (5 - (53 - K)):T$ = YR$(PR,KP): IF T$ = "" THEN  GOTO 5200
5600  REMREM REM@@ CHK KEY PRESS
5700  IF T$ = "25" OR T$ = "50" OR T$ = "75" OR T$ = "100" OR T$ = "200" THEN  GOSUB 19600
5800  IF T$ = "REPAIRS   " OR T$ = "GASOLINE  " OR T$ = "SPARE TIRE" OR T$ = "END LIMIT " OR T$ = "ROLL !" THEN  GOSUB 20700
5900  IF T$ = "FLAT TIRE " OR T$ = "OUT OF GAS" OR T$ = "ACCIDENT  " OR T$ = "SPEED LIM " OR T$ = "STOP      " THEN  GOSUB 22200
6000  IF T$ = "PUN PROOF " OR T$ = "EXTRA TANK" OR T$ = "DRIV ACE  " OR T$ = "RITE O WAY" THEN  GOSUB 23800
6100  IF DS = 1 THEN  GOTO 5000
6200  GOSUB 26300: REMREM REM@@ GET NEW CARD
6300  IF SC(PR) >  = MS THEN OW = 1:WN = PR: GOTO 26700
6400  GOSUB 18200: REMREM REM**REDRAW SCREEN
6500  REMREM REM *** COMPUTER PLAY
6600 X = 20:A$ = "COMPUTER":Z = 9
6700 Y = 12: GOSUB 32000:Y = 12:X = Z:A$ = "        ": GOSUB 32000
6800 ZH = 0:ST = 0:SL = 0:HZ = 0:SP = 0:SJ = 0
6900  IF  LEN (ST$(1)) > 1 THEN SP = 1
7000  IF  LEN (HZ$(1)) > 1 THEN HZ = 1
7100  IF  LEN (HZ$(2)) > 1 THEN ZH = 1
7200  IF  LEN (ST$(2)) > 1 THEN ST = 1
7300  IF  LEN (SL$(1)) > 1 THEN SL = 1
7400  IF  LEN (SL$(2)) > 1 THEN SJ = 1
7500 S9 = 0:H$ = "":NS = 0:VL = 0:T$ = "":PR = 2:PO = 1:C = 0
7600  REMREM REM C PLAY ROLL&CHK SAFES
7700 DS = 0: IF (SC(1) > (MS - 200)) OR (SC(2) > (MS - 200)) THEN DS = 1
7800  FOR I = 1 TO 7: IF S9 = 1 THEN  GOTO 8300
7900 T$ = YR$(PR,I):H$ =  MID$ (HZ$(2),1,3)
8000 T2$ =  MID$ (T$,1,3): IF (T2$ = "PUN" OR T2$ = "EXT" OR T2$ = "DRI" OR T2$ = "RIT") AND DS = 1 THEN S9 = 1:KP = I: GOSUB 23800
8100  IF T$ = "ROLL !" AND ST = 0 AND ZH = 0 THEN S9 = 1:KP = I: GOSUB 20700
8200  IF T$ = "ROLL !" AND H$ = "STO" THEN S9 = 1:KP = I: GOSUB 20700
8300  NEXT I
8400  IF S9 = 1 THEN  GOTO 17600
8500  REMREM REM C HAS HAZARD PLAY SAFETY
8600  IF ZH = 0 THEN  GOTO 11000
8700 H$ =  MID$ (HZ$(PR),1,2)
8800  FOR I = 1 TO 7: IF S9 = 1 THEN  GOTO 9600
8900 T$ = YR$(PR,I):T2$ =  MID$ (T$,1,3)
9000  IF (T2$ = "PUN" AND H$ = "FL") OR (T2$ = "EXT" AND H$ = "OU") THEN S9 = 1:KP = I: GOTO 9500
9100  IF (T2$ = "DRI" AND H$ = "AC") OR (T2$ = "RIT" AND H$ = "ST") THEN S9 = 1:KP = I: GOTO 9500
9400  GOTO 9600
9500  GOSUB 23800
9600  NEXT I
9700  IF S9 = 1 THEN  GOTO 17600
9800  REMREM REM C PLAY REMEDYS ON HAZARD
9900  FOR I = 1 TO 7:T$ = YR$(PR,I):T2$ =  MID$ (T$,1,3)
10000  IF S9 = 1 THEN  GOTO 10700
10100  IF (T2$ = "GAS" AND H$ = "OU") OR (T2$ = "REP" AND H$ = "AC") THEN S9 = 1:KP = I: GOTO 10600
10300  IF (T2$ = "ROL" AND H$ = "ST") OR (T2$ = "SPA" AND H$ = "FL") THEN S9 = 1:KP = I: GOTO 10600
10500  GOTO 10700
10600  GOSUB 20800
10700  NEXT I
10800  IF S9 = 1 THEN  GOTO 17600
10900  REMREM REM C PLAY MILES REM
11000  IF ST = 0 THEN  GOTO 12400
11100 HI = 0
11200  FOR I = 1 TO 7
11300 T$ = YR$(PR,I)
11400  IF T$ = "200" OR T$ = "100" OR T$ = "75" OR T$ = "50" OR T$ = "25" THEN VL =  VAL (T$): GOTO 11500
11420  GOTO 12000
11500  IF (SJ = 1 AND VL > 50) OR (CT(2) > 1 AND VL = 200) OR ((SC(2) + VL) > MS) THEN  GOTO 12000
11800  IF VL > HI THEN HI = VL: GOTO 11900
11850  GOTO 12000
11900 KP = I:S9 = 1:H$ = T$
12000  NEXT I
12100  IF S9 = 1 THEN VL = HI:T$ = H$: GOSUB 19700
12200  IF S9 = 1 THEN 17600
12300  REMREM REM **C REMEDY SPEED LIM
12400  IF SJ = 0 THEN  GOTO 13100
12500  FOR I = 1 TO 7: IF S9 = 1 THEN  GOTO 12800
12600 T$ = YR$(PR,I):T2$ =  MID$ (T$,1,3)
12700  IF T2$ = "END" THEN S9 = 1:KP = I: GOSUB 20700
12800  NEXT I
12900  IF S9 = 1 THEN  GOTO 17600
13000  REMREM REM C PLAYS HAZARD
13100  IF HZ = 1 THEN  GOTO 14100
13200  IF SP = 0 THEN  GOTO 14100
13300  FOR I = 1 TO 7: IF S9 = 1 THEN  GOTO 13900
13400 T$ = YR$(PR,I):T2$ =  MID$ (T$,1,3)
13500  IF (T2$ = "FLA" AND  LEN (SF$(PO,1)) < 2) OR (T2$ = "ACC" AND  LEN (SF$(PO,4)) < 2) THEN KP = I:S9 = 1: GOSUB 22200
13700  IF T2$ = "STO" AND  LEN (SF$(PO,3)) < 2 THEN KP = I:S9 = 1: GOSUB 22200
13750  IF (T2$ = "SPE" AND  LEN (SF$(PO,3)) < 2) OR (T2$ = "OUT" AND  LEN (SF$(PO,2)) < 2) THEN KP = I:S9 = 1: GOSUB 22200
13900  NEXT I: IF S9 = 1 THEN  GOTO 17600
14000  REMREM REM **USE SPEED LIM
14040  GOTO 14700
14100  IF SL = 1 THEN  GOTO 14700
14200  FOR I = 1 TO 7: IF S9 = 1 THEN  GOTO 14400
14300 T$ = YR$(PR,I):T2$ =  MID$ (T$,1,3): IF T2$ = "SPE" THEN KP = I:S9 = 1: GOSUB 22200
14400  NEXT I
14500  IF S9 = 1 THEN  GOTO 17600
14600  REMREM REM **C PLAY SAFETY
14700  FOR I = 1 TO 7: IF S9 = 1 THEN  GOTO 15300
14800 T$ = YR$(PR,I):T2$ =  MID$ (T$,1,3)
14900  IF T2$ = "EXT" OR T2$ = "DRI" OR T2$ = "PUN" OR T2$ = "RIT" THEN S9 = 1:KP = I: GOSUB 23800
15300  NEXT I
15400  IF S9 = 1 THEN  GOTO 17600
15500  REMREM REM **C TO DISCARD
15600  FOR I = 1 TO 7: IF S9 = 1 THEN  GOTO 16300
15700 H$ =  MID$ (T$,1,3): REMREM REM T$=YR$(PR,I)
15800  IF (H$ = "FLA" AND  LEN (SF$(PO,1)) < 2) OR (H$ = "OUT" AND  LEN (SF$(PO,2)) < 2) THEN KP = I:S9 = 1: GOTO 16300
16000  IF (H$ = "ACC" AND  LEN (SF$(PO,4)) < 2) OR (H$ = "STO" AND  LEN (SF$(PO,3)) < 2) THEN KP = I:S9 = 1: GOTO 16300
16200  IF  RND (1) > .5 AND (H$ = "ACC" OR H$ = "STO" OR H$ = "SPE" OR H$ = "OUT" OR H$ = "FLA") THEN KP = I:S9 = 1
16300  NEXT I
16400  IF S9 = 1 THEN  GOTO 17500
16500 C = 0
16600 C = C + 1:X =  INT ( RND (1) * 7 + 1)
16700 T$ = YR$(PR,X)
16800 H$ =  MID$ (T$,1,3)
16900  IF C > 5 THEN  GOTO 17400
17000  IF H$ = "RIT" OR H$ = "DRI" OR H$ = "EXT" OR H$ = "PUN" THEN  GOTO 16600
17050 J =  RND (1) * 255
17100  IF J > 204 AND H$ = "ROL" AND ST = 1 THEN  GOTO 16600
17200  IF (J > 126 AND H$ = "200") OR (J > 102 AND H$ = "100") THEN  GOTO 16600
17400 KP = X
17500 C = 7:T$ = YR$(PR,KP)
17520  IF T$ = "" THEN H$ = "": GOTO 17530
17525  GOTO 17595
17530  FOR I = 1 TO 7: IF YR$(2,I) <  > "" THEN H$ = YR$(2,I):KP = I
17540  NEXT I: IF H$ = "" THEN  GOTO 17900ELSET$ = H$
17595  GOSUB 25900
17600  IF C <  > 7 THEN T$ = YR$(PR,KP)
17700  GOSUB 18300: REMREM REM REDRAW SCREEN
17800  GOSUB 26300: REMREM REM GET A NEW CARD
17900  IF SC(PR) >  = MS THEN OW = 1:WN = PR: GOTO 26700
17920 C = 0: FOR I = 1 TO 7: IF YR$(2,I) = "" THEN C = C + 1
17940  NEXT I
17960  IF C = 5 THEN  GOTO 26700
18000  GOTO 4900
18100  REMREM REM@@ DISPLAY CARDS
18200  FOR I = 1 TO 7:Y = I + 2:X = 5:A$ = "                        ": GOSUB 32000
18250 Y = I + 2:X = 5:A$ = YR$(PR,I): GOSUB 32000: NEXT I
18300 Y = 10:X = 11:A$ = T$ + "          ": GOSUB 32000
18320  IF TD - NC < 0 THEN  GOTO 18400
18350 Y = 2:X = 25:A$ =  STR$ (TD - NC): GOSUB 32000
18400  FOR I = 1 TO 2: IF I = 1 THEN X = 9: GOTO 18450
18420 X = 20
18450  IF ST$(I) = "" THEN SI$(I) = "STOPPED": GOTO 18500
18430 SI$(I) = "ROLL !"
18500 Y = 14:A$ = SI$(I) + "    ": GOSUB 32000
18550  IF HZ$(I) = "" THEN A$ = "          ": GOTO 18600
18570 A$ = HZ$(I)
18600 Y = 16: GOSUB 32000
18700 Y = 18:A$ = SF$(I,1): GOSUB 32000
18800 Y = 19:A$ = SF$(I,2): GOSUB 32000
18900 Y = 20:A$ = SF$(I,3): GOSUB 32000
19000 Y = 21:A$ = SF$(I,4): GOSUB 32000
19050  IF SL$(I) = "" THEN A$ = "          ": GOTO 19100
19060 A$ = SL$(I)
19100 Y = 15: GOSUB 32000
19200 Y = 23:A$ =  STR$ (SC(I)): GOSUB 32000
19300  NEXT I
19400  RETURN 
19500  REMREM REM@@@ SCORING
19600  IF ST$(PR) = "" THEN  GOTO 20500
19700 VL =  VAL (T$)
19800  IF VL + SC(PR) > MS THEN  GOTO 20500
19900  IF VL <  > 200 THEN  GOTO 20100
20000 CT(PR) = 1 + CT(PR): IF CT(PR) > 2 THEN  GOTO 20500
20100  IF SL$(PR) = "SPEED LIM " AND VL > 50 THEN  GOTO 20500
20200 SC(PR) = SC(PR) + VL
20400  RETURN 
20500  GOSUB 25700
20600  RETURN 
20700  REMREM REMREMEDYS
20800  IF HZ$(PR) = "ACCIDENT  " AND T$ = "REPAIRS   " THEN  GOTO 21700
20900  IF HZ$(PR) = "OUT OF GAS" AND T$ = "GASOLINE  " THEN  GOTO 21700
21000  IF HZ$(PR) = "FLAT TIRE " AND T$ = "SPARE TIRE" THEN  GOTO 21700
21100  IF SL$(PR) = "SPEED LIM " AND T$ = "END LIMIT " THEN SL$(PR) = "": GOTO 22100
21200  IF T$ <  > "ROLL !" THEN  GOTO 22000
21300  IF ST$(PR) = "ROLL !" THEN  GOTO 22000
21400  IF HZ$(PR) = "STOP      " THEN ST$(PR) = "ROLL !": GOTO 21700
21500  IF HZ$(PR) <  > "" THEN  GOTO 22000
21600 ST$(PR) = "ROLL !": GOTO 22100
21700 HZ$(PR) = ""
21800  IF SF$(PR,3) <  > "" THEN ST$(PR) = "ROLL !"
21900  RETURN 
22000  GOSUB 25700
22100  RETURN 
22200  REMREM REM @@@HAZARDS
22300  IF T$ = "SPEED LIM " THEN  GOTO 22800
22400  IF ST$(PO) = "" THEN  GOTO 23500
22500  IF SF$(PO,1) <  > "" AND T$ = "FLAT TIRE " THEN  GOTO 23500
22600  IF SF$(PO,2) <  > "" AND T$ = "OUT OF GAS" THEN  GOTO 23500
22700  IF SF$(PO,3) <  > "" AND T$ = "STOP      " THEN  GOTO 23500
22800  IF SF$(PO,3) <  > "" AND T$ = "SPEED LIM " THEN  GOTO 23500
22900  IF SF$(PO,4) <  > "" AND T$ = "ACCIDENT  " THEN  GOTO 23500
23000  IF SL$(PO) = "" AND T$ = "SPEED LIM " THEN SL$(PO) = "SPEED LIM ": GOTO 23400
23100  IF SL$(PO) <  > "" AND T$ = "SPEED LIM " THEN  GOTO 23500
23200 HZ$(PO) = T$
23300 ST$(PO) = ""
23400  RETURN 
23500  GOSUB 25700
23600  RETURN 
23700  REMREM REM @@@ SAFETYS
23800  IF T$ <  > "PUN PROOF " THEN  GOTO 24200
23900 SF$(PR,1) = T$: IF HZ$(PR) <  > "FLAT TIRE " THEN  GOTO 25500
24000 CF(PR) = CF(PR) + 200:HZ$(PR) = ""
24100  GOSUB 25555: GOTO 25500
24200  IF T$ <  > "EXTRA TANK" THEN  GOTO 24600
24300 SF$(PR,2) = T$: IF HZ$(PR) <  > "OUT OF GAS" THEN  GOTO 25500
24400 CF(PR) = CF(PR) + 200:HZ$(PR) = ""
24500  GOSUB 25555: GOTO 25500
24600  IF T$ <  > "RITE O WAY" THEN  GOTO 25200
24810 SF$(PR,3) = T$: IF HZ$(PR) <  > "STOP      " THEN  GOTO 24900
24820 HZ$(PR) = "":CF(PR) = CF(PR) + 200
24830  GOSUB 25555
24900  IF SL$(PR) <  > "SPEED LIM " THEN  GOTO 25500
24920 SL$(PR) = ""
25100 ST$(PR) = "ROLL !": GOTO 25500
25200 SF$(PR,4) = T$
25300  IF HZ$(PR) <  > "ACCIDENT  " THEN  GOTO 25500
25400 CF(PR) = CF(PR) + 200:HZ$(PR) = ""
25410  GOSUB 25555
25500  IF SF$(PR,3) <  > "" AND HZ$(PR) = "" THEN ST$(PR) = "ROLL !"
25550  RETURN 
25555 Y = 1:X = 6:A$ = "COUP FOURRE !!!   ": GOSUB 32000
25557  PRINT  CHR$ (7): PRINT  CHR$ (7)
25558 Y = 1:X = 6:A$ = "APPLE II MILLE BORNES": GOSUB 32000: RETURN 
25600  REMREM REM @@@ DISCARD
25700  IF PR <  > 1 THEN 26100
25720 Y = 10:X = 1:A$ = "DISCARD? (Y/N)             ": GOSUB 32000: INPUT YN$
25750 Y = 11:X = 1:A$ = "      ": GOSUB 32000
25800  IF YN$ = "N" THEN DS = 1::Y = 10:X = 1:A$ = "LAST CARD: " + T$: GOSUB 32000: GOTO 26100
25900 T$ = T$ + " D" + "          "
26000 Y = 10:X = 1:A$ = "LAST CARD:             ": GOSUB 32000
26050 Y = 11:X = 1:A$ = "      ": GOSUB 32000
26100  RETURN 
26200  REMREM REM @@@ NEW CARD
26300 NC = NC + 1: IF NC = TD THEN YR$(PR,KP) = "": GOTO 2650
26400 YR$(PR,KP) = CR$(NC)
26500  RETURN 
26600  REMREM REM @@@ END GAME
26700  REMREM REM
26800  FOR I = 1 TO 2
26900  IF SF$(I,1) <  > "" THEN SB(I) = SB(I) + 100
27000  IF SF$(I,2) <  > "" THEN SB(I) = SB(I) + 100
27100  IF SF$(I,3) <  > "" THEN SB(I) = SB(I) + 100
27200  IF SF$(I,4) <  > "" THEN SB(I) = SB(I) + 100
27300  IF SB(I) = 400 THEN SF(I) = 300
27400  IF I = WN THEN WR(I) = 400
27500  IF TD - NC < 1 AND I = WN THEN MX(I) = 400
27600  IF CT(I) = 0 AND I = WN THEN CC(I) = 300
27700  IF I = 1 THEN PO = 2: GOTO 27800
27750 PO = 1
27800  IF SC(PO) = 0 THEN SU(I) = 500
27820  REM
27850  REMCF(COUFRE),CC(NOUSE200),SF(NOSAFET),
27860  REMSC(MILES),SU(SUOUT),SB(SAFETS),
27870  REMWR(WN)
27880  REM
27900 SC(I) = SC(I) + SB(I) + SF(I) + WR(I) + CC(I) + SU(I) + CF(I)
28000 TL(I) = TL(I) + SC(I)
28100  NEXT I
28200  HOME :Y = 1:X = 1:A$ = "BONUS POINTS AND SCORING": GOSUB 32000
28300 Y = 4:X = 10:A$ = "SAFETYS": GOSUB 32000
28340 Y = 7:X = 9:A$ = "ALL SAFETYS": GOSUB 32000
28360 Y = 10:X = 9:A$ =  STR$ (MS) + " MILES": GOSUB 32000
28400 Y = 13:X = 10:A$ = "SAFE TRIP": GOSUB 32000
28450 Y = 17:X = 10:A$ = "SHUT OUT": GOSUB 32000
28500 Y = 21:X = 2:A$ = "TOTAL SCORE THIS ROUND": GOSUB 32000
28600 Y = 3:X = 1:A$ = "YOU                 COMPUTER": GOSUB 32000
28700  FOR I = 1 TO 2: IF I = 1 THEN X = 1: GOTO 28800
28730 X = 21
28800 Y = 5:A$ =  STR$ (SB(I)): GOSUB 32000:Y = 8:A$ =  STR$ (SF(I)): GOSUB 32000
28820 Y = 11:A$ =  STR$ (WR(I)): GOSUB 32000:Y = 15:A$ =  STR$ (CC(I)): GOSUB 32000
28900 Y = 18:A$ =  STR$ (SU(I)): GOSUB 32000
29000 Y = 22:A$ =  STR$ (SC(I)): GOSUB 32000:Y = 22:A$ =  STR$ (SC(I)): GOSUB 32000
29100  NEXT I
29200 Y = 24:X = 1:A$ = "PRESS ANY KEY TO CONTINUE": GOSUB 32000: INPUT YN$
29300  HOME :Y = 1:X = 1:A$ = "ENDING SCORE:": GOSUB 32000
29320 Y = 3:X = 1:A$ = "    YOUR SC:": GOSUB 32000
29340 Y = 5:X = 1:A$ = "COMPUTER SC:": GOSUB 32000
29400 Y = 3:X = 16:A$ =  STR$ (TL(1)): GOSUB 32000:Y = 5:X = 16:A$ =  STR$ (TL(2)): GOSUB 32000
29500  IF TL(1) < WS AND TL(2) < WS THEN 29700
29600 Y = 10:X = 1:A$ = "GAME OVER": GOSUB 32000: GOTO 29900
29700 Y = 10:X = 1:A$ = "NEXT ROUND": GOSUB 32000
29720  INPUT YN$: HOME :Y = 2:X = 8:G8 = 1:A$ = "APPLE II MILLE BORNES": GOSUB 32000: GOTO 1100
29800  REM
29900  END 
30000  REMREM REM
30200  REMREM REM @@@ CARD DATA
30300  DATA "OUT OF GAS","FLAT TIRE ","ACCIDENT  ","SPEED LIM ","STOP      "
30400  DATA "OUT OF GAS","FLAT TIRE ","ACCIDENT  ","SPEED LIM ","STOP      "
30500  DATA "GASOLINE  ","SPARE TIRE","END LIMIT ","ROLL !","EXTRA TANK","PUN PROOF ","DRIV ACE  ","RITE O WAY","200","100","75","50","25"
30600  DATA "GASOLINE  ","SPARE TIRE","END LIMIT ","ROLL !"
30700  DATA "GASOLINE  ","SPARE TIRE","END LIMIT ","ROLL !"
30800  DATA "REPAIRS   ","REPAIRS   ","REPAIRS   ","REPAIRS   ","REPAIRS   ","REPAIRS   "
30900  DATA "STOP      ","STOP      ","ROLL !","ROLL !","ROLL !","ROLL !","ROLL !","ROLL !","ROLL !","ROLL !","ROLL !","ROLL !","ROLL !"
31000  DATA "GASOLINE  ","SPARE TIRE","END LIMIT "
31100  DATA "GASOLINE  ","SPARE TIRE","END LIMIT "
31200  DATA "GASOLINE  ","SPARE TIRE","END LIMIT "
31300  DATA "200","200","200"
31400  DATA "100","100","100","100","100","100","100","100","100","100","100"
31500  DATA "75","75","75","75","75","75","75","75","75"
31600  DATA "50","50","50","50","50","50","50","50","50"
31700  DATA "25","25","25","25","25","25","25","25","25"
31800  DATA "END-DATA"
32000  HTAB X: VTAB  Y: PRINT A$: RETURN 
