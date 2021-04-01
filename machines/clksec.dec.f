C**********************************************
      FUNCTION   CLKSEC( oldsec)
C***********************************************
cANSI IMPLICIT  DOUBLE PRECISION (A-H,O-Z)
C
C     CLKSEC= Cumulative CPU time for job in seconds.  MKS unit is seconds.
C             Clock resolution should be less than 2% of Kernel 11 run-time.
C             ONLY CPU time should be measured, NO system or I/O time included.
C             In VM systems, page-fault time must be avoided (Direction 8).
C             CLKSEC accuracy may be tested by calling: CALIBR test.
C
C     IF your system provides a timing routine that satisfies
C     the definition above; THEN simply delete this function.
C
C     ELSE this function must be programmed using some
C     timing routine available in your system.
C     Timing routines with CPU-clock resolution are always  sufficient.
C     Timing routines with microsec. resolution are usually sufficient.
C
C     Timing routines with much less resolution have required the use
C     of multiple-pass loops around each kernel to make the run time
C     at least 50 times the tick-period of the timing routine.
C     Function SECOVT measures the overhead time for a call to CLKSEC.
C
C     If no CPU timer is available, then you can time each kernel by
C     the wall clock using the PAUSE statement at the end of func. TEST.
C
C     An independent calibration of the running time may be wise.
C     Compare the Total Job Cpu Time printout at end of the LFK output file
C     with the job Cpu time charged by your operating system.
C
C     Default, uni-processor tests measure job  Cpu-time in CLKSEC (TSS mode).
C     Parallel processing tests should measure Real-time in stand-alone mode.
C
C     The following statement is deliberately incomplete:
C
c      CLKSEC=                                                            sdef
C               USE THE HIGHEST RESOLUTION CPU-TIMER FUNCTION AVAILABLE
C*******************************************************************************
C
C     The following statements were used on a Digital Unix 4.0 system.
c     The etime routine in this OS version has enormous system
c     overhead time and is unusable. The secnds() function in the 
c     Fortran library works and has roughly 0.01 sec resolution.
C
      CLKSEC= secnds(oldsec)
      RETURN
      END
