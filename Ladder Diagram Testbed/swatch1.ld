LDmicro0.1
MICRO=Microchip PIC16F877 40-PDIP
CYCLE=1000 us at Timer0, YPlcCycleDuty:1
CRYSTAL=16000000 Hz
BAUD=9600 Hz
COMPILED=D:\LDs\SWATCH1\swatch1.hex

IO LIST
    X_StartStopContinue at 33 0 0
    X_StopZero at 34 0 0
    Y1s at 35 0 0
    YPlcCycleDuty at 18 0 0
END

PROGRAM
RUNG

END
RUNG

END
RUNG
  FORMATTED_STRING (none) 45 92 102 92 114 92 110 83 116 111 112 119 97 116 99 104 32 111 118 101 114 32 85 65 82 84 46 92 114 92 110 104 104 58 109 109 58 115 115 46 115 49 48 48 92 110
  OSF
  COIL RInited 0 1 0
END
RUNG
  COMMENT Checking the input switches on a board.\r\nT1 and T2 prevent contact bounce of switches. If not, then increase T1, T2 (100ms max value).
END
RUNG
  CONTACTS X_StartStopContinue 1
  TOF T1 25000
  OSF
  COIL RStartStopContinue 0 1 0
END
RUNG
  CONTACTS X_StopZero 1
  TOF T2 25000
  OSF
  COIL RStopZero 0 1 0
END
RUNG

END
RUNG
  UART_RECV char
  PARALLEL
    SERIES
      EQU char '1'
      COIL RStartStopContinue 0 1 0
    END
    SERIES
      EQU char '0'
      COIL RStopZero 0 1 0
    END
  END
END
RUNG

END
RUNG

END
RUNG

END
RUNG
  CONTACTS RStartStopContinue 0
  PARALLEL
    CTC CState 1 0
    COIL RStartStopContinue 0 0 1
  END
END
RUNG
  CONTACTS RStopZero 0
  PARALLEL
    SERIES
      OSR
      EQU CState 0
      PARALLEL
        MOVE Cs100 0
        MOVE Css 0
        MOVE Cmm 0
        MOVE Chh 0
      END
    END
    MOVE CState 0
    COIL RStopZero 0 0 1
  END
END
RUNG
  OSR  
  MOVE CState 1
END
RUNG

END
RUNG
  EQU CState 1
  RTO T100_Hz 10000
  PARALLEL
    SERIES
      CTC Cs100 99 0
      CTC Css 59 0
      CTC Cmm 59 0
      CTC Chh 23 0
    END
    RES T100_Hz
  END
END
RUNG
 
END
RUNG
  CONTACTS RInited 0
  RTO TdisplayRefresh 10000
  PARALLEL
    SERIES
      FORMATTED_STRING Chh 5 92 114 92 50 58
      OSF
      FORMATTED_STRING Cmm 3 92 50 58
      OSF
      FORMATTED_STRING Css 3 92 50 46
      OSF
      FORMATTED_STRING Cs100 2 92 50
      OSF
      COIL RAllDisplayed 0 0 0
    END
    SERIES
      CONTACTS RAllDisplayed 0
      RES TdisplayRefresh
    END
  END
END
RUNG
  LES Cs100 50
  COIL Y1s 0 0 0
  COIL Y1s 0 0 0
  COIL Y2s  0 0
END
RUNG

END
