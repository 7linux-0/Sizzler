LDmicro0.1
MICRO=Atmel AVR ATmega128 64-TQFP
CYCLE=10000 us at Timer1, YPlcCycleDuty:0, ConfigurationWord(s):0x369A175A00000000
CRYSTAL=4000000 Hz
BAUD=2400 Hz, RATE=0 Hz, SPEED=0 Hz
COMPILED=C:\depot\ldmicro\reg\expected\avr-hw.hex

IO LIST
    Xinc at 2 0 0
    Aanalog at 61 0 0
END

PROGRAM
RUNG
  PLACEHOLDER
END
RUNG
  PERSIST saved
END
RUNG
  READ_ADC Aanalog 0
END
RUNG
  PARALLEL

  END
  OSR
  ADD saved saved 1
END
RUNG
  PARALLEL
    SERIES
      LES saved 10
      MOVE duty 20
    END
    SERIES
      GEQ saved 10
      MOVE duty 50
    END
    SET_PWM duty 2000 P 
  END
END
RUNG
  TON Tfmtd 1000000 -1
  OSR
  FORMATTED_STRING saved 15 115 97 118 101 100 32 61 32 92 45 53 92 114 92 110
END
RUNG
  MOVE char 'x'
END
RUNG
  TON Tutx 2000000 -1
  OSR
  UART_SEND char 1 0
END
RUNG
  UART_RECV inchar 1 0
  EQU inchar 'a'
  MOVE saved 0
END
