      SUBROUTINE AUXOUT
!
!     WRITE AUXILIARY AND PARTIAL OUTPUTS
!
      COMMON /OVERLY/ NLOG,NMACH,I,NALPHA,IG,NF,LF,K
      COMMON /IWING/  PWING, WING(400)
      COMMON /IHT/    PHT, HT(380)
      COMMON /IVT/    PVT, VT(380)
      COMMON /IVF/    PVF, VF(380)
      COMMON /FLGTCD/ FLC(160)
      COMMON /OPTION/ SREF, CBARR, ROUGFC, BLREF
      COMMON /SYNTSS/ SYNA(19)
      COMMON /POWR/   DYN(213)
      COMMON /WINGI/  WINGIN(100)
      COMMON /HTI/    HTIN(154)
      COMMON /VTI/    VTIN(154), TVTIN(8), VFIN(154)
      COMMON /WINGD/  A(195)
      COMMON /SBETA/  STB(135), TRA(108), TRAH(108), STBH(135)
      COMMON /BDATA/  BD(762)
      COMMON /WHWB/   FACT(182), WB(39), HB(39)
      COMMON /WBHCAL/ WBT(156)
      COMMON /HTDATA/ AHT(195)
      COMMON /VTDATA/ AVT(195), AVF(195)
      COMMON /WHAERO/ C(51), D(55), CHT(51), DHT(55), DVT(55), DVF(55)
      COMMON /SUPWBB/  SWB(61), SHB(61)
      COMMON /SUPBOD/ SBD(229)
      COMMON /SUPWH/  SLG(141), STG(141)
      COMMON /FLOLOG/ FLTC,OPTI,BO,WGPL,WGSC,SYNT,HTPL,HTSC,VTPL,VTSC,&
      &                HEAD,PRPOWR,JETPOW,LOASRT,TVTPAN,SUPERS,SUBSON,&
      &                TRANSN,HYPERS,SYMFP,ASYFP,TRIMC,TRIM,DAMP,&
      &                HYPEF,TRAJET,BUILD,FIRST,DRCONV,PART,&
      &                VFPL,VFSC,CTAB
      COMMON /CONSNT/ PI, DEG, UNUSED, RAD
      COMMON /LEVEL2/ SECOND(23)
      COMMON /CASEID/ IDCASE(74),KOUNT,NAMSV(100),IDIM
!
      DIMENSION STP(155),FOR1(34),FOR2(26),ICON(8),JCON(6),FOR3(14)
      DIMENSION H(1),O(1),P(1),Q(1),R(1),S(1),T(1),ANONE(20),KCON(3)
      DIMENSION SLA(31),FOR3A(3)
      DIMENSION ICONT(11), FOR(46), OPT(4)
