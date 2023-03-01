LDmicro0.1
CYCLE=5000 us at Timer1, YPlcCycleDuty:0, ConfigurationWord(s):0x3D5E329A00000000
CRYSTAL=4000000 Hz
BAUD=2400 Hz, RATE=0 Hz, SPEED=0 Hz

IO LIST
    Ycom_digit0 at 0 0 0
    Ycom_digit1 at 0 0 0
    Ycom_digit2 at 0 0 0
    Yseg_a at 0 0 0
    Yseg_b at 0 0 0
    Yseg_c at 0 0 0
    Yseg_d at 0 0 0
    Yseg_e at 0 0 0
    Yseg_f at 0 0 0
    Yseg_g at 0 0 0
END

PROGRAM
RUNG
  PLACEHOLDER
END
RUNG
  PLACEHOLDER
END
RUNG
  CONTACTS Rdosc 1 0
  COIL Rdosc 0 0 0 0
END
RUNG
  CONTACTS Rdosc 0 0
  CTC Cdigit 2 0 /
END
RUNG
  PLACEHOLDER
END
RUNG
  PARALLEL
    SERIES
      EQU Cdigit 0
      PARALLEL
        COIL Ycom_digit0 0 0 0 0
        MOVE digit digit0
      END
      PARALLEL
        EQU Cdigit 0
      END
    END
    SERIES
      EQU Cdigit 1
      PARALLEL
        COIL Ycom_digit1 0 0 0 0
        MOVE digit digit1
      END
    END
    SERIES
      EQU Cdigit 2
      PARALLEL
        COIL Ycom_digit2 0 0 0 0
        MOVE digit digit2
      END
    END
  END
END
RUNG
  PLACEHOLDER
END
RUNG
  PARALLEL
    SERIES
      NEQ digit 1
      NEQ digit 4
      COIL Yseg_a 0 0 0 0
    END
    SERIES
      NEQ digit 5
      NEQ digit 6
      COIL Yseg_b 0 0 0 0
    END
    SERIES
      NEQ digit 2
      COIL Yseg_c 0 0 0 0
    END
    SERIES
      NEQ digit 1
      NEQ digit 4
      NEQ digit 7
      COIL Yseg_d 0 0 0 0
    END
    SERIES
      PARALLEL
        EQU digit 0
        EQU digit 2
        EQU digit 6
        EQU digit 8
      END
      COIL Yseg_e 0 0 0 0
    END
    SERIES
      NEQ digit 1
      NEQ digit 2
      NEQ digit 3
      NEQ digit 7
      COIL Yseg_f 0 0 0 0
    END
    SERIES
      NEQ digit 0
      NEQ digit 1
      NEQ digit 7
      COIL Yseg_g 0 0 0 0
    END
  END
END
RUNG
  PLACEHOLDER
END
RUNG
  PARALLEL
    MOVE digit0 1
    MOVE digit1 8
    MOVE digit2 5
  END
END
RUNG
  PLACEHOLDER
END
