
_interrupt:

;Control Remoto.mbas,6 :: 		sub procedure interrupt
;Control Remoto.mbas,8 :: 		if INTCON.0 = 1 then
	BTFSS      INTCON+0, 0
	GOTO       L__interrupt2
;Control Remoto.mbas,9 :: 		if PORTA.1 = 0 then
	BTFSC      PORTA+0, 1
	GOTO       L__interrupt5
;Control Remoto.mbas,10 :: 		PWM1_Init(38000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      209
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Control Remoto.mbas,11 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;Control Remoto.mbas,12 :: 		PWM1_Set_Duty(127)
	MOVLW      127
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Control Remoto.mbas,13 :: 		delay_ms(100)
	MOVLW      5
	MOVWF      R11
	MOVLW      15
	MOVWF      R12
	MOVLW      241
	MOVWF      R13
L__interrupt7:
	DECFSZ     R13, 1
	GOTO       L__interrupt7
	DECFSZ     R12, 1
	GOTO       L__interrupt7
	DECFSZ     R11, 1
	GOTO       L__interrupt7
;Control Remoto.mbas,14 :: 		UART1_Init(1200)
	BSF        BAUDCON+0, 3
	MOVLW      10
	MOVWF      SPBRG+0
	MOVLW      26
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Control Remoto.mbas,16 :: 		delay_ms(250)
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L__interrupt8:
	DECFSZ     R13, 1
	GOTO       L__interrupt8
	DECFSZ     R12, 1
	GOTO       L__interrupt8
	DECFSZ     R11, 1
	GOTO       L__interrupt8
	NOP
	NOP
;Control Remoto.mbas,17 :: 		UART1_Write_Text ("a")
	MOVLW      97
	MOVWF      ?LocalText_interrupt+0
	CLRF       ?LocalText_interrupt+1
	MOVLW      ?LocalText_interrupt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?LocalText_interrupt+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;Control Remoto.mbas,18 :: 		delay_ms(200)
	MOVLW      9
	MOVWF      R11
	MOVLW      30
	MOVWF      R12
	MOVLW      228
	MOVWF      R13
L__interrupt9:
	DECFSZ     R13, 1
	GOTO       L__interrupt9
	DECFSZ     R12, 1
	GOTO       L__interrupt9
	DECFSZ     R11, 1
	GOTO       L__interrupt9
	NOP
;Control Remoto.mbas,19 :: 		reset
	RESET
L__interrupt5:
;Control Remoto.mbas,22 :: 		if PORTA.3 = 0 then
	BTFSC      PORTA+0, 3
	GOTO       L__interrupt11
;Control Remoto.mbas,23 :: 		PWM1_Init(38000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      209
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Control Remoto.mbas,24 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;Control Remoto.mbas,25 :: 		PWM1_Set_Duty(127)
	MOVLW      127
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Control Remoto.mbas,26 :: 		delay_ms(100)
	MOVLW      5
	MOVWF      R11
	MOVLW      15
	MOVWF      R12
	MOVLW      241
	MOVWF      R13
L__interrupt13:
	DECFSZ     R13, 1
	GOTO       L__interrupt13
	DECFSZ     R12, 1
	GOTO       L__interrupt13
	DECFSZ     R11, 1
	GOTO       L__interrupt13
;Control Remoto.mbas,27 :: 		UART1_Init(1200)
	BSF        BAUDCON+0, 3
	MOVLW      10
	MOVWF      SPBRG+0
	MOVLW      26
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Control Remoto.mbas,29 :: 		delay_ms(250)
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L__interrupt14:
	DECFSZ     R13, 1
	GOTO       L__interrupt14
	DECFSZ     R12, 1
	GOTO       L__interrupt14
	DECFSZ     R11, 1
	GOTO       L__interrupt14
	NOP
	NOP
;Control Remoto.mbas,30 :: 		UART1_Write_Text ("b")
	MOVLW      98
	MOVWF      ?LocalText_interrupt+0
	CLRF       ?LocalText_interrupt+1
	MOVLW      ?LocalText_interrupt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?LocalText_interrupt+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;Control Remoto.mbas,31 :: 		delay_ms(200)
	MOVLW      9
	MOVWF      R11
	MOVLW      30
	MOVWF      R12
	MOVLW      228
	MOVWF      R13
L__interrupt15:
	DECFSZ     R13, 1
	GOTO       L__interrupt15
	DECFSZ     R12, 1
	GOTO       L__interrupt15
	DECFSZ     R11, 1
	GOTO       L__interrupt15
	NOP
;Control Remoto.mbas,32 :: 		reset
	RESET
L__interrupt11:
;Control Remoto.mbas,35 :: 		if PORTA.4 = 0 then
	BTFSC      PORTA+0, 4
	GOTO       L__interrupt17
;Control Remoto.mbas,36 :: 		PWM1_Init(38000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      209
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Control Remoto.mbas,37 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;Control Remoto.mbas,38 :: 		PWM1_Set_Duty(127)
	MOVLW      127
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Control Remoto.mbas,39 :: 		delay_ms(100)
	MOVLW      5
	MOVWF      R11
	MOVLW      15
	MOVWF      R12
	MOVLW      241
	MOVWF      R13
L__interrupt19:
	DECFSZ     R13, 1
	GOTO       L__interrupt19
	DECFSZ     R12, 1
	GOTO       L__interrupt19
	DECFSZ     R11, 1
	GOTO       L__interrupt19
;Control Remoto.mbas,40 :: 		UART1_Init(1200)
	BSF        BAUDCON+0, 3
	MOVLW      10
	MOVWF      SPBRG+0
	MOVLW      26
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Control Remoto.mbas,42 :: 		delay_ms(250)
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L__interrupt20:
	DECFSZ     R13, 1
	GOTO       L__interrupt20
	DECFSZ     R12, 1
	GOTO       L__interrupt20
	DECFSZ     R11, 1
	GOTO       L__interrupt20
	NOP
	NOP
;Control Remoto.mbas,43 :: 		UART1_Write_Text ("c")
	MOVLW      99
	MOVWF      ?LocalText_interrupt+0
	CLRF       ?LocalText_interrupt+1
	MOVLW      ?LocalText_interrupt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?LocalText_interrupt+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;Control Remoto.mbas,44 :: 		delay_ms(200)
	MOVLW      9
	MOVWF      R11
	MOVLW      30
	MOVWF      R12
	MOVLW      228
	MOVWF      R13
L__interrupt21:
	DECFSZ     R13, 1
	GOTO       L__interrupt21
	DECFSZ     R12, 1
	GOTO       L__interrupt21
	DECFSZ     R11, 1
	GOTO       L__interrupt21
	NOP
;Control Remoto.mbas,45 :: 		reset
	RESET
L__interrupt17:
;Control Remoto.mbas,48 :: 		if PORTA.5 = 0 then
	BTFSC      PORTA+0, 5
	GOTO       L__interrupt23
;Control Remoto.mbas,49 :: 		PWM1_Init(38000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      209
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Control Remoto.mbas,50 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;Control Remoto.mbas,51 :: 		PWM1_Set_Duty(127)
	MOVLW      127
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Control Remoto.mbas,52 :: 		delay_ms(100)
	MOVLW      5
	MOVWF      R11
	MOVLW      15
	MOVWF      R12
	MOVLW      241
	MOVWF      R13
L__interrupt25:
	DECFSZ     R13, 1
	GOTO       L__interrupt25
	DECFSZ     R12, 1
	GOTO       L__interrupt25
	DECFSZ     R11, 1
	GOTO       L__interrupt25
;Control Remoto.mbas,53 :: 		UART1_Init(1200)
	BSF        BAUDCON+0, 3
	MOVLW      10
	MOVWF      SPBRG+0
	MOVLW      26
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Control Remoto.mbas,55 :: 		delay_ms(250)
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L__interrupt26:
	DECFSZ     R13, 1
	GOTO       L__interrupt26
	DECFSZ     R12, 1
	GOTO       L__interrupt26
	DECFSZ     R11, 1
	GOTO       L__interrupt26
	NOP
	NOP
;Control Remoto.mbas,56 :: 		UART1_Write_Text ("d")
	MOVLW      100
	MOVWF      ?LocalText_interrupt+0
	CLRF       ?LocalText_interrupt+1
	MOVLW      ?LocalText_interrupt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	MOVLW      hi_addr(?LocalText_interrupt+0)
	MOVWF      FARG_UART1_Write_Text_uart_text+1
	CALL       _UART1_Write_Text+0
;Control Remoto.mbas,57 :: 		delay_ms(200)
	MOVLW      9
	MOVWF      R11
	MOVLW      30
	MOVWF      R12
	MOVLW      228
	MOVWF      R13
L__interrupt27:
	DECFSZ     R13, 1
	GOTO       L__interrupt27
	DECFSZ     R12, 1
	GOTO       L__interrupt27
	DECFSZ     R11, 1
	GOTO       L__interrupt27
	NOP
;Control Remoto.mbas,58 :: 		reset
	RESET
L__interrupt23:
;Control Remoto.mbas,61 :: 		IOCAF = %00000000
	CLRF       IOCAF+0
L__interrupt2:
;Control Remoto.mbas,64 :: 		end sub
L_end_interrupt:
L__interrupt32:
	RETFIE     %s
; end of _interrupt

_main:

;Control Remoto.mbas,66 :: 		main:'   Main program
;Control Remoto.mbas,67 :: 		OSCCON = %11110000
	MOVLW      240
	MOVWF      OSCCON+0
;Control Remoto.mbas,68 :: 		TRISA = %00111010
	MOVLW      58
	MOVWF      TRISA+0
;Control Remoto.mbas,69 :: 		ANSELA = %00000000
	CLRF       ANSELA+0
;Control Remoto.mbas,70 :: 		PORTA = %00111010
	MOVLW      58
	MOVWF      PORTA+0
;Control Remoto.mbas,71 :: 		OPTION_REG.7 = 0
	BCF        OPTION_REG+0, 7
;Control Remoto.mbas,72 :: 		WPUA = %00111010
	MOVLW      58
	MOVWF      WPUA+0
;Control Remoto.mbas,74 :: 		delay_ms(50)
	MOVLW      3
	MOVWF      R11
	MOVLW      8
	MOVWF      R12
	MOVLW      119
	MOVWF      R13
L__main29:
	DECFSZ     R13, 1
	GOTO       L__main29
	DECFSZ     R12, 1
	GOTO       L__main29
	DECFSZ     R11, 1
	GOTO       L__main29
;Control Remoto.mbas,76 :: 		IOCAN = %00111010
	MOVLW      58
	MOVWF      IOCAN+0
;Control Remoto.mbas,77 :: 		IOCAF = %00000000
	CLRF       IOCAF+0
;Control Remoto.mbas,78 :: 		INTCON = %10001000
	MOVLW      136
	MOVWF      INTCON+0
;Control Remoto.mbas,80 :: 		inicio:
L__main_inicio:
;Control Remoto.mbas,81 :: 		sleep
	SLEEP
;Control Remoto.mbas,82 :: 		goto inicio
	GOTO       L__main_inicio
L_end_main:
	GOTO       $+0
; end of _main