!
      EQUIVALENCE (OPT(1),SREF)
      EQUIVALENCE (WBT(1),STP(1))
      EQUIVALENCE (SLA(1),STB(1)),(DOL2,SECOND(16))
      LOGICAL  FLTC,OPTI,BO,WGPL,WGSC,SYNT,HTPL,HTSC,VTPL,VTSC,&
      &         HEAD,PRPOWR,JETPOW,LOASRT,TVTPAN,SUPERS,SUBSON,&
      &         TRANSN,HYPERS,SYMFP,ASYFP,TRIMC,TRIM,DAMP,&
      &         HYPEF,TRAJET,BUILD,FIRST,DRCONV,PART,&
      &         VFPL,VFSC,CTAB
      LOGICAL NN,NM,DOL2,SUPHYP
	CHARACTER*4 FOR,FOR1,FOR2,FOR3,FOR3A,FORSAV,FORSAW,FORSAX
      DATA FOR   /    4H(   ,4H1H0 ,&
      &  4H,0P ,4HF6.3,4H,1X ,4H,1X ,  4H,1X,,4HF8.2,4H,1X ,4H,1X ,&
      &  4H,1X,,4HF8.2,4H,1X ,4H,2X ,  4H,1P ,4HE10.,4H4   ,4H,3X ,&
      &  4H,0P ,4HF9.3,4H,1X ,4H,4X ,  4H,1P ,4HE10.,4H4   ,4H,9X ,&
      &  4H,0P ,4HF9.3,4H,1X ,4H,1X ,  4H,1X,,4HF8.3,4H,1X ,4H    ,&
      &  4H,1X,,4HF8.3,4H,1X ,4H    ,  4H,1X,,4HF8.3,4H,1X ,4H    ,&
      &  4H,1X,,4HF8.3,4H,1X ,4H)   /
      DATA FOR1 /&
      & 4H(1H , 4H,10X, 4H,1X,, 4HE11.,&
      & 4H4,1X, 4H,1X , 4H,1X,, 4HF6. ,&
      & 4H2,1X, 4H,1X , 4H,1X,, 4HF5. ,&
      & 4H2,1X, 4H,2X , 4H,1X,, 4HF9. ,&
      & 4H4,1X, 4H,5X , 4H,1X,, 4HE11.,&
      & 4H4,1X, 4H,1X , 4H,1X,, 4HE11.,&
      & 4H4,1X, 4H,1X , 4H,1X,, 4HE11.,&
      & 4H4,1X, 4H,3X , 4H,1X,, 4HE11.,&
      & 4H4   , 4H)   /
      DATA FOR2 /&
      & 4H(1H , 4H,13X, 4H,1X,, 4HF7. ,&
      & 4H3,1X, 4H,4X , 4H,1X,, 4HE11.,&
      & 4H4,1X, 4H,4X , 4H,1X,, 4HE11.,&
      & 4H4,1X, 4H,4X , 4H,1X,, 4HE11.,&
      & 4H4,1X, 4H,4X , 4H,1X,, 4HE11.,&
      & 4H4,1X, 4H,12X, 4H,1X,, 4HE11.,&
      & 4H4   , 4H)   /
      DATA FOR3 /&
      & 4H(   , 4H44X , 4H,1X,, 4HF7. ,&
      & 4H3,1X, 4H,5X , 4H,1X,, 4HE11.,&
      & 4H4,1X, 4H,5X , 4H,1X,, 4HE11.,&
      & 4H4   , 4H)   /
      DATA ICON / 13,7,7,11,4*13 /
      DATA JCON / 9,5*13 /
      DATA KCON / 9,2*13 /
      DATA ICONT / 7, 10*10 /
      DATA FOR3A/4HE11.,4H4,1X,4H,5X /
!
!                     WRITE AUXILIARY OUTPUTS
!
      NN = .FALSE.
      NM = .FALSE.
      SUPHYP = SUPERS .OR. HYPERS
      ANA = 2.*UNUSED
      DO 1000   J=1,NALPHA
 1000 ANONE(J) = ANA
      IF(BO) LAST=1
      IF(WGPL) LAST=2
      IF(HTPL) LAST=3
      IF(VTPL .OR. VFPL) LAST=4
      IF(BO .AND. WGPL) LAST=5
      IF(BO .AND. HTPL) LAST=6
      IF(BO .AND. (VTPL .OR. VFPL)) LAST=7
      IF(BO .AND. WGPL .AND. HTPL) LAST=8
      IF(BO .AND. WGPL .AND. (VTPL .OR. VFPL)) LAST=9
      IF(BO .AND. WGPL .AND. HTPL .AND. (VTPL .OR. VFPL)) LAST=10
      WRITE(6,1550 )
      WRITE(6,1560 )
      GO TO (1010  ,1020  ,1030  ,1040  ,1050  ,1060  ,1070  ,1080  ,109&
      &0 ,1100 ), LAST
 1010 WRITE(6,1570 )
      GO TO 1110
 1020 WRITE(6,1580 )
      GO TO 1110
 1030 WRITE(6,1590 )
      GO TO 1110
 1040 WRITE(6,1600 )
      GO TO 1110
 1050 WRITE(6,1610 )
      GO TO 1110
 1060 WRITE(6,1620 )
      GO TO 1110
 1070 WRITE(6,1630 )
      GO TO 1110
 1080 WRITE(6,1640 )
      GO TO 1110
 1090 WRITE(6,1650 )
      GO TO 1110
 1100 WRITE(6,1660 )
 1110 IF(HEAD) CALL PRCSID
      WRITE(6,1670 )
      IF(IDIM .EQ. 1) WRITE(6,1680 )
      IF(IDIM .EQ. 2) WRITE(6,1690 )
      IF(IDIM .EQ. 3) WRITE(6,1700 )
      IF(IDIM .EQ. 4) WRITE(6,1710 )
      SC = SYNA(13)
      XL = 1.0
      XR = 1.0
      XP = 1.0
      XT = 1.0
      IF(IDIM .EQ. 2) XL = 12.0
      IF(IDIM .EQ. 2) XP = 144.0
      IF(IDIM .GE. 3) XP = 0.0208854
      IF(IDIM .GE. 3) XR = 0.3048
      IF(IDIM .GE. 3) XT = 1.8
      IF(IDIM .EQ. 3) XL = 0.3048
      IF(IDIM .EQ. 4) XL = 30.48
      ALT  = FLC(K+96)
      VINF = FLC(I+136)
      PINF = FLC(K+73)
      TINF = FLC(K+116)
      IF(ALT  .NE. -UNUSED) ALT  = ALT *XL
      IF(VINF .NE. -UNUSED) VINF = VINF*XL
      IF(PINF .NE. -UNUSED) PINF = PINF/XP
      IF(TINF .NE. -UNUSED) TINF = TINF/XT
      RN   = FLC(I+42)/XR
      SRF  = OPT(1)*XL*XL/(SC*SC)
      CBAR = OPT(2)*XL/SC
      BLRF = OPT(4)*XL/SC
      XCG  = SYNA(1)
      ZCG  = SYNA(5)
      IF(XCG .EQ. UNUSED) XCG = 0.0
      IF(ZCG .EQ. UNUSED) ZCG = 0.0
      IF(BD(11) .NE. UNUSED) XCG = XCG+BD(11)
      XBN = BD(11)
      XCG  = XCG*XL/SC
      ZCG  = ZCG*XL/SC
      CALL SWRITE(11,FOR,46,ICONT,1,FLC(I+2),ALT,VINF,PINF,&
      &            TINF,RN,SRF,CBAR,BLRF,XCG,ZCG,DUM,&
      &            DUM,DUM,NDMF,NAF)
      IF(VTPL) XCGMAC=(XCG-SYNA(9)*XL/SC-AVT(195)*XL/SC)-XBN*XL/SC
      IF(HTPL) XCGMAC=(XCG-SYNA(6)*XL/SC-AHT(195)*XL/SC)-XBN*XL/SC
      IF(WGPL) XCGMAC=(XCG-SYNA(2)*XL/SC-A  (195)*XL/SC)-XBN*XL/SC
      IF(.NOT. BO) GO TO 1120
!
!     WRITE BODY AUXILIARY OUTPUTS IF BODY PRESENT
!
      BD93   = BD(93)*XL*XL/(SC*SC)
      BD57   = BD(57)*XL*XL/(SC*SC)
      SBD19  = SBD(19)*XL*XL/(SC*SC)
      SBD111 = SBD(111)*XL*XL/(SC*SC)
      WRITE(6,1470 )
      IF(SUBSON)CALL SWRITE(8,FOR1,34,ICON,1,BD93,XCG,ZCG,BD57,&
      &  BD(61),BD(60),BD(59),ANA,O,P,Q,R,S,T,NN,NM)
      IF(TRANSN)CALL SWRITE(8,FOR1,34,ICON,1,BD93,XCG,ZCG,BD57,&
      &  TRA(78),TRA(76),TRA(79),TRA(80),O,P,Q,R,S,T,NN,NM)
      IF(SUPHYP)CALL SWRITE(8,FOR1,34,ICON,1,SBD111,XCG,ZCG,SBD19,&
      &  SBD(124),SBD(123),SBD(115),ANA,O,P,Q,R,S,T,NN,NM)
 1120 IF(WGPL .OR. HTPL .OR. VTPL) WRITE(6,1480 ) XCGMAC
!
!     WRITE WING DATA IF WING PRESENT
!
      IF(.NOT. WGPL) GO TO 1130
      WRITE(6,1490 )
      IF(SUBSON)&
      & CALL AXPRNT(A,WINGIN,D(11),D(12),D(20),D(10),SYNA(2),&
      &             NN,NM,XL,SC,XBN)
      IF(TRANSN)&
      & CALL AXPRNT(A,WINGIN,ANA,ANA,WING(1),TRA(42),SYNA(2),&
      &             NN,NM,XL,SC,XBN)
      IF(SUPHYP)&
      & CALL AXPRNT(A,WINGIN,SLG(84),SLG(83),SLG(80),SLG(88),SYNA(2),&
      &             NN,NM,XL,SC,XBN)
!
!     WRITE H.T. DATA IF H.T. PRESENT
!
 1130 IF(.NOT. HTPL) GO TO 1140
      WRITE(6,1500 )
      IF(SUBSON)&
      & CALL AXPRNT(AHT,HTIN,DHT(11),DHT(12),DHT(20),DHT(10),SYNA(6),&
      &             NN,NM,XL,SC,XBN)
      IF(TRANSN)&
      & CALL AXPRNT(AHT,HTIN,ANA,ANA,HT(1),TRAH(42),SYNA(6),&
      &             NN,NM,XL,SC,XBN)
      IF(SUPHYP)&
      & CALL AXPRNT(AHT,HTIN,STG(84),STG(83),STG(80),STG(88),SYNA(6),&
      &             NN,NM,XL,SC,XBN)
!
!     WRITE V.T. DATA IF V.T. PRESENT
!
 1140 IF(.NOT. VTPL) GO TO 1150
      WRITE(6,1510 )
      IF(SUBSON)&
      & CALL AXPRNT(AVT,VTIN,DVT(11),DVT(12),DVT(20),DVT(10),SYNA(9),&
      &             NN,NM,XL,SC,XBN)
      IF(TRANSN)&
      & CALL AXPRNT(AVT,VTIN,ANA,ANA,ANA,ANA,SYNA(9),&
      &             NN,NM,XL,SC,XBN)
      IF(SUPHYP)&
      & CALL AXPRNT(AVT,VTIN,ANA,ANA,VT(1),ANA,SYNA(9),&
      &             NN,NM,XL,SC,XBN)
!
!     WRITE V.F. DATA IF V.F. PRESENT
!
 1150 IF(.NOT. VFPL) GO TO 1160
      WRITE(6,1520 )
      IF(SUBSON)&
      & CALL AXPRNT(AVF,VFIN,DVF(11),DVF(12),DVF(20),DVF(10),SYNA(12),&
      &             NN,NM,XL,SC,XBN)
      IF(TRANSN)&
      & CALL AXPRNT(AVF,VFIN,ANA,ANA,ANA,ANA,SYNA(12),&
      &             NN,NM,XL,SC,XBN)
      IF(SUPHYP)&
      & CALL AXPRNT(AVF,VFIN,ANA,ANA,VF(1),ANA,SYNA(12),&
      &             NN,NM,XL,SC,XBN)
 1160 IF(NN) WRITE(6,1770 )
      IF(NM) WRITE(6,1780 )
      NN = .FALSE.
      NM = .FALSE.
!
!****                  WRITE PARTIAL OUTPUTS
!
      IF(.NOT. BO) GO TO 1340
      IF(LAST .EQ. 1 .OR. LAST .EQ. 7) GO TO 1340
      WRITE(6,1550 )
      WRITE(6,1560 )
      GO TO (1170 ,1180 ,1190 ,1200 ,1210 ,1220 ,1230 ,1240 ,1250 ,1260&
      &), LAST
 1170 WRITE(6,1570 )
      GO TO 1270
 1180 WRITE(6,1580 )
      GO TO 1270
 1190 WRITE(6,1590 )
      GO TO 1270
 1200 WRITE(6,1600 )
      GO TO 1270
 1210 WRITE(6,1610 )
      GO TO 1270
 1220 WRITE(6,1620 )
      GO TO 1270
 1230 WRITE(6,1630 )
      GO TO 1270
 1240 WRITE(6,1640 )
      GO TO 1270
 1250 WRITE(6,1650 )
      GO TO 1270
 1260 WRITE(6,1660 )
 1270 IF(HEAD) CALL PRCSID
      WRITE(6,1670 )
      IF(IDIM .EQ. 1) WRITE(6,1680 )
      IF(IDIM .EQ. 2) WRITE(6,1690 )
      IF(IDIM .EQ. 3) WRITE(6,1700 )
      IF(IDIM .EQ. 4) WRITE(6,1710 )
      CALL SWRITE(11,FOR,46,ICONT,1,FLC(I+2),ALT,VINF,PINF,&
      &            TINF,RN,SRF,CBAR,BLRF,XCG,ZCG,DUM,&
      &            DUM,DUM,NDMF,NAF)
      IF(.NOT. WGPL) GO TO 1280
      IF(SUBSON)WRITE(6,1720 )WB(5),WB(4),WB(3),WB(2),WB(13)
      IF(TRANSN)WRITE(6,1720 )TRA(72),TRA(71),SWB(11),SWB(35),TRA(106)
      IF(SUPHYP)WRITE(6,1720 )SWB(7),SWB(33),SWB(11),SWB(35),SWB(8)
 1280 IF(.NOT. HTPL) GO TO 1290
      IF(SUBSON)WRITE(6,1730 )WBT(4),WBT(3),WBT(2),WBT(1),HB(13)
      IF(TRANSN)WRITE(6,1730 )TRAH(72),TRAH(71),SHB(11),SHB(35),TRAH(106&
      &)
      IF(SUPHYP)WRITE(6,1730 )STP(68),STP(67),STP(65),STP(66),SHB(8)
 1290 IF(.NOT. (WGPL .OR. HTPL)) GO TO 1340
      IF(STB(117) .EQ. UNUSED) GO TO 1300
      IF(WGPL .AND. (SUBSON .OR. TRANSN)) WRITE(6,1540 ) STB(117)
 1300 IF(.NOT. SUBSON) GO TO 1310
      WRITE(6,1740 )
      IF(WGPL .AND. HTPL)&
      & CALL SWRITE(6,FOR2,26,JCON,NALPHA,FLC(23),FACT(2),FACT(42),&
      & FACT(143),FACT(22),WBT(46),H,H,O,P,Q,R,S,T,NN,NM)
      IF(WGPL .AND. .NOT. HTPL)&
      & CALL SWRITE(6,FOR2,26,JCON,NALPHA,FLC(23),FACT(2),ANONE,&
      & ANONE,FACT(22),ANONE,H,H,O,P,Q,R,S,T,NN,NM)
      GO TO 1320
 1310 IF(TRANSN) GO TO 1320
      WRITE(6,1740 )
      IF(WGPL .AND. HTPL)&
      & CALL SWRITE(6,FOR2,26,JCON,NALPHA,FLC(23),SWB(12),STP(71),&
      & STP(133),SWB(40),STP(111),H,H,O,P,Q,R,S,T,NN,NM)
      IF(WGPL .AND. .NOT. HTPL)&
      & CALL SWRITE(6,FOR2,26,JCON,NALPHA,FLC(23),SWB(12),ANONE,&
      & ANONE,SWB(40),ANONE,H,H,O,P,Q,R,S,T,NN,NM)
 1320 CONTINUE
      IF(TRANSN .OR. HYPERS .OR. .NOT. DAMP) GO TO 1330
      WRITE(6,1760 )DYN(176),DYN(68),DYN(95),DYN(177),DYN(180)
      WRITE(6,1790 )
      KSAVE=KCON(1)
      KCON(1)=11
      FORSAV=FOR3(4)
      FORSAW=FOR3(5)
      FORSAX=FOR3(6)
      FOR3(4)=FOR3A(1)
      FOR3(5)=FOR3A(2)
      FOR3(6)=FOR3A(3)
      STB67=STB(67)
      SLA9=SLA(9)
      C4=C(4)
      CHT4=CHT(4)
      IF(STB(67) .EQ. UNUSED) STB67=2.*UNUSED
      IF(SLA(9) .EQ. UNUSED) SLA9=2.*UNUSED
      IF(C(4) .EQ. UNUSED) C4=2.*UNUSED
      IF(CHT(4) .EQ. UNUSED) CHT4=2.*UNUSED
      IF(SUBSON)CALL SWRITE(3,FOR3,14,KCON,1,STB67,C4,CHT4,&
      & H,O,P,Q,R,S,T,Q,R,S,T,NN,NM)
      IF(SUPERS)CALL SWRITE(3,FOR3,14,KCON,1,SLA9,C4,CHT4,&
      & H,O,P,Q,R,S,T,Q,R,S,T,NN,NM)
      KCON(1)=KSAVE
      FOR3(4)=FORSAV
      FOR3(5)=FORSAW
      FOR3(6)=FORSAX
 1330 CONTINUE
      IF(.NOT. (WGPL .AND. HTPL)) GO TO 1340
      IF(WINGIN(4)/HTIN(4) .GE. 1.5) GO TO 1340
      WRITE(6,1750 )
      CALL SWRITE(3,FOR3,14,KCON,NALPHA,FLC(23),FACT(102),FACT(122),&
      & H,O,P,Q,R,S,T,Q,R,S,T,NN,NM)
 1340 CONTINUE
      IF(NN) WRITE(6,1770 )
      IF(NM) WRITE(6,1780 )
      IF(LAST .EQ. 1 .OR. LAST .EQ. 4 .OR. LAST .EQ. 7) GO TO 1460
!
!     WRITE SECOND LEVEL METHOD DATA IF AVAILABLE
!
      IF(.NOT. TRANSN) GO TO 1460
      IF(.NOT. DOL2)   GO TO 1460
      WRITE(6,1550 )
      WRITE(6,1560 )
      GO TO (1350 ,1360 ,1370 ,1380 ,1390 ,1400 ,1410 ,1420 ,1430 ,1440&
      &), LAST
 1350 WRITE(6,1570 )
      GO TO 1450
 1360 WRITE(6,1580 )
      GO TO 1450
 1370 WRITE(6,1590 )
      GO TO 1450
 1380 WRITE(6,1600 )
      GO TO 1450
 1390 WRITE(6,1610 )
      GO TO 1450
 1400 WRITE(6,1620 )
      GO TO 1450
 1410 WRITE(6,1630 )
      GO TO 1450
 1420 WRITE(6,1640 )
      GO TO 1450
 1430 WRITE(6,1650 )
      GO TO 1450
 1440 WRITE(6,1660 )
 1450 IF(HEAD) CALL PRCSID
      WRITE(6,1670 )
      IF(IDIM .EQ. 1) WRITE(6,1680 )
      IF(IDIM .EQ. 2) WRITE(6,1690 )
      IF(IDIM .EQ. 3) WRITE(6,1700 )
      IF(IDIM .EQ. 4) WRITE(6,1710 )
      CALL SWRITE(11,FOR,46,ICONT,1,FLC(I+2),ALT,VINF,PINF,&
      &            TINF,RN,SRF,CBAR,BLRF,XCG,ZCG,DUM,&
      &            DUM,DUM,NDMF,NAF)
      CALL PRNSEC(LAST)
 1460 WRITE(6,1530 )
!
      RETURN
 1470 FORMAT(//55X,21HBASIC BODY PROPERTIES//12X,11HWETTED AREA,6X,&
      & 3HXCG,5X,3HZCG,5X,9HBASE AREA,5X,14HZERO LIFT DRAG,3X,&
      & 9HBASE DRAG,3X,13HFRICTION DRAG,3X,13HPRESSURE DRAG)
 1480 FORMAT(//41X,45HXCG RELATIVE TO THEORETICAL LEADING EDGE MAC=,F7.2&
      & ///55X,25HBASIC PLANFORM PROPERTIES//36X,5HTAPER,5X,6HASPECT,3X,&
      & 13HQUARTER CHORD,13X,13HQUARTER CHORD,14X,9HZERO LIFT,4X,&
      & 8HFRICTION/25X,4HAREA,7X,5HRATIO,6X,5HRATIO,7X,5HSWEEP,8X,&
      & 3HMAC,8X,6HX(MAC),7X,6HY(MAC),8X,4HDRAG,5X,11HCOEFFICIENT)
 1490 FORMAT(1H0,6X,4HWING)
 1500 FORMAT(1H0,2X,15HHORIZONTAL TAIL)
 1510 FORMAT(1H0,3X,13HVERTICAL TAIL)
 1520 FORMAT(1H0,4X,11HVENTRAL FIN)
 1530 FORMAT(1H1)
 1540 FORMAT(1H0,38X,38HSIDEWASH, (1 + D(SIGMA)/D(BETA))QV/Q =,1PE14.7)
 1550 FORMAT(1H1,29X,72HAUTOMATED STABILITY AND CONTROL METHODS PER APRI&
      &L 1976 VERSION OF DATCOM)
 1560 FORMAT(45X,42HCONFIGURATION AUXILIARY AND PARTIAL OUTPUT)
 1570 FORMAT(51X,31HDATCOM BODY ALONE CONFIGURATION)
 1580 FORMAT(54X,24HWING ALONE CONFIGURATION)
 1590 FORMAT(52X,29HHORIZONTAL TAIL CONFIGURATION)
 1600 FORMAT(53X,27HVERTICAL TAIL CONFIGURATION)
 1610 FORMAT(55X,23HWING-BODY CONFIGURATION)
 1620 FORMAT(49X,34HBODY-HORIZONTAL TAIL CONFIGURATION)
 1630 FORMAT(50X,32HBODY-VERTICAL TAIL CONFIGURATION)
 1640 FORMAT(47X,39HWING-BODY-HORIZONTAL TAIL CONFIGURATION)
 1650 FORMAT(48X,37HWING-BODY-VERTICAL TAIL CONFIGURATION)
 1660 FORMAT(40X,53HWING-BODY-VERTICAL TAIL-HORIZONTAL TAIL CONFIGURATIO&
      &N)
 1670 FORMAT(55H -----------------------  FLIGHT CONDITIONS  ----------,&
      &       14H--------------,11X,25H--------------  REFERENCE,&
      &       25H DIMENSIONS  ------------/2X,16HMACH    ALTITUDE,&
      &       3X,48HVELOCITY    PRESSURE    TEMPERATURE     REYNOLDS,&
      &       13X,47HREF.      REFERENCE LENGTH   MOMENT REF. CENTER/&
      &       7H NUMBER,55X,6HNUMBER,14X,4HAREA,7X,5HLONG.,5X,4HLAT.,&
      &       5X,15HHORIZ      VERT)
 1680 FORMAT(13X,2HFT,7X,6HFT/SEC,5X,8HLB/FT**2,7X,5HDEG R,9X,4H1/FT,&
      &       15X,5HFT**2,1X,4(7X,2HFT,1X))
 1690 FORMAT(13X,2HIN,7X,6HIN/SEC,5X,8HLB/IN**2,7X,5HDEG R,9X,4H1/FT,&
      &       15X,5HIN**2,1X,4(7X,2HIN,1X))
 1700 FORMAT(13X,2H M,7X,6H M/SEC,5X,8H N/ M**2,7X,5HDEG K,9X,4H1/ M,&
      &       15X,5H M**2,1X,4(7X,2H M,1X))
 1710 FORMAT(13X,2HCM,7X,6HCM/SEC,5X,8H N/CM**2,7X,5HDEG K,9X,4H1/ M,&
      &       15X,5HCM**2,1X,4(7X,2HCM,1X))
 1720 FORMAT(1H0,10X,9HCLA-B(W)=,1PE10.3,5X,9HCLA-W(B)=,E10.3,5X,&
      &  7HK-B(W)=,E10.3,5X,7HK-W(B)=,E10.3,5X,11HXAC/C-B(W)=,E10.3)
 1730 FORMAT(1H0,10X,9HCLA-B(H)=,1PE10.3,5X,9HCLA-H(B)=,E10.3,5X,&
      &  7HK-B(H)=,E10.3,5X,7HK-H(B)=,E10.3,5X,11HXAC/C-B(H)=,E10.3)
 1740 FORMAT(///16X,5HALPHA,9X,7HIV-B(W),10X,7HIV-W(H),&
      & 10X,7HIV-B(H),10X,6HGAMMA/,18X,6HGAMMA//78X,14H2*PI*ALPHA*V*R,&
      & 9X,17H(2*PI*ALPHA*V*R)T)
 1750 FORMAT(///55X,25HCANARD EFFECTIVE DOWNWASH/47X,5HALPHA,6X,&
      & 12H(EPSOLN)EFF.,5X,23HD(EPSOLN)/D(ALPHA) EFF.)
 1760 FORMAT(//50X,31HDYNAMIC DERIVATIVE INCREMENTALS /&
      & 10X,17HCLP(GAMMA=CL=0) =,1PE11.4,&
      &  5X,26HCLP(GAMMA)/CLP (GAMMA=0) =,E11.4,&
      &  6X,11HCNP/THETA =,E11.4/&
      & 30X,11HCYP/GAMMA =,E11.4,&
      & 20X,15HCYP/CL (CL=0) =,E11.4/)
 1770 FORMAT(45H0*** NDM PRINTED WHEN NO DATCOM METHODS EXIST)
 1780 FORMAT(42H0*** NA PRINTED WHEN METHOD NOT APPLICABLE)
 1790 FORMAT(45X,9HCLB/GAMMA,8X,12H(CMO/THETA)W,5X,12H(CMO/THETA)H)
      END
