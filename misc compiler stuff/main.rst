                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.1 #15267 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	
                                      7 ;--------------------------------------------------------
                                      8 ; Public variables in this module
                                      9 ;--------------------------------------------------------
                                     10 	.globl _main
                                     11 	.globl _printTurn
                                     12 	.globl _hasValidMoves
                                     13 	.globl _hasValidNonCaptureMoves
                                     14 	.globl _hasValidCaptureMoves
                                     15 	.globl _checkCollision
                                     16 	.globl _isValidMove
                                     17 	.globl _getCaptureIndex
                                     18 	.globl _isMoveWithinBoard
                                     19 	.globl _printWhite
                                     20 	.globl _printBlack
                                     21 	.globl _printSquare
                                     22 	.globl _printbkg
                                     23 	.globl _font
                                     24 	.globl _dpad
                                     25 	.globl _promoteToKing
                                     26 	.globl _moveSquare
                                     27 	.globl _font_set
                                     28 	.globl _font_load
                                     29 	.globl _font_init
                                     30 	.globl _abs
                                     31 	.globl _set_sprite_data
                                     32 	.globl _set_win_tiles
                                     33 	.globl _set_bkg_tiles
                                     34 	.globl _set_bkg_data
                                     35 	.globl _joypad
                                     36 	.globl _delay
                                     37 	.globl _whitePieces
                                     38 	.globl _blackPieces
                                     39 	.globl _whiteKing
                                     40 	.globl _blackKing
                                     41 	.globl _blackWins
                                     42 	.globl _whiteWins
                                     43 	.globl _clearText
                                     44 	.globl _currentPlayerWhiteText
                                     45 	.globl _currentPlayerBlackText
                                     46 	.globl _white_piece
                                     47 	.globl _black_piece
                                     48 	.globl _squareBR
                                     49 	.globl _squareBL
                                     50 	.globl _squareTR
                                     51 	.globl _squareTL
                                     52 	.globl _map
                                     53 	.globl _tile3
                                     54 	.globl _tile2
                                     55 	.globl _tile1
                                     56 	.globl _pieceSelected
                                     57 	.globl _selectedCoords
                                     58 	.globl _currentPlayer
                                     59 	.globl _cursory
                                     60 	.globl _cursorx
                                     61 	.globl _selectedPieceIndex
                                     62 	.globl _debounceTimer
                                     63 	.globl _lastButtonState
                                     64 	.globl _joypad_input
                                     65 ;--------------------------------------------------------
                                     66 ; special function registers
                                     67 ;--------------------------------------------------------
                                     68 	.area _HRAM
                                     69 ;--------------------------------------------------------
                                     70 ; ram data
                                     71 ;--------------------------------------------------------
                                     72 	.area _DATA
                         00000000    73 G$joypad_input$0_0$0==.
    0000C0B1                         74 _joypad_input::
    0000C0B1                         75 	.ds 1
                                     76 ;--------------------------------------------------------
                                     77 ; ram data
                                     78 ;--------------------------------------------------------
                                     79 	.area _INITIALIZED
                         00000000    80 G$lastButtonState$0_0$0==.
    0000C0D0                         81 _lastButtonState::
    0000C0D0                         82 	.ds 1
                         00000001    83 G$debounceTimer$0_0$0==.
    0000C0D1                         84 _debounceTimer::
    0000C0D1                         85 	.ds 2
                         00000003    86 G$selectedPieceIndex$0_0$0==.
    0000C0D3                         87 _selectedPieceIndex::
    0000C0D3                         88 	.ds 2
                         00000005    89 G$cursorx$0_0$0==.
    0000C0D5                         90 _cursorx::
    0000C0D5                         91 	.ds 1
                         00000006    92 G$cursory$0_0$0==.
    0000C0D6                         93 _cursory::
    0000C0D6                         94 	.ds 1
                         00000007    95 G$currentPlayer$0_0$0==.
    0000C0D7                         96 _currentPlayer::
    0000C0D7                         97 	.ds 1
                         00000008    98 G$selectedCoords$0_0$0==.
    0000C0D8                         99 _selectedCoords::
    0000C0D8                        100 	.ds 2
                         0000000A   101 G$pieceSelected$0_0$0==.
    0000C0DA                        102 _pieceSelected::
    0000C0DA                        103 	.ds 1
                         0000000B   104 G$tile1$0_0$0==.
    0000C0DB                        105 _tile1::
    0000C0DB                        106 	.ds 16
                         0000001B   107 G$tile2$0_0$0==.
    0000C0EB                        108 _tile2::
    0000C0EB                        109 	.ds 16
                         0000002B   110 G$tile3$0_0$0==.
    0000C0FB                        111 _tile3::
    0000C0FB                        112 	.ds 16
                         0000003B   113 G$map$0_0$0==.
    0000C10B                        114 _map::
    0000C10B                        115 	.ds 360
                         000001A3   116 G$squareTL$0_0$0==.
    0000C273                        117 _squareTL::
    0000C273                        118 	.ds 16
                         000001B3   119 G$squareTR$0_0$0==.
    0000C283                        120 _squareTR::
    0000C283                        121 	.ds 16
                         000001C3   122 G$squareBL$0_0$0==.
    0000C293                        123 _squareBL::
    0000C293                        124 	.ds 16
                         000001D3   125 G$squareBR$0_0$0==.
    0000C2A3                        126 _squareBR::
    0000C2A3                        127 	.ds 16
                         000001E3   128 G$black_piece$0_0$0==.
    0000C2B3                        129 _black_piece::
    0000C2B3                        130 	.ds 16
                         000001F3   131 G$white_piece$0_0$0==.
    0000C2C3                        132 _white_piece::
    0000C2C3                        133 	.ds 16
                         00000203   134 G$currentPlayerBlackText$0_0$0==.
    0000C2D3                        135 _currentPlayerBlackText::
    0000C2D3                        136 	.ds 16
                         00000213   137 G$currentPlayerWhiteText$0_0$0==.
    0000C2E3                        138 _currentPlayerWhiteText::
    0000C2E3                        139 	.ds 16
                         00000223   140 G$clearText$0_0$0==.
    0000C2F3                        141 _clearText::
    0000C2F3                        142 	.ds 16
                         00000233   143 G$whiteWins$0_0$0==.
    0000C303                        144 _whiteWins::
    0000C303                        145 	.ds 16
                         00000243   146 G$blackWins$0_0$0==.
    0000C313                        147 _blackWins::
    0000C313                        148 	.ds 16
                         00000253   149 G$blackKing$0_0$0==.
    0000C323                        150 _blackKing::
    0000C323                        151 	.ds 16
                         00000263   152 G$whiteKing$0_0$0==.
    0000C333                        153 _whiteKing::
    0000C333                        154 	.ds 16
                         00000273   155 G$blackPieces$0_0$0==.
    0000C343                        156 _blackPieces::
    0000C343                        157 	.ds 36
                         00000297   158 G$whitePieces$0_0$0==.
    0000C367                        159 _whitePieces::
    0000C367                        160 	.ds 36
                                    161 ;--------------------------------------------------------
                                    162 ; absolute external ram data
                                    163 ;--------------------------------------------------------
                                    164 	.area _DABS (ABS)
                                    165 ;--------------------------------------------------------
                                    166 ; global & static initialisations
                                    167 ;--------------------------------------------------------
                                    168 	.area _HOME
                                    169 	.area _GSINIT
                                    170 	.area _GSFINAL
                                    171 	.area _GSINIT
                                    172 ;--------------------------------------------------------
                                    173 ; Home
                                    174 ;--------------------------------------------------------
                                    175 	.area _HOME
                                    176 	.area _HOME
                                    177 ;--------------------------------------------------------
                                    178 ; code
                                    179 ;--------------------------------------------------------
                                    180 	.area _CODE
                         00000000   181 	G$moveSquare$0$0	= .
                                    182 	.globl	G$moveSquare$0$0
                         00000000   183 	C$main.c$106$0_0$155	= .
                                    184 	.globl	C$main.c$106$0_0$155
                                    185 ;..\main.c:106: void moveSquare() {
                                    186 ;	---------------------------------
                                    187 ; Function moveSquare
                                    188 ; ---------------------------------
    00000200                        189 _moveSquare::
                                    190 ;..\main.c:107: move_sprite(0, cursorx - 8, cursory - 8);
    00000200 FA D6 C0         [16]  191 	ld	a, (_cursory)
    00000203 C6 F8            [ 8]  192 	add	a, #0xf8
    00000205 47               [ 4]  193 	ld	b, a
    00000206 FA D5 C0         [16]  194 	ld	a, (_cursorx)
    00000209 C6 F8            [ 8]  195 	add	a, #0xf8
    0000020B 4F               [ 4]  196 	ld	c, a
                                    197 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
    0000020C 21 00 C0         [12]  198 	ld	hl, #_shadow_OAM
                                    199 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
    0000020F 78               [ 4]  200 	ld	a, b
    00000210 22               [ 8]  201 	ld	(hl+), a
    00000211 71               [ 8]  202 	ld	(hl), c
                                    203 ;..\main.c:108: move_sprite(1, cursorx + 0, cursory - 8);
    00000212 FA D6 C0         [16]  204 	ld	a, (_cursory)
    00000215 C6 F8            [ 8]  205 	add	a, #0xf8
    00000217 47               [ 4]  206 	ld	b, a
    00000218 FA D5 C0         [16]  207 	ld	a, (_cursorx)
    0000021B 4F               [ 4]  208 	ld	c, a
                                    209 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
    0000021C 21 04 C0         [12]  210 	ld	hl, #(_shadow_OAM + 4)
                                    211 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
    0000021F 78               [ 4]  212 	ld	a, b
    00000220 22               [ 8]  213 	ld	(hl+), a
    00000221 71               [ 8]  214 	ld	(hl), c
                                    215 ;..\main.c:109: move_sprite(2, cursorx - 8, cursory + 0);
    00000222 FA D6 C0         [16]  216 	ld	a, (_cursory)
    00000225 47               [ 4]  217 	ld	b, a
    00000226 FA D5 C0         [16]  218 	ld	a, (_cursorx)
    00000229 C6 F8            [ 8]  219 	add	a, #0xf8
    0000022B 4F               [ 4]  220 	ld	c, a
                                    221 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
    0000022C 21 08 C0         [12]  222 	ld	hl, #(_shadow_OAM + 8)
                                    223 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
    0000022F 78               [ 4]  224 	ld	a, b
    00000230 22               [ 8]  225 	ld	(hl+), a
    00000231 71               [ 8]  226 	ld	(hl), c
                                    227 ;..\main.c:110: move_sprite(3, cursorx + 0, cursory + 0);
    00000232 FA D6 C0         [16]  228 	ld	a, (_cursory)
    00000235 47               [ 4]  229 	ld	b, a
    00000236 FA D5 C0         [16]  230 	ld	a, (_cursorx)
    00000239 4F               [ 4]  231 	ld	c, a
                                    232 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
    0000023A 21 0C C0         [12]  233 	ld	hl, #(_shadow_OAM + 12)
                                    234 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
    0000023D 78               [ 4]  235 	ld	a, b
    0000023E 22               [ 8]  236 	ld	(hl+), a
    0000023F 71               [ 8]  237 	ld	(hl), c
                         00000040   238 	C$main.c$110$3_0$155	= .
                                    239 	.globl	C$main.c$110$3_0$155
                                    240 ;..\main.c:110: move_sprite(3, cursorx + 0, cursory + 0);
                         00000040   241 	C$main.c$111$3_0$155	= .
                                    242 	.globl	C$main.c$111$3_0$155
                                    243 ;..\main.c:111: }
                         00000040   244 	C$main.c$111$3_0$155	= .
                                    245 	.globl	C$main.c$111$3_0$155
                         00000040   246 	XG$moveSquare$0$0	= .
                                    247 	.globl	XG$moveSquare$0$0
    00000240 C9               [16]  248 	ret
                         00000041   249 	G$promoteToKing$0$0	= .
                                    250 	.globl	G$promoteToKing$0$0
                         00000041   251 	C$main.c$127$3_0$170	= .
                                    252 	.globl	C$main.c$127$3_0$170
                                    253 ;..\main.c:127: void promoteToKing(Piece* pieces, int numPieces, UINT8 player) {
                                    254 ;	---------------------------------
                                    255 ; Function promoteToKing
                                    256 ; ---------------------------------
    00000241                        257 _promoteToKing::
    00000241 E8 F8            [16]  258 	add	sp, #-8
    00000243 F8 06            [12]  259 	ldhl	sp,	#6
    00000245 7B               [ 4]  260 	ld	a, e
    00000246 22               [ 8]  261 	ld	(hl+), a
    00000247 72               [ 8]  262 	ld	(hl), d
    00000248 F8 04            [12]  263 	ldhl	sp,	#4
    0000024A 79               [ 4]  264 	ld	a, c
    0000024B 22               [ 8]  265 	ld	(hl+), a
    0000024C 70               [ 8]  266 	ld	(hl), b
                         0000004D   267 	C$main.c$128$4_0$172	= .
                                    268 	.globl	C$main.c$128$4_0$172
                                    269 ;..\main.c:128: for (int i = 0; i < numPieces; i++) {
    0000024D F8 0A            [12]  270 	ldhl	sp,	#10
    0000024F 7E               [ 8]  271 	ld	a, (hl)
    00000250 3D               [ 4]  272 	dec	a
    00000251 3E 01            [ 8]  273 	ld	a, #0x01
    00000253 28 01            [12]  274 	jr	Z, 00158$
    00000255 AF               [ 4]  275 	xor	a, a
    00000256                        276 00158$:
    00000256 F8 02            [12]  277 	ldhl	sp,	#2
    00000258 77               [ 8]  278 	ld	(hl), a
    00000259 01 00 00         [12]  279 	ld	bc, #0x0000
    0000025C                        280 00110$:
    0000025C F8 04            [12]  281 	ldhl	sp,	#4
    0000025E 79               [ 4]  282 	ld	a, c
    0000025F 96               [ 8]  283 	sub	a, (hl)
    00000260 23               [ 8]  284 	inc	hl
    00000261 78               [ 4]  285 	ld	a, b
    00000262 9E               [ 8]  286 	sbc	a, (hl)
    00000263 78               [ 4]  287 	ld	a, b
    00000264 57               [ 4]  288 	ld	d, a
    00000265 5E               [ 8]  289 	ld	e, (hl)
    00000266 CB 7B            [ 8]  290 	bit	7, e
    00000268 28 07            [12]  291 	jr	Z, 00159$
    0000026A CB 7A            [ 8]  292 	bit	7, d
    0000026C 20 08            [12]  293 	jr	NZ, 00160$
    0000026E BF               [ 4]  294 	cp	a, a
    0000026F 18 05            [12]  295 	jr	00160$
    00000271                        296 00159$:
    00000271 CB 7A            [ 8]  297 	bit	7, d
    00000273 28 01            [12]  298 	jr	Z, 00160$
    00000275 37               [ 4]  299 	scf
    00000276                        300 00160$:
    00000276 30 3D            [12]  301 	jr	NC, 00112$
                         00000078   302 	C$main.c$129$2_0$170	= .
                                    303 	.globl	C$main.c$129$2_0$170
                                    304 ;..\main.c:129: if (pieces[i].y == 28 && player == WHITE_PLAYER) {
    00000278 69               [ 4]  305 	ld	l, c
    00000279 60               [ 4]  306 	ld	h, b
    0000027A 29               [ 8]  307 	add	hl, hl
    0000027B 09               [ 8]  308 	add	hl, bc
    0000027C 33               [ 8]  309 	inc	sp
    0000027D 33               [ 8]  310 	inc	sp
    0000027E 5D               [ 4]  311 	ld	e, l
    0000027F 54               [ 4]  312 	ld	d, h
    00000280 D5               [16]  313 	push	de
    00000281 F8 06            [12]  314 	ldhl	sp,	#6
    00000283 2A               [ 8]  315 	ld	a,	(hl+)
    00000284 66               [ 8]  316 	ld	h, (hl)
    00000285 6F               [ 4]  317 	ld	l, a
    00000286 19               [ 8]  318 	add	hl, de
    00000287 5D               [ 4]  319 	ld	e,l
    00000288 54               [ 4]  320 	ld	d,h
    00000289 23               [ 8]  321 	inc	hl
    0000028A 7E               [ 8]  322 	ld	a, (hl)
    0000028B F8 03            [12]  323 	ldhl	sp,	#3
    0000028D 77               [ 8]  324 	ld	(hl), a
                         0000008E   325 	C$main.c$130$2_0$170	= .
                                    326 	.globl	C$main.c$130$2_0$170
                                    327 ;..\main.c:130: pieces[i].isKing = true;
    0000028E 13               [ 8]  328 	inc	de
    0000028F 13               [ 8]  329 	inc	de
                         00000090   330 	C$main.c$129$4_0$172	= .
                                    331 	.globl	C$main.c$129$4_0$172
                                    332 ;..\main.c:129: if (pieces[i].y == 28 && player == WHITE_PLAYER) {
    00000290 F8 03            [12]  333 	ldhl	sp,	#3
    00000292 7E               [ 8]  334 	ld	a, (hl)
    00000293 D6 1C            [ 8]  335 	sub	a, #0x1c
    00000295 20 0B            [12]  336 	jr	NZ, 00105$
    00000297 F8 02            [12]  337 	ldhl	sp,	#2
    00000299 7E               [ 8]  338 	ld	a, (hl)
    0000029A B7               [ 4]  339 	or	a, a
    0000029B 28 05            [12]  340 	jr	Z, 00105$
                         0000009D   341 	C$main.c$130$5_0$173	= .
                                    342 	.globl	C$main.c$130$5_0$173
                                    343 ;..\main.c:130: pieces[i].isKing = true;
    0000029D 3E 01            [ 8]  344 	ld	a, #0x01
    0000029F 12               [ 8]  345 	ld	(de), a
    000002A0 18 10            [12]  346 	jr	00111$
    000002A2                        347 00105$:
                         000000A2   348 	C$main.c$131$5_0$174	= .
                                    349 	.globl	C$main.c$131$5_0$174
                                    350 ;..\main.c:131: } else if (pieces[i].y == 140 && player == BLACK_PLAYER) {
    000002A2 F8 03            [12]  351 	ldhl	sp,	#3
    000002A4 7E               [ 8]  352 	ld	a, (hl)
    000002A5 D6 8C            [ 8]  353 	sub	a, #0x8c
    000002A7 20 09            [12]  354 	jr	NZ, 00111$
    000002A9 F8 0A            [12]  355 	ldhl	sp,	#10
    000002AB 7E               [ 8]  356 	ld	a, (hl)
    000002AC B7               [ 4]  357 	or	a, a
    000002AD 20 03            [12]  358 	jr	NZ, 00111$
                         000000AF   359 	C$main.c$132$6_0$175	= .
                                    360 	.globl	C$main.c$132$6_0$175
                                    361 ;..\main.c:132: pieces[i].isKing = true;
    000002AF 3E 01            [ 8]  362 	ld	a, #0x01
    000002B1 12               [ 8]  363 	ld	(de), a
    000002B2                        364 00111$:
                         000000B2   365 	C$main.c$128$2_0$170	= .
                                    366 	.globl	C$main.c$128$2_0$170
                                    367 ;..\main.c:128: for (int i = 0; i < numPieces; i++) {
    000002B2 03               [ 8]  368 	inc	bc
    000002B3 18 A7            [12]  369 	jr	00110$
    000002B5                        370 00112$:
                         000000B5   371 	C$main.c$135$2_0$170	= .
                                    372 	.globl	C$main.c$135$2_0$170
                                    373 ;..\main.c:135: }
    000002B5 E8 08            [16]  374 	add	sp, #8
    000002B7 E1               [12]  375 	pop	hl
    000002B8 33               [ 8]  376 	inc	sp
    000002B9 E9               [ 4]  377 	jp	(hl)
                         000000BA   378 	G$dpad$0$0	= .
                                    379 	.globl	G$dpad$0$0
                         000000BA   380 	C$main.c$136$2_0$176	= .
                                    381 	.globl	C$main.c$136$2_0$176
                                    382 ;..\main.c:136: void dpad() {
                                    383 ;	---------------------------------
                                    384 ; Function dpad
                                    385 ; ---------------------------------
    000002BA                        386 _dpad::
                         000000BA   387 	C$main.c$137$1_0$176	= .
                                    388 	.globl	C$main.c$137$1_0$176
                                    389 ;..\main.c:137: if (joypad_input & J_RIGHT) {
    000002BA FA B1 C0         [16]  390 	ld	a, (_joypad_input)
    000002BD 4F               [ 4]  391 	ld	c, a
    000002BE CB 41            [ 8]  392 	bit	0, c
    000002C0 28 08            [12]  393 	jr	Z, 00102$
                         000000C2   394 	C$main.c$138$3_0$178	= .
                                    395 	.globl	C$main.c$138$3_0$178
                                    396 ;..\main.c:138: cursorx = cursorx + SQUARE_SIZE;
    000002C2 FA D5 C0         [16]  397 	ld	a, (_cursorx)
    000002C5 C6 10            [ 8]  398 	add	a, #0x10
    000002C7 EA D5 C0         [16]  399 	ld	(#_cursorx),a
    000002CA                        400 00102$:
                         000000CA   401 	C$main.c$140$2_0$179	= .
                                    402 	.globl	C$main.c$140$2_0$179
                                    403 ;..\main.c:140: if (joypad_input & J_LEFT) {
    000002CA CB 49            [ 8]  404 	bit	1, c
    000002CC 28 08            [12]  405 	jr	Z, 00104$
                         000000CE   406 	C$main.c$141$3_0$180	= .
                                    407 	.globl	C$main.c$141$3_0$180
                                    408 ;..\main.c:141: cursorx = cursorx - SQUARE_SIZE;
    000002CE FA D5 C0         [16]  409 	ld	a, (_cursorx)
    000002D1 C6 F0            [ 8]  410 	add	a, #0xf0
    000002D3 EA D5 C0         [16]  411 	ld	(#_cursorx),a
    000002D6                        412 00104$:
                         000000D6   413 	C$main.c$143$2_0$181	= .
                                    414 	.globl	C$main.c$143$2_0$181
                                    415 ;..\main.c:143: if (joypad_input & J_UP) {
    000002D6 CB 51            [ 8]  416 	bit	2, c
    000002D8 28 08            [12]  417 	jr	Z, 00106$
                         000000DA   418 	C$main.c$144$3_0$182	= .
                                    419 	.globl	C$main.c$144$3_0$182
                                    420 ;..\main.c:144: cursory = cursory - SQUARE_SIZE;
    000002DA FA D6 C0         [16]  421 	ld	a, (_cursory)
    000002DD C6 F0            [ 8]  422 	add	a, #0xf0
    000002DF EA D6 C0         [16]  423 	ld	(#_cursory),a
    000002E2                        424 00106$:
                         000000E2   425 	C$main.c$146$2_0$183	= .
                                    426 	.globl	C$main.c$146$2_0$183
                                    427 ;..\main.c:146: if (joypad_input & J_DOWN) {
    000002E2 CB 59            [ 8]  428 	bit	3, c
    000002E4 CA 00 02         [16]  429 	jp	Z, _moveSquare
                         000000E7   430 	C$main.c$147$3_0$184	= .
                                    431 	.globl	C$main.c$147$3_0$184
                                    432 ;..\main.c:147: cursory = cursory + SQUARE_SIZE;
    000002E7 FA D6 C0         [16]  433 	ld	a, (_cursory)
    000002EA C6 10            [ 8]  434 	add	a, #0x10
    000002EC EA D6 C0         [16]  435 	ld	(#_cursory),a
                         000000EF   436 	C$main.c$149$1_0$176	= .
                                    437 	.globl	C$main.c$149$1_0$176
                                    438 ;..\main.c:149: moveSquare();
                         000000EF   439 	C$main.c$150$1_0$176	= .
                                    440 	.globl	C$main.c$150$1_0$176
                                    441 ;..\main.c:150: }
                         000000EF   442 	C$main.c$150$1_0$176	= .
                                    443 	.globl	C$main.c$150$1_0$176
                         000000EF   444 	XG$dpad$0$0	= .
                                    445 	.globl	XG$dpad$0$0
    000002EF C3 00 02         [16]  446 	jp	_moveSquare
                         000000F2   447 	G$font$0$0	= .
                                    448 	.globl	G$font$0$0
                         000000F2   449 	C$main.c$151$1_0$185	= .
                                    450 	.globl	C$main.c$151$1_0$185
                                    451 ;..\main.c:151: void font() {
                                    452 ;	---------------------------------
                                    453 ; Function font
                                    454 ; ---------------------------------
    000002F2                        455 _font::
                         000000F2   456 	C$main.c$153$1_0$185	= .
                                    457 	.globl	C$main.c$153$1_0$185
                                    458 ;..\main.c:153: font_init();
    000002F2 CD AD 11         [24]  459 	call	_font_init
                         000000F5   460 	C$main.c$154$1_0$185	= .
                                    461 	.globl	C$main.c$154$1_0$185
                                    462 ;..\main.c:154: min_font = font_load(font_ibm_fixed);
    000002F5 11 87 13         [12]  463 	ld	de, #_font_ibm_fixed
    000002F8 D5               [16]  464 	push	de
    000002F9 CD 90 11         [24]  465 	call	_font_load
    000002FC E1               [12]  466 	pop	hl
                         000000FD   467 	C$main.c$155$1_0$185	= .
                                    468 	.globl	C$main.c$155$1_0$185
                                    469 ;..\main.c:155: font_set(min_font);
    000002FD D5               [16]  470 	push	de
    000002FE CD 9E 11         [24]  471 	call	_font_set
    00000301 E1               [12]  472 	pop	hl
                         00000102   473 	C$main.c$156$1_0$185	= .
                                    474 	.globl	C$main.c$156$1_0$185
                                    475 ;..\main.c:156: }
                         00000102   476 	C$main.c$156$1_0$185	= .
                                    477 	.globl	C$main.c$156$1_0$185
                         00000102   478 	XG$font$0$0	= .
                                    479 	.globl	XG$font$0$0
    00000302 C9               [16]  480 	ret
                         00000103   481 	G$printbkg$0$0	= .
                                    482 	.globl	G$printbkg$0$0
                         00000103   483 	C$main.c$157$1_0$186	= .
                                    484 	.globl	C$main.c$157$1_0$186
                                    485 ;..\main.c:157: void printbkg() {
                                    486 ;	---------------------------------
                                    487 ; Function printbkg
                                    488 ; ---------------------------------
    00000303                        489 _printbkg::
                         00000103   490 	C$main.c$158$1_0$186	= .
                                    491 	.globl	C$main.c$158$1_0$186
                                    492 ;..\main.c:158: set_bkg_data(1, 1, tile1);
    00000303 11 DB C0         [12]  493 	ld	de, #_tile1
    00000306 D5               [16]  494 	push	de
    00000307 21 01 01         [12]  495 	ld	hl, #0x101
    0000030A E5               [16]  496 	push	hl
    0000030B CD 4F 13         [24]  497 	call	_set_bkg_data
    0000030E E8 04            [16]  498 	add	sp, #4
                         00000110   499 	C$main.c$159$1_0$186	= .
                                    500 	.globl	C$main.c$159$1_0$186
                                    501 ;..\main.c:159: set_bkg_data(2, 1, tile2);
    00000310 11 EB C0         [12]  502 	ld	de, #_tile2
    00000313 D5               [16]  503 	push	de
    00000314 21 02 01         [12]  504 	ld	hl, #0x102
    00000317 E5               [16]  505 	push	hl
    00000318 CD 4F 13         [24]  506 	call	_set_bkg_data
    0000031B E8 04            [16]  507 	add	sp, #4
                         0000011D   508 	C$main.c$160$1_0$186	= .
                                    509 	.globl	C$main.c$160$1_0$186
                                    510 ;..\main.c:160: set_bkg_data(3, 1, tile3);
    0000031D 11 FB C0         [12]  511 	ld	de, #_tile3
    00000320 D5               [16]  512 	push	de
    00000321 21 03 01         [12]  513 	ld	hl, #0x103
    00000324 E5               [16]  514 	push	hl
    00000325 CD 4F 13         [24]  515 	call	_set_bkg_data
    00000328 E8 04            [16]  516 	add	sp, #4
                         0000012A   517 	C$main.c$161$1_0$186	= .
                                    518 	.globl	C$main.c$161$1_0$186
                                    519 ;..\main.c:161: set_bkg_tiles(0, 0, 20, 18, map);
    0000032A 11 0B C1         [12]  520 	ld	de, #_map
    0000032D D5               [16]  521 	push	de
    0000032E 21 14 12         [12]  522 	ld	hl, #0x1214
    00000331 E5               [16]  523 	push	hl
    00000332 AF               [ 4]  524 	xor	a, a
    00000333 0F               [ 4]  525 	rrca
    00000334 F5               [16]  526 	push	af
    00000335 CD 0E 21         [24]  527 	call	_set_bkg_tiles
    00000338 E8 06            [16]  528 	add	sp, #6
                         0000013A   529 	C$main.c$162$1_0$186	= .
                                    530 	.globl	C$main.c$162$1_0$186
                                    531 ;..\main.c:162: }
                         0000013A   532 	C$main.c$162$1_0$186	= .
                                    533 	.globl	C$main.c$162$1_0$186
                         0000013A   534 	XG$printbkg$0$0	= .
                                    535 	.globl	XG$printbkg$0$0
    0000033A C9               [16]  536 	ret
                         0000013B   537 	G$printSquare$0$0	= .
                                    538 	.globl	G$printSquare$0$0
                         0000013B   539 	C$main.c$163$1_0$187	= .
                                    540 	.globl	C$main.c$163$1_0$187
                                    541 ;..\main.c:163: void printSquare() {
                                    542 ;	---------------------------------
                                    543 ; Function printSquare
                                    544 ; ---------------------------------
    0000033B                        545 _printSquare::
                         0000013B   546 	C$main.c$164$1_0$187	= .
                                    547 	.globl	C$main.c$164$1_0$187
                                    548 ;..\main.c:164: set_sprite_data(0, 1, squareTL);
    0000033B 11 73 C2         [12]  549 	ld	de, #_squareTL
    0000033E D5               [16]  550 	push	de
    0000033F AF               [ 4]  551 	xor	a, a
    00000340 3C               [ 4]  552 	inc	a
    00000341 F5               [16]  553 	push	af
    00000342 CD 57 13         [24]  554 	call	_set_sprite_data
    00000345 E8 04            [16]  555 	add	sp, #4
                         00000147   556 	C$main.c$165$1_0$187	= .
                                    557 	.globl	C$main.c$165$1_0$187
                                    558 ;..\main.c:165: set_sprite_data(1, 1, squareTR);
    00000347 11 83 C2         [12]  559 	ld	de, #_squareTR
    0000034A D5               [16]  560 	push	de
    0000034B 21 01 01         [12]  561 	ld	hl, #0x101
    0000034E E5               [16]  562 	push	hl
    0000034F CD 57 13         [24]  563 	call	_set_sprite_data
    00000352 E8 04            [16]  564 	add	sp, #4
                         00000154   565 	C$main.c$166$1_0$187	= .
                                    566 	.globl	C$main.c$166$1_0$187
                                    567 ;..\main.c:166: set_sprite_data(2, 1, squareBL);
    00000354 11 93 C2         [12]  568 	ld	de, #_squareBL
    00000357 D5               [16]  569 	push	de
    00000358 21 02 01         [12]  570 	ld	hl, #0x102
    0000035B E5               [16]  571 	push	hl
    0000035C CD 57 13         [24]  572 	call	_set_sprite_data
    0000035F E8 04            [16]  573 	add	sp, #4
                         00000161   574 	C$main.c$167$1_0$187	= .
                                    575 	.globl	C$main.c$167$1_0$187
                                    576 ;..\main.c:167: set_sprite_data(3, 1, squareBR);
    00000361 11 A3 C2         [12]  577 	ld	de, #_squareBR
    00000364 D5               [16]  578 	push	de
    00000365 21 03 01         [12]  579 	ld	hl, #0x103
    00000368 E5               [16]  580 	push	hl
    00000369 CD 57 13         [24]  581 	call	_set_sprite_data
    0000036C E8 04            [16]  582 	add	sp, #4
                                    583 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
    0000036E 21 02 C0         [12]  584 	ld	hl, #(_shadow_OAM + 2)
    00000371 36 00            [12]  585 	ld	(hl), #0x00
    00000373 21 06 C0         [12]  586 	ld	hl, #(_shadow_OAM + 6)
    00000376 36 01            [12]  587 	ld	(hl), #0x01
    00000378 21 0A C0         [12]  588 	ld	hl, #(_shadow_OAM + 10)
    0000037B 36 02            [12]  589 	ld	(hl), #0x02
    0000037D 21 0E C0         [12]  590 	ld	hl, #(_shadow_OAM + 14)
    00000380 36 03            [12]  591 	ld	(hl), #0x03
                         00000182   592 	C$main.c$172$1_0$187	= .
                                    593 	.globl	C$main.c$172$1_0$187
                                    594 ;..\main.c:172: moveSquare();
                         00000182   595 	C$main.c$173$1_0$187	= .
                                    596 	.globl	C$main.c$173$1_0$187
                                    597 ;..\main.c:173: }
                         00000182   598 	C$main.c$173$1_0$187	= .
                                    599 	.globl	C$main.c$173$1_0$187
                         00000182   600 	XG$printSquare$0$0	= .
                                    601 	.globl	XG$printSquare$0$0
    00000382 C3 00 02         [16]  602 	jp	_moveSquare
                         00000185   603 	G$printBlack$0$0	= .
                                    604 	.globl	G$printBlack$0$0
                         00000185   605 	C$main.c$174$1_0$200	= .
                                    606 	.globl	C$main.c$174$1_0$200
                                    607 ;..\main.c:174: void printBlack() {
                                    608 ;	---------------------------------
                                    609 ; Function printBlack
                                    610 ; ---------------------------------
    00000385                        611 _printBlack::
    00000385 E8 FA            [16]  612 	add	sp, #-6
                         00000187   613 	C$main.c$175$1_0$200	= .
                                    614 	.globl	C$main.c$175$1_0$200
                                    615 ;..\main.c:175: set_sprite_data(4, 12, black_piece);
    00000387 11 B3 C2         [12]  616 	ld	de, #_black_piece
    0000038A D5               [16]  617 	push	de
    0000038B 21 04 0C         [12]  618 	ld	hl, #0xc04
    0000038E E5               [16]  619 	push	hl
    0000038F CD 57 13         [24]  620 	call	_set_sprite_data
    00000392 E8 04            [16]  621 	add	sp, #4
                         00000194   622 	C$main.c$176$1_0$200	= .
                                    623 	.globl	C$main.c$176$1_0$200
                                    624 ;..\main.c:176: set_sprite_data(8, 12, blackKing);
    00000394 11 23 C3         [12]  625 	ld	de, #_blackKing
    00000397 D5               [16]  626 	push	de
    00000398 21 08 0C         [12]  627 	ld	hl, #0xc08
    0000039B E5               [16]  628 	push	hl
    0000039C CD 57 13         [24]  629 	call	_set_sprite_data
    0000039F E8 04            [16]  630 	add	sp, #4
                         000001A1   631 	C$main.c$178$4_0$203	= .
                                    632 	.globl	C$main.c$178$4_0$203
                                    633 ;..\main.c:178: for (int i = 0; i < 12; i++){
    000003A1 AF               [ 4]  634 	xor	a, a
    000003A2 F8 04            [12]  635 	ldhl	sp,	#4
    000003A4 22               [ 8]  636 	ld	(hl+), a
    000003A5 77               [ 8]  637 	ld	(hl), a
    000003A6                        638 00109$:
    000003A6 F8 04            [12]  639 	ldhl	sp,	#4
    000003A8 2A               [ 8]  640 	ld	a, (hl+)
    000003A9 D6 0C            [ 8]  641 	sub	a, #0x0c
    000003AB 7E               [ 8]  642 	ld	a, (hl)
    000003AC DE 00            [ 8]  643 	sbc	a, #0x00
    000003AE D2 5E 04         [16]  644 	jp	NC, 00111$
                         000001B1   645 	C$main.c$179$4_0$203	= .
                                    646 	.globl	C$main.c$179$4_0$203
                                    647 ;..\main.c:179: if (blackPieces[i].isKing) {
    000003B1 2B               [ 8]  648 	dec	hl
    000003B2 2A               [ 8]  649 	ld	a, (hl+)
    000003B3 4F               [ 4]  650 	ld	c, a
    000003B4 46               [ 8]  651 	ld	b, (hl)
    000003B5 69               [ 4]  652 	ld	l, c
    000003B6 60               [ 4]  653 	ld	h, b
    000003B7 29               [ 8]  654 	add	hl, hl
    000003B8 09               [ 8]  655 	add	hl, bc
    000003B9 11 43 C3         [12]  656 	ld	de, #_blackPieces
    000003BC 19               [ 8]  657 	add	hl, de
    000003BD 23               [ 8]  658 	inc	hl
    000003BE 23               [ 8]  659 	inc	hl
    000003BF 7E               [ 8]  660 	ld	a, (hl)
    000003C0 F8 02            [12]  661 	ldhl	sp,	#2
    000003C2 77               [ 8]  662 	ld	(hl), a
                         000001C3   663 	C$main.c$180$2_0$200	= .
                                    664 	.globl	C$main.c$180$2_0$200
                                    665 ;..\main.c:180: set_sprite_tile(i + 4, 8); // Use the black king sprite tile
    000003C3 F8 04            [12]  666 	ldhl	sp,	#4
    000003C5 3A               [ 8]  667 	ld	a, (hl-)
    000003C6 C6 04            [ 8]  668 	add	a, #0x04
                         000001C8   669 	C$main.c$179$4_0$203	= .
                                    670 	.globl	C$main.c$179$4_0$203
                                    671 ;..\main.c:179: if (blackPieces[i].isKing) {
    000003C8 32               [ 8]  672 	ld	(hl-), a
    000003C9 CB 46            [12]  673 	bit	0, (hl)
    000003CB 28 33            [12]  674 	jr	Z, 00102$
                                    675 ;..\main.c:180: set_sprite_tile(i + 4, 8); // Use the black king sprite tile
                                    676 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
    000003CD 23               [ 8]  677 	inc	hl
    000003CE 3A               [ 8]  678 	ld	a, (hl-)
    000003CF 22               [ 8]  679 	ld	(hl+), a
    000003D0 36 00            [12]  680 	ld	(hl), #0x00
    000003D2 3E 02            [ 8]  681 	ld	a, #0x02
    000003D4                        682 00135$:
    000003D4 F8 02            [12]  683 	ldhl	sp,	#2
    000003D6 CB 26            [16]  684 	sla	(hl)
    000003D8 23               [ 8]  685 	inc	hl
    000003D9 CB 16            [16]  686 	rl	(hl)
    000003DB 3D               [ 4]  687 	dec	a
    000003DC 20 F6            [12]  688 	jr	NZ, 00135$
    000003DE 2B               [ 8]  689 	dec	hl
    000003DF 2A               [ 8]  690 	ld	a, (hl+)
    000003E0 5F               [ 4]  691 	ld	e, a
    000003E1 56               [ 8]  692 	ld	d, (hl)
    000003E2 21 00 C0         [12]  693 	ld	hl, #_shadow_OAM
    000003E5 19               [ 8]  694 	add	hl, de
    000003E6 33               [ 8]  695 	inc	sp
    000003E7 33               [ 8]  696 	inc	sp
    000003E8 5D               [ 4]  697 	ld	e, l
    000003E9 54               [ 4]  698 	ld	d, h
    000003EA D5               [16]  699 	push	de
    000003EB 21 02 00         [12]  700 	ld	hl, #0x0002
    000003EE 19               [ 8]  701 	add	hl, de
    000003EF E5               [16]  702 	push	hl
    000003F0 7D               [ 4]  703 	ld	a, l
    000003F1 F8 04            [12]  704 	ldhl	sp,	#4
    000003F3 77               [ 8]  705 	ld	(hl), a
    000003F4 E1               [12]  706 	pop	hl
    000003F5 7C               [ 4]  707 	ld	a, h
    000003F6 F8 03            [12]  708 	ldhl	sp,	#3
    000003F8 32               [ 8]  709 	ld	(hl-), a
    000003F9 2A               [ 8]  710 	ld	a, (hl+)
    000003FA 66               [ 8]  711 	ld	h, (hl)
    000003FB 6F               [ 4]  712 	ld	l, a
    000003FC 36 08            [12]  713 	ld	(hl), #0x08
                         000001FE   714 	C$main.c$180$4_0$203	= .
                                    715 	.globl	C$main.c$180$4_0$203
                                    716 ;..\main.c:180: set_sprite_tile(i + 4, 8); // Use the black king sprite tile
    000003FE 18 32            [12]  717 	jr	00103$
    00000400                        718 00102$:
                                    719 ;..\main.c:182: set_sprite_tile(i + 4, 4); // Use the black regular piece sprite tile
                                    720 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
    00000400 F8 03            [12]  721 	ldhl	sp,	#3
    00000402 3A               [ 8]  722 	ld	a, (hl-)
    00000403 22               [ 8]  723 	ld	(hl+), a
    00000404 36 00            [12]  724 	ld	(hl), #0x00
    00000406 3E 02            [ 8]  725 	ld	a, #0x02
    00000408                        726 00136$:
    00000408 F8 02            [12]  727 	ldhl	sp,	#2
    0000040A CB 26            [16]  728 	sla	(hl)
    0000040C 23               [ 8]  729 	inc	hl
    0000040D CB 16            [16]  730 	rl	(hl)
    0000040F 3D               [ 4]  731 	dec	a
    00000410 20 F6            [12]  732 	jr	NZ, 00136$
    00000412 2B               [ 8]  733 	dec	hl
    00000413 2A               [ 8]  734 	ld	a, (hl+)
    00000414 5F               [ 4]  735 	ld	e, a
    00000415 56               [ 8]  736 	ld	d, (hl)
    00000416 21 00 C0         [12]  737 	ld	hl, #_shadow_OAM
    00000419 19               [ 8]  738 	add	hl, de
    0000041A 33               [ 8]  739 	inc	sp
    0000041B 33               [ 8]  740 	inc	sp
    0000041C 5D               [ 4]  741 	ld	e, l
    0000041D 54               [ 4]  742 	ld	d, h
    0000041E D5               [16]  743 	push	de
    0000041F 21 02 00         [12]  744 	ld	hl, #0x0002
    00000422 19               [ 8]  745 	add	hl, de
    00000423 E5               [16]  746 	push	hl
    00000424 7D               [ 4]  747 	ld	a, l
    00000425 F8 04            [12]  748 	ldhl	sp,	#4
    00000427 77               [ 8]  749 	ld	(hl), a
    00000428 E1               [12]  750 	pop	hl
    00000429 7C               [ 4]  751 	ld	a, h
    0000042A F8 03            [12]  752 	ldhl	sp,	#3
    0000042C 32               [ 8]  753 	ld	(hl-), a
    0000042D 2A               [ 8]  754 	ld	a, (hl+)
    0000042E 66               [ 8]  755 	ld	h, (hl)
    0000042F 6F               [ 4]  756 	ld	l, a
    00000430 36 04            [12]  757 	ld	(hl), #0x04
                         00000232   758 	C$main.c$182$4_0$203	= .
                                    759 	.globl	C$main.c$182$4_0$203
                                    760 ;..\main.c:182: set_sprite_tile(i + 4, 4); // Use the black regular piece sprite tile
    00000432                        761 00103$:
                                    762 ;..\main.c:184: move_sprite(i + 4, blackPieces[i].x, blackPieces[i].y);
    00000432 F8 04            [12]  763 	ldhl	sp,#4
    00000434 2A               [ 8]  764 	ld	a, (hl+)
    00000435 4F               [ 4]  765 	ld	c, a
    00000436 46               [ 8]  766 	ld	b, (hl)
    00000437 69               [ 4]  767 	ld	l, c
    00000438 60               [ 4]  768 	ld	h, b
    00000439 29               [ 8]  769 	add	hl, hl
    0000043A 09               [ 8]  770 	add	hl, bc
    0000043B 11 43 C3         [12]  771 	ld	de, #_blackPieces
    0000043E 19               [ 8]  772 	add	hl, de
    0000043F 4D               [ 4]  773 	ld	c, l
    00000440 44               [ 4]  774 	ld	b, h
    00000441 03               [ 8]  775 	inc	bc
    00000442 0A               [ 8]  776 	ld	a, (bc)
    00000443 5F               [ 4]  777 	ld	e, a
    00000444 4E               [ 8]  778 	ld	c, (hl)
    00000445 F8 04            [12]  779 	ldhl	sp,	#4
    00000447 7E               [ 8]  780 	ld	a, (hl)
    00000448 C6 04            [ 8]  781 	add	a, #0x04
                                    782 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
    0000044A 6F               [ 4]  783 	ld	l, a
    0000044B 26 00            [ 8]  784 	ld	h, #0x00
    0000044D 29               [ 8]  785 	add	hl, hl
    0000044E 29               [ 8]  786 	add	hl, hl
    0000044F D5               [16]  787 	push	de
    00000450 11 00 C0         [12]  788 	ld	de, #_shadow_OAM
    00000453 19               [ 8]  789 	add	hl, de
    00000454 D1               [12]  790 	pop	de
                                    791 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
    00000455 7B               [ 4]  792 	ld	a, e
    00000456 22               [ 8]  793 	ld	(hl+), a
    00000457 71               [ 8]  794 	ld	(hl), c
                         00000258   795 	C$main.c$178$2_0$201	= .
                                    796 	.globl	C$main.c$178$2_0$201
                                    797 ;..\main.c:178: for (int i = 0; i < 12; i++){
    00000458 F8 04            [12]  798 	ldhl	sp,	#4
    0000045A 34               [12]  799 	inc	(hl)
    0000045B C3 A6 03         [16]  800 	jp	00109$
    0000045E                        801 00111$:
                         0000025E   802 	C$main.c$186$2_0$200	= .
                                    803 	.globl	C$main.c$186$2_0$200
                                    804 ;..\main.c:186: }
    0000045E E8 06            [16]  805 	add	sp, #6
                         00000260   806 	C$main.c$186$2_0$200	= .
                                    807 	.globl	C$main.c$186$2_0$200
                         00000260   808 	XG$printBlack$0$0	= .
                                    809 	.globl	XG$printBlack$0$0
    00000460 C9               [16]  810 	ret
                         00000261   811 	G$printWhite$0$0	= .
                                    812 	.globl	G$printWhite$0$0
                         00000261   813 	C$main.c$187$2_0$215	= .
                                    814 	.globl	C$main.c$187$2_0$215
                                    815 ;..\main.c:187: void printWhite() {
                                    816 ;	---------------------------------
                                    817 ; Function printWhite
                                    818 ; ---------------------------------
    00000461                        819 _printWhite::
    00000461 E8 FA            [16]  820 	add	sp, #-6
                         00000263   821 	C$main.c$188$1_0$215	= .
                                    822 	.globl	C$main.c$188$1_0$215
                                    823 ;..\main.c:188: set_sprite_data(5, 12, white_piece);
    00000463 11 C3 C2         [12]  824 	ld	de, #_white_piece
    00000466 D5               [16]  825 	push	de
    00000467 21 05 0C         [12]  826 	ld	hl, #0xc05
    0000046A E5               [16]  827 	push	hl
    0000046B CD 57 13         [24]  828 	call	_set_sprite_data
    0000046E E8 04            [16]  829 	add	sp, #4
                         00000270   830 	C$main.c$189$1_0$215	= .
                                    831 	.globl	C$main.c$189$1_0$215
                                    832 ;..\main.c:189: set_sprite_data(20, 12, whiteKing);
    00000470 11 33 C3         [12]  833 	ld	de, #_whiteKing
    00000473 D5               [16]  834 	push	de
    00000474 21 14 0C         [12]  835 	ld	hl, #0xc14
    00000477 E5               [16]  836 	push	hl
    00000478 CD 57 13         [24]  837 	call	_set_sprite_data
    0000047B E8 04            [16]  838 	add	sp, #4
                         0000027D   839 	C$main.c$191$4_0$218	= .
                                    840 	.globl	C$main.c$191$4_0$218
                                    841 ;..\main.c:191: for (int i = 0; i < 12; i++){
    0000047D AF               [ 4]  842 	xor	a, a
    0000047E F8 04            [12]  843 	ldhl	sp,	#4
    00000480 22               [ 8]  844 	ld	(hl+), a
    00000481 77               [ 8]  845 	ld	(hl), a
    00000482                        846 00109$:
    00000482 F8 04            [12]  847 	ldhl	sp,	#4
    00000484 2A               [ 8]  848 	ld	a, (hl+)
    00000485 D6 0C            [ 8]  849 	sub	a, #0x0c
    00000487 7E               [ 8]  850 	ld	a, (hl)
    00000488 DE 00            [ 8]  851 	sbc	a, #0x00
    0000048A D2 3A 05         [16]  852 	jp	NC, 00111$
                         0000028D   853 	C$main.c$192$4_0$218	= .
                                    854 	.globl	C$main.c$192$4_0$218
                                    855 ;..\main.c:192: if (whitePieces[i].isKing) {
    0000048D 2B               [ 8]  856 	dec	hl
    0000048E 2A               [ 8]  857 	ld	a, (hl+)
    0000048F 4F               [ 4]  858 	ld	c, a
    00000490 46               [ 8]  859 	ld	b, (hl)
    00000491 69               [ 4]  860 	ld	l, c
    00000492 60               [ 4]  861 	ld	h, b
    00000493 29               [ 8]  862 	add	hl, hl
    00000494 09               [ 8]  863 	add	hl, bc
    00000495 11 67 C3         [12]  864 	ld	de, #_whitePieces
    00000498 19               [ 8]  865 	add	hl, de
    00000499 23               [ 8]  866 	inc	hl
    0000049A 23               [ 8]  867 	inc	hl
    0000049B 7E               [ 8]  868 	ld	a, (hl)
    0000049C F8 02            [12]  869 	ldhl	sp,	#2
    0000049E 77               [ 8]  870 	ld	(hl), a
                         0000029F   871 	C$main.c$193$2_0$215	= .
                                    872 	.globl	C$main.c$193$2_0$215
                                    873 ;..\main.c:193: set_sprite_tile(i + 16, 20); // Use the white king sprite tile
    0000049F F8 04            [12]  874 	ldhl	sp,	#4
    000004A1 3A               [ 8]  875 	ld	a, (hl-)
    000004A2 C6 10            [ 8]  876 	add	a, #0x10
                         000002A4   877 	C$main.c$192$4_0$218	= .
                                    878 	.globl	C$main.c$192$4_0$218
                                    879 ;..\main.c:192: if (whitePieces[i].isKing) {
    000004A4 32               [ 8]  880 	ld	(hl-), a
    000004A5 CB 46            [12]  881 	bit	0, (hl)
    000004A7 28 33            [12]  882 	jr	Z, 00102$
                                    883 ;..\main.c:193: set_sprite_tile(i + 16, 20); // Use the white king sprite tile
                                    884 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
    000004A9 23               [ 8]  885 	inc	hl
    000004AA 3A               [ 8]  886 	ld	a, (hl-)
    000004AB 22               [ 8]  887 	ld	(hl+), a
    000004AC 36 00            [12]  888 	ld	(hl), #0x00
    000004AE 3E 02            [ 8]  889 	ld	a, #0x02
    000004B0                        890 00135$:
    000004B0 F8 02            [12]  891 	ldhl	sp,	#2
    000004B2 CB 26            [16]  892 	sla	(hl)
    000004B4 23               [ 8]  893 	inc	hl
    000004B5 CB 16            [16]  894 	rl	(hl)
    000004B7 3D               [ 4]  895 	dec	a
    000004B8 20 F6            [12]  896 	jr	NZ, 00135$
    000004BA 2B               [ 8]  897 	dec	hl
    000004BB 2A               [ 8]  898 	ld	a, (hl+)
    000004BC 5F               [ 4]  899 	ld	e, a
    000004BD 56               [ 8]  900 	ld	d, (hl)
    000004BE 21 00 C0         [12]  901 	ld	hl, #_shadow_OAM
    000004C1 19               [ 8]  902 	add	hl, de
    000004C2 33               [ 8]  903 	inc	sp
    000004C3 33               [ 8]  904 	inc	sp
    000004C4 5D               [ 4]  905 	ld	e, l
    000004C5 54               [ 4]  906 	ld	d, h
    000004C6 D5               [16]  907 	push	de
    000004C7 21 02 00         [12]  908 	ld	hl, #0x0002
    000004CA 19               [ 8]  909 	add	hl, de
    000004CB E5               [16]  910 	push	hl
    000004CC 7D               [ 4]  911 	ld	a, l
    000004CD F8 04            [12]  912 	ldhl	sp,	#4
    000004CF 77               [ 8]  913 	ld	(hl), a
    000004D0 E1               [12]  914 	pop	hl
    000004D1 7C               [ 4]  915 	ld	a, h
    000004D2 F8 03            [12]  916 	ldhl	sp,	#3
    000004D4 32               [ 8]  917 	ld	(hl-), a
    000004D5 2A               [ 8]  918 	ld	a, (hl+)
    000004D6 66               [ 8]  919 	ld	h, (hl)
    000004D7 6F               [ 4]  920 	ld	l, a
    000004D8 36 14            [12]  921 	ld	(hl), #0x14
                         000002DA   922 	C$main.c$193$4_0$218	= .
                                    923 	.globl	C$main.c$193$4_0$218
                                    924 ;..\main.c:193: set_sprite_tile(i + 16, 20); // Use the white king sprite tile
    000004DA 18 32            [12]  925 	jr	00103$
    000004DC                        926 00102$:
                                    927 ;..\main.c:195: set_sprite_tile(i + 16, 5); // Use the white regular piece sprite tile
                                    928 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
    000004DC F8 03            [12]  929 	ldhl	sp,	#3
    000004DE 3A               [ 8]  930 	ld	a, (hl-)
    000004DF 22               [ 8]  931 	ld	(hl+), a
    000004E0 36 00            [12]  932 	ld	(hl), #0x00
    000004E2 3E 02            [ 8]  933 	ld	a, #0x02
    000004E4                        934 00136$:
    000004E4 F8 02            [12]  935 	ldhl	sp,	#2
    000004E6 CB 26            [16]  936 	sla	(hl)
    000004E8 23               [ 8]  937 	inc	hl
    000004E9 CB 16            [16]  938 	rl	(hl)
    000004EB 3D               [ 4]  939 	dec	a
    000004EC 20 F6            [12]  940 	jr	NZ, 00136$
    000004EE 2B               [ 8]  941 	dec	hl
    000004EF 2A               [ 8]  942 	ld	a, (hl+)
    000004F0 5F               [ 4]  943 	ld	e, a
    000004F1 56               [ 8]  944 	ld	d, (hl)
    000004F2 21 00 C0         [12]  945 	ld	hl, #_shadow_OAM
    000004F5 19               [ 8]  946 	add	hl, de
    000004F6 33               [ 8]  947 	inc	sp
    000004F7 33               [ 8]  948 	inc	sp
    000004F8 5D               [ 4]  949 	ld	e, l
    000004F9 54               [ 4]  950 	ld	d, h
    000004FA D5               [16]  951 	push	de
    000004FB 21 02 00         [12]  952 	ld	hl, #0x0002
    000004FE 19               [ 8]  953 	add	hl, de
    000004FF E5               [16]  954 	push	hl
    00000500 7D               [ 4]  955 	ld	a, l
    00000501 F8 04            [12]  956 	ldhl	sp,	#4
    00000503 77               [ 8]  957 	ld	(hl), a
    00000504 E1               [12]  958 	pop	hl
    00000505 7C               [ 4]  959 	ld	a, h
    00000506 F8 03            [12]  960 	ldhl	sp,	#3
    00000508 32               [ 8]  961 	ld	(hl-), a
    00000509 2A               [ 8]  962 	ld	a, (hl+)
    0000050A 66               [ 8]  963 	ld	h, (hl)
    0000050B 6F               [ 4]  964 	ld	l, a
    0000050C 36 05            [12]  965 	ld	(hl), #0x05
                         0000030E   966 	C$main.c$195$4_0$218	= .
                                    967 	.globl	C$main.c$195$4_0$218
                                    968 ;..\main.c:195: set_sprite_tile(i + 16, 5); // Use the white regular piece sprite tile
    0000050E                        969 00103$:
                                    970 ;..\main.c:197: move_sprite(i + 16, whitePieces[i].x, whitePieces[i].y);
    0000050E F8 04            [12]  971 	ldhl	sp,#4
    00000510 2A               [ 8]  972 	ld	a, (hl+)
    00000511 4F               [ 4]  973 	ld	c, a
    00000512 46               [ 8]  974 	ld	b, (hl)
    00000513 69               [ 4]  975 	ld	l, c
    00000514 60               [ 4]  976 	ld	h, b
    00000515 29               [ 8]  977 	add	hl, hl
    00000516 09               [ 8]  978 	add	hl, bc
    00000517 11 67 C3         [12]  979 	ld	de, #_whitePieces
    0000051A 19               [ 8]  980 	add	hl, de
    0000051B 4D               [ 4]  981 	ld	c, l
    0000051C 44               [ 4]  982 	ld	b, h
    0000051D 03               [ 8]  983 	inc	bc
    0000051E 0A               [ 8]  984 	ld	a, (bc)
    0000051F 5F               [ 4]  985 	ld	e, a
    00000520 4E               [ 8]  986 	ld	c, (hl)
    00000521 F8 04            [12]  987 	ldhl	sp,	#4
    00000523 7E               [ 8]  988 	ld	a, (hl)
    00000524 C6 10            [ 8]  989 	add	a, #0x10
                                    990 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
    00000526 6F               [ 4]  991 	ld	l, a
    00000527 26 00            [ 8]  992 	ld	h, #0x00
    00000529 29               [ 8]  993 	add	hl, hl
    0000052A 29               [ 8]  994 	add	hl, hl
    0000052B D5               [16]  995 	push	de
    0000052C 11 00 C0         [12]  996 	ld	de, #_shadow_OAM
    0000052F 19               [ 8]  997 	add	hl, de
    00000530 D1               [12]  998 	pop	de
                                    999 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
    00000531 7B               [ 4] 1000 	ld	a, e
    00000532 22               [ 8] 1001 	ld	(hl+), a
    00000533 71               [ 8] 1002 	ld	(hl), c
                         00000334  1003 	C$main.c$191$2_0$216	= .
                                   1004 	.globl	C$main.c$191$2_0$216
                                   1005 ;..\main.c:191: for (int i = 0; i < 12; i++){
    00000534 F8 04            [12] 1006 	ldhl	sp,	#4
    00000536 34               [12] 1007 	inc	(hl)
    00000537 C3 82 04         [16] 1008 	jp	00109$
    0000053A                       1009 00111$:
                         0000033A  1010 	C$main.c$199$2_0$215	= .
                                   1011 	.globl	C$main.c$199$2_0$215
                                   1012 ;..\main.c:199: }
    0000053A E8 06            [16] 1013 	add	sp, #6
                         0000033C  1014 	C$main.c$199$2_0$215	= .
                                   1015 	.globl	C$main.c$199$2_0$215
                         0000033C  1016 	XG$printWhite$0$0	= .
                                   1017 	.globl	XG$printWhite$0$0
    0000053C C9               [16] 1018 	ret
                         0000033D  1019 	G$isMoveWithinBoard$0$0	= .
                                   1020 	.globl	G$isMoveWithinBoard$0$0
                         0000033D  1021 	C$main.c$200$2_0$231	= .
                                   1022 	.globl	C$main.c$200$2_0$231
                                   1023 ;..\main.c:200: bool isMoveWithinBoard(UINT8 x, UINT8 y) {
                                   1024 ;	---------------------------------
                                   1025 ; Function isMoveWithinBoard
                                   1026 ; ---------------------------------
    0000053D                       1027 _isMoveWithinBoard::
                         0000033D  1028 	C$main.c$201$1_0$231	= .
                                   1029 	.globl	C$main.c$201$1_0$231
                                   1030 ;..\main.c:201: return (x >= 20 && x <=148 && y >= 20 && y <= 148);
    0000053D FE 14            [ 8] 1031 	cp	a, #0x14
    0000053F 38 0E            [12] 1032 	jr	C, 00103$
    00000541 FE 95            [ 8] 1033 	cp	a, #0x95
    00000543 30 0A            [12] 1034 	jr	NC, 00103$
    00000545 7B               [ 4] 1035 	ld	a, e
    00000546 D6 14            [ 8] 1036 	sub	a, #0x14
    00000548 38 05            [12] 1037 	jr	C, 00103$
    0000054A 3E 94            [ 8] 1038 	ld	a, #0x94
    0000054C 93               [ 4] 1039 	sub	a, e
    0000054D 30 02            [12] 1040 	jr	NC, 00104$
    0000054F                       1041 00103$:
    0000054F AF               [ 4] 1042 	xor	a, a
    00000550 C9               [16] 1043 	ret
    00000551                       1044 00104$:
    00000551 3E 01            [ 8] 1045 	ld	a, #0x01
                         00000353  1046 	C$main.c$202$1_0$231	= .
                                   1047 	.globl	C$main.c$202$1_0$231
                                   1048 ;..\main.c:202: }
                         00000353  1049 	C$main.c$202$1_0$231	= .
                                   1050 	.globl	C$main.c$202$1_0$231
                         00000353  1051 	XG$isMoveWithinBoard$0$0	= .
                                   1052 	.globl	XG$isMoveWithinBoard$0$0
    00000553 C9               [16] 1053 	ret
                         00000354  1054 	G$getCaptureIndex$0$0	= .
                                   1055 	.globl	G$getCaptureIndex$0$0
                         00000354  1056 	C$main.c$203$1_0$233	= .
                                   1057 	.globl	C$main.c$203$1_0$233
                                   1058 ;..\main.c:203: int getCaptureIndex(UINT8 capturedX, UINT8 capturedY, Piece* opponentPieces, int numOpponentPieces) {
                                   1059 ;	---------------------------------
                                   1060 ; Function getCaptureIndex
                                   1061 ; ---------------------------------
    00000554                       1062 _getCaptureIndex::
    00000554 E8 FA            [16] 1063 	add	sp, #-6
    00000556 F8 05            [12] 1064 	ldhl	sp,	#5
    00000558 32               [ 8] 1065 	ld	(hl-), a
    00000559 73               [ 8] 1066 	ld	(hl), e
                         0000035A  1067 	C$main.c$205$3_0$234	= .
                                   1068 	.globl	C$main.c$205$3_0$234
                                   1069 ;..\main.c:205: for (int i = 0; i < numOpponentPieces; i++) {
    0000055A AF               [ 4] 1070 	xor	a, a
    0000055B F8 00            [12] 1071 	ldhl	sp,	#0
    0000055D 22               [ 8] 1072 	ld	(hl+), a
    0000055E 77               [ 8] 1073 	ld	(hl), a
    0000055F 01 00 00         [12] 1074 	ld	bc, #0x0000
    00000562                       1075 00106$:
    00000562 F8 0A            [12] 1076 	ldhl	sp,	#10
    00000564 79               [ 4] 1077 	ld	a, c
    00000565 96               [ 8] 1078 	sub	a, (hl)
    00000566 23               [ 8] 1079 	inc	hl
    00000567 78               [ 4] 1080 	ld	a, b
    00000568 9E               [ 8] 1081 	sbc	a, (hl)
    00000569 78               [ 4] 1082 	ld	a, b
    0000056A 57               [ 4] 1083 	ld	d, a
    0000056B 5E               [ 8] 1084 	ld	e, (hl)
    0000056C CB 7B            [ 8] 1085 	bit	7, e
    0000056E 28 07            [12] 1086 	jr	Z, 00138$
    00000570 CB 7A            [ 8] 1087 	bit	7, d
    00000572 20 08            [12] 1088 	jr	NZ, 00139$
    00000574 BF               [ 4] 1089 	cp	a, a
    00000575 18 05            [12] 1090 	jr	00139$
    00000577                       1091 00138$:
    00000577 CB 7A            [ 8] 1092 	bit	7, d
    00000579 28 01            [12] 1093 	jr	Z, 00139$
    0000057B 37               [ 4] 1094 	scf
    0000057C                       1095 00139$:
    0000057C 30 33            [12] 1096 	jr	NC, 00104$
                         0000037E  1097 	C$main.c$206$3_0$235	= .
                                   1098 	.globl	C$main.c$206$3_0$235
                                   1099 ;..\main.c:206: UINT8 pieceX = opponentPieces[i].x;
    0000057E 69               [ 4] 1100 	ld	l, c
    0000057F 60               [ 4] 1101 	ld	h, b
    00000580 29               [ 8] 1102 	add	hl, hl
    00000581 09               [ 8] 1103 	add	hl, bc
    00000582 E5               [16] 1104 	push	hl
    00000583 7D               [ 4] 1105 	ld	a, l
    00000584 F8 04            [12] 1106 	ldhl	sp,	#4
    00000586 77               [ 8] 1107 	ld	(hl), a
    00000587 E1               [12] 1108 	pop	hl
    00000588 7C               [ 4] 1109 	ld	a, h
    00000589 F8 03            [12] 1110 	ldhl	sp,	#3
    0000058B 32               [ 8] 1111 	ld	(hl-), a
    0000058C 2A               [ 8] 1112 	ld	a, (hl+)
    0000058D 5F               [ 4] 1113 	ld	e, a
    0000058E 56               [ 8] 1114 	ld	d, (hl)
    0000058F F8 08            [12] 1115 	ldhl	sp,	#8
    00000591 2A               [ 8] 1116 	ld	a,	(hl+)
    00000592 66               [ 8] 1117 	ld	h, (hl)
    00000593 6F               [ 4] 1118 	ld	l, a
    00000594 19               [ 8] 1119 	add	hl, de
    00000595 5D               [ 4] 1120 	ld	e, l
    00000596 54               [ 4] 1121 	ld	d, h
    00000597 1A               [ 8] 1122 	ld	a, (de)
                         00000398  1123 	C$main.c$207$3_0$235	= .
                                   1124 	.globl	C$main.c$207$3_0$235
                                   1125 ;..\main.c:207: UINT8 pieceY = opponentPieces[i].y;
    00000598 6B               [ 4] 1126 	ld	l, e
    00000599 62               [ 4] 1127 	ld	h, d
    0000059A 23               [ 8] 1128 	inc	hl
    0000059B 5E               [ 8] 1129 	ld	e, (hl)
                         0000039C  1130 	C$main.c$208$4_0$236	= .
                                   1131 	.globl	C$main.c$208$4_0$236
                                   1132 ;..\main.c:208: if (capturedX == pieceX && capturedY == pieceY) {
    0000059C F8 05            [12] 1133 	ldhl	sp,	#5
    0000059E 96               [ 8] 1134 	sub	a, (hl)
    0000059F 20 0A            [12] 1135 	jr	NZ, 00107$
    000005A1 F8 04            [12] 1136 	ldhl	sp,	#4
    000005A3 7E               [ 8] 1137 	ld	a, (hl)
    000005A4 93               [ 4] 1138 	sub	a, e
    000005A5 20 04            [12] 1139 	jr	NZ, 00107$
                         000003A7  1140 	C$main.c$210$5_0$237	= .
                                   1141 	.globl	C$main.c$210$5_0$237
                                   1142 ;..\main.c:210: return i;
    000005A7 C1               [12] 1143 	pop	bc
    000005A8 C5               [16] 1144 	push	bc
    000005A9 18 09            [12] 1145 	jr	00108$
    000005AB                       1146 00107$:
                         000003AB  1147 	C$main.c$205$2_0$234	= .
                                   1148 	.globl	C$main.c$205$2_0$234
                                   1149 ;..\main.c:205: for (int i = 0; i < numOpponentPieces; i++) {
    000005AB 03               [ 8] 1150 	inc	bc
    000005AC 33               [ 8] 1151 	inc	sp
    000005AD 33               [ 8] 1152 	inc	sp
    000005AE C5               [16] 1153 	push	bc
    000005AF 18 B1            [12] 1154 	jr	00106$
    000005B1                       1155 00104$:
                         000003B1  1156 	C$main.c$214$1_0$233	= .
                                   1157 	.globl	C$main.c$214$1_0$233
                                   1158 ;..\main.c:214: return -1;
    000005B1 01 FF FF         [12] 1159 	ld	bc, #0xffff
    000005B4                       1160 00108$:
                         000003B4  1161 	C$main.c$215$1_0$233	= .
                                   1162 	.globl	C$main.c$215$1_0$233
                                   1163 ;..\main.c:215: }
    000005B4 E8 06            [16] 1164 	add	sp, #6
    000005B6 E1               [12] 1165 	pop	hl
    000005B7 E8 04            [16] 1166 	add	sp, #4
    000005B9 E9               [ 4] 1167 	jp	(hl)
                         000003BA  1168 	G$isValidMove$0$0	= .
                                   1169 	.globl	G$isValidMove$0$0
                         000003BA  1170 	C$main.c$217$1_0$239	= .
                                   1171 	.globl	C$main.c$217$1_0$239
                                   1172 ;..\main.c:217: bool isValidMove(UINT8 cursorx, UINT8 cursory, UINT8 currentPlayer, int selectedCoords) {
                                   1173 ;	---------------------------------
                                   1174 ; Function isValidMove
                                   1175 ; ---------------------------------
    000005BA                       1176 _isValidMove::
    000005BA E8 F6            [16] 1177 	add	sp, #-10
    000005BC F8 09            [12] 1178 	ldhl	sp,	#9
    000005BE 32               [ 8] 1179 	ld	(hl-), a
    000005BF 73               [ 8] 1180 	ld	(hl), e
                         000003C0  1181 	C$main.c$223$2_0$240	= .
                                   1182 	.globl	C$main.c$223$2_0$240
                                   1183 ;..\main.c:223: if (currentPlayer == BLACK_PLAYER) {
    000005C0 F8 0C            [12] 1184 	ldhl	sp,	#12
    000005C2 7E               [ 8] 1185 	ld	a, (hl)
    000005C3 B7               [ 4] 1186 	or	a, a
    000005C4 20 09            [12] 1187 	jr	NZ, 00102$
                         000003C6  1188 	C$main.c$224$3_0$241	= .
                                   1189 	.globl	C$main.c$224$3_0$241
                                   1190 ;..\main.c:224: pieces = blackPieces;
    000005C6 F8 04            [12] 1191 	ldhl	sp,	#4
    000005C8 36 43            [12] 1192 	ld	(hl), #<(_blackPieces)
    000005CA 23               [ 8] 1193 	inc	hl
    000005CB 36 C3            [12] 1194 	ld	(hl), #>(_blackPieces)
                         000003CD  1195 	C$main.c$227$2_0$240	= .
                                   1196 	.globl	C$main.c$227$2_0$240
                                   1197 ;..\main.c:227: numOpponentPieces = MAX_WHITE_PIECES;
    000005CD 18 07            [12] 1198 	jr	00103$
    000005CF                       1199 00102$:
                         000003CF  1200 	C$main.c$229$3_0$242	= .
                                   1201 	.globl	C$main.c$229$3_0$242
                                   1202 ;..\main.c:229: pieces = whitePieces;
    000005CF F8 04            [12] 1203 	ldhl	sp,	#4
    000005D1 3E 67            [ 8] 1204 	ld	a, #<(_whitePieces)
    000005D3 22               [ 8] 1205 	ld	(hl+), a
    000005D4 36 C3            [12] 1206 	ld	(hl), #>(_whitePieces)
                         000003D6  1207 	C$main.c$232$2_0$240	= .
                                   1208 	.globl	C$main.c$232$2_0$240
                                   1209 ;..\main.c:232: numOpponentPieces = MAX_BLACK_PIECES;
    000005D6                       1210 00103$:
                         000003D6  1211 	C$main.c$235$1_1$243	= .
                                   1212 	.globl	C$main.c$235$1_1$243
                                   1213 ;..\main.c:235: int dx = cursorx - pieces[selectedCoords].x;
    000005D6 F8 09            [12] 1214 	ldhl	sp,	#9
    000005D8 7E               [ 8] 1215 	ld	a, (hl)
    000005D9 F8 06            [12] 1216 	ldhl	sp,	#6
    000005DB 22               [ 8] 1217 	ld	(hl+), a
    000005DC 36 00            [12] 1218 	ld	(hl), #0x00
    000005DE F8 0D            [12] 1219 	ldhl	sp,#13
    000005E0 2A               [ 8] 1220 	ld	a, (hl+)
    000005E1 4F               [ 4] 1221 	ld	c, a
    000005E2 46               [ 8] 1222 	ld	b, (hl)
    000005E3 69               [ 4] 1223 	ld	l, c
    000005E4 60               [ 4] 1224 	ld	h, b
    000005E5 29               [ 8] 1225 	add	hl, hl
    000005E6 09               [ 8] 1226 	add	hl, bc
    000005E7 4D               [ 4] 1227 	ld	c, l
    000005E8 44               [ 4] 1228 	ld	b, h
    000005E9 F8 04            [12] 1229 	ldhl	sp,	#4
    000005EB 2A               [ 8] 1230 	ld	a,	(hl+)
    000005EC 66               [ 8] 1231 	ld	h, (hl)
    000005ED 6F               [ 4] 1232 	ld	l, a
    000005EE 09               [ 8] 1233 	add	hl, bc
    000005EF 33               [ 8] 1234 	inc	sp
    000005F0 33               [ 8] 1235 	inc	sp
    000005F1 5D               [ 4] 1236 	ld	e, l
    000005F2 54               [ 4] 1237 	ld	d, h
    000005F3 D5               [16] 1238 	push	de
    000005F4 1A               [ 8] 1239 	ld	a, (de)
    000005F5 4F               [ 4] 1240 	ld	c, a
    000005F6 06 00            [ 8] 1241 	ld	b, #0x00
    000005F8 F8 06            [12] 1242 	ldhl	sp,#6
    000005FA 2A               [ 8] 1243 	ld	a, (hl+)
    000005FB 5F               [ 4] 1244 	ld	e, a
    000005FC 56               [ 8] 1245 	ld	d, (hl)
    000005FD 7B               [ 4] 1246 	ld	a, e
    000005FE 91               [ 4] 1247 	sub	a, c
    000005FF 5F               [ 4] 1248 	ld	e, a
    00000600 7A               [ 4] 1249 	ld	a, d
    00000601 98               [ 4] 1250 	sbc	a, b
    00000602 F8 03            [12] 1251 	ldhl	sp,	#3
    00000604 32               [ 8] 1252 	ld	(hl-), a
    00000605 73               [ 8] 1253 	ld	(hl), e
                         00000406  1254 	C$main.c$236$1_1$243	= .
                                   1255 	.globl	C$main.c$236$1_1$243
                                   1256 ;..\main.c:236: int dy = cursory - pieces[selectedCoords].y;
    00000606 F8 08            [12] 1257 	ldhl	sp,	#8
    00000608 4E               [ 8] 1258 	ld	c, (hl)
    00000609 06 00            [ 8] 1259 	ld	b, #0x00
    0000060B D1               [12] 1260 	pop	de
    0000060C D5               [16] 1261 	push	de
    0000060D 13               [ 8] 1262 	inc	de
    0000060E 1A               [ 8] 1263 	ld	a, (de)
    0000060F F8 04            [12] 1264 	ldhl	sp,	#4
    00000611 22               [ 8] 1265 	ld	(hl+), a
    00000612 AF               [ 4] 1266 	xor	a, a
    00000613 32               [ 8] 1267 	ld	(hl-), a
    00000614 2A               [ 8] 1268 	ld	a, (hl+)
    00000615 5F               [ 4] 1269 	ld	e, a
    00000616 2A               [ 8] 1270 	ld	a, (hl+)
    00000617 23               [ 8] 1271 	inc	hl
    00000618 57               [ 4] 1272 	ld	d, a
    00000619 79               [ 4] 1273 	ld	a, c
    0000061A 93               [ 4] 1274 	sub	a, e
    0000061B 5F               [ 4] 1275 	ld	e, a
    0000061C 78               [ 4] 1276 	ld	a, b
    0000061D 9A               [ 4] 1277 	sbc	a, d
    0000061E 32               [ 8] 1278 	ld	(hl-), a
                         0000041F  1279 	C$main.c$238$2_1$244	= .
                                   1280 	.globl	C$main.c$238$2_1$244
                                   1281 ;..\main.c:238: if (!(isMoveWithinBoard(cursorx, cursory))) {
    0000061F 7B               [ 4] 1282 	ld	a, e
    00000620 22               [ 8] 1283 	ld	(hl+), a
    00000621 23               [ 8] 1284 	inc	hl
    00000622 2A               [ 8] 1285 	ld	a, (hl+)
    00000623 5F               [ 4] 1286 	ld	e, a
    00000624 7E               [ 8] 1287 	ld	a, (hl)
    00000625 CD 3D 05         [24] 1288 	call	_isMoveWithinBoard
    00000628 4F               [ 4] 1289 	ld	c, a
    00000629 CB 41            [ 8] 1290 	bit	0, c
    0000062B 20 04            [12] 1291 	jr	NZ, 00105$
                         0000042D  1292 	C$main.c$239$3_1$245	= .
                                   1293 	.globl	C$main.c$239$3_1$245
                                   1294 ;..\main.c:239: return false;
    0000062D AF               [ 4] 1295 	xor	a, a
    0000062E C3 58 07         [16] 1296 	jp	00131$
    00000631                       1297 00105$:
                         00000431  1298 	C$main.c$242$2_1$246	= .
                                   1299 	.globl	C$main.c$242$2_1$246
                                   1300 ;..\main.c:242: if (selectedCoords < 0 || selectedCoords >= numPieces) {
    00000631 F8 0E            [12] 1301 	ldhl	sp,	#14
    00000633 CB 7E            [12] 1302 	bit	7, (hl)
    00000635 20 1D            [12] 1303 	jr	NZ, 00106$
    00000637 2B               [ 8] 1304 	dec	hl
    00000638 2A               [ 8] 1305 	ld	a, (hl+)
    00000639 D6 0C            [ 8] 1306 	sub	a, #0x0c
    0000063B 7E               [ 8] 1307 	ld	a, (hl)
    0000063C DE 00            [ 8] 1308 	sbc	a, #0x00
    0000063E 56               [ 8] 1309 	ld	d, (hl)
    0000063F 3E 00            [ 8] 1310 	ld	a, #0x00
    00000641 5F               [ 4] 1311 	ld	e, a
    00000642 CB 7B            [ 8] 1312 	bit	7, e
    00000644 28 07            [12] 1313 	jr	Z, 00238$
    00000646 CB 7A            [ 8] 1314 	bit	7, d
    00000648 20 08            [12] 1315 	jr	NZ, 00239$
    0000064A BF               [ 4] 1316 	cp	a, a
    0000064B 18 05            [12] 1317 	jr	00239$
    0000064D                       1318 00238$:
    0000064D CB 7A            [ 8] 1319 	bit	7, d
    0000064F 28 01            [12] 1320 	jr	Z, 00239$
    00000651 37               [ 4] 1321 	scf
    00000652                       1322 00239$:
    00000652 38 04            [12] 1323 	jr	C, 00107$
    00000654                       1324 00106$:
                         00000454  1325 	C$main.c$243$3_1$247	= .
                                   1326 	.globl	C$main.c$243$3_1$247
                                   1327 ;..\main.c:243: return false;
    00000654 AF               [ 4] 1328 	xor	a, a
    00000655 C3 58 07         [16] 1329 	jp	00131$
    00000658                       1330 00107$:
                         00000458  1331 	C$main.c$246$2_1$248	= .
                                   1332 	.globl	C$main.c$246$2_1$248
                                   1333 ;..\main.c:246: if (abs(dx) != abs(dy)) {
    00000658 F8 02            [12] 1334 	ldhl	sp,	#2
    0000065A 2A               [ 8] 1335 	ld	a, (hl+)
    0000065B 5F               [ 4] 1336 	ld	e, a
    0000065C 56               [ 8] 1337 	ld	d, (hl)
    0000065D CD 29 13         [24] 1338 	call	_abs
    00000660 C5               [16] 1339 	push	bc
    00000661 F8 08            [12] 1340 	ldhl	sp,	#8
    00000663 2A               [ 8] 1341 	ld	a, (hl+)
    00000664 5F               [ 4] 1342 	ld	e, a
    00000665 56               [ 8] 1343 	ld	d, (hl)
    00000666 CD 29 13         [24] 1344 	call	_abs
    00000669 59               [ 4] 1345 	ld	e, c
    0000066A 50               [ 4] 1346 	ld	d, b
    0000066B C1               [12] 1347 	pop	bc
    0000066C 7B               [ 4] 1348 	ld	a, e
    0000066D 91               [ 4] 1349 	sub	a, c
    0000066E 20 04            [12] 1350 	jr	NZ, 00240$
    00000670 7A               [ 4] 1351 	ld	a, d
    00000671 90               [ 4] 1352 	sub	a, b
    00000672 28 04            [12] 1353 	jr	Z, 00110$
    00000674                       1354 00240$:
                         00000474  1355 	C$main.c$247$3_1$249	= .
                                   1356 	.globl	C$main.c$247$3_1$249
                                   1357 ;..\main.c:247: return false;
    00000674 AF               [ 4] 1358 	xor	a, a
    00000675 C3 58 07         [16] 1359 	jp	00131$
    00000678                       1360 00110$:
                         00000478  1361 	C$main.c$250$1_1$239	= .
                                   1362 	.globl	C$main.c$250$1_1$239
                                   1363 ;..\main.c:250: if ((currentPlayer == BLACK_PLAYER && dy < 0 && !pieces[selectedCoords].isKing) ||
    00000678 C1               [12] 1364 	pop	bc
    00000679 C5               [16] 1365 	push	bc
    0000067A 03               [ 8] 1366 	inc	bc
    0000067B 03               [ 8] 1367 	inc	bc
    0000067C F8 0C            [12] 1368 	ldhl	sp,	#12
    0000067E 7E               [ 8] 1369 	ld	a, (hl)
    0000067F B7               [ 4] 1370 	or	a, a
    00000680 20 0C            [12] 1371 	jr	NZ, 00117$
    00000682 F8 07            [12] 1372 	ldhl	sp,	#7
    00000684 CB 7E            [12] 1373 	bit	7, (hl)
    00000686 28 06            [12] 1374 	jr	Z, 00117$
    00000688 0A               [ 8] 1375 	ld	a, (bc)
    00000689 5F               [ 4] 1376 	ld	e, a
    0000068A CB 43            [ 8] 1377 	bit	0, e
    0000068C 28 2A            [12] 1378 	jr	Z, 00111$
    0000068E                       1379 00117$:
                         0000048E  1380 	C$main.c$251$2_1$250	= .
                                   1381 	.globl	C$main.c$251$2_1$250
                                   1382 ;..\main.c:251: (currentPlayer == WHITE_PLAYER && dy > 0 && !pieces[selectedCoords].isKing)) {
    0000068E F8 0C            [12] 1383 	ldhl	sp,	#12
    00000690 7E               [ 8] 1384 	ld	a, (hl)
    00000691 3D               [ 4] 1385 	dec	a
    00000692 20 28            [12] 1386 	jr	NZ, 00146$
    00000694 F8 06            [12] 1387 	ldhl	sp,	#6
    00000696 AF               [ 4] 1388 	xor	a, a
    00000697 96               [ 8] 1389 	sub	a, (hl)
    00000698 23               [ 8] 1390 	inc	hl
    00000699 3E 00            [ 8] 1391 	ld	a, #0x00
    0000069B 9E               [ 8] 1392 	sbc	a, (hl)
    0000069C 3E 00            [ 8] 1393 	ld	a, #0x00
    0000069E 57               [ 4] 1394 	ld	d, a
    0000069F 5E               [ 8] 1395 	ld	e, (hl)
    000006A0 CB 7B            [ 8] 1396 	bit	7, e
    000006A2 28 07            [12] 1397 	jr	Z, 00243$
    000006A4 CB 7A            [ 8] 1398 	bit	7, d
    000006A6 20 08            [12] 1399 	jr	NZ, 00244$
    000006A8 BF               [ 4] 1400 	cp	a, a
    000006A9 18 05            [12] 1401 	jr	00244$
    000006AB                       1402 00243$:
    000006AB CB 7A            [ 8] 1403 	bit	7, d
    000006AD 28 01            [12] 1404 	jr	Z, 00244$
    000006AF 37               [ 4] 1405 	scf
    000006B0                       1406 00244$:
    000006B0 30 0A            [12] 1407 	jr	NC, 00146$
    000006B2 0A               [ 8] 1408 	ld	a, (bc)
    000006B3 4F               [ 4] 1409 	ld	c, a
    000006B4 CB 41            [ 8] 1410 	bit	0, c
    000006B6 20 04            [12] 1411 	jr	NZ, 00146$
    000006B8                       1412 00111$:
                         000004B8  1413 	C$main.c$252$3_1$251	= .
                                   1414 	.globl	C$main.c$252$3_1$251
                                   1415 ;..\main.c:252: return false;
    000006B8 AF               [ 4] 1416 	xor	a, a
    000006B9 C3 58 07         [16] 1417 	jp	00131$
                         000004BC  1418 	C$main.c$255$1_1$239	= .
                                   1419 	.globl	C$main.c$255$1_1$239
                                   1420 ;..\main.c:255: for (int i = 0; i < numPieces; i++) {
    000006BC                       1421 00146$:
    000006BC 01 00 00         [12] 1422 	ld	bc, #0x0000
    000006BF                       1423 00129$:
    000006BF 79               [ 4] 1424 	ld	a, c
    000006C0 D6 0C            [ 8] 1425 	sub	a, #0x0c
    000006C2 30 49            [12] 1426 	jr	NC, 00124$
                         000004C4  1427 	C$main.c$256$1_1$239	= .
                                   1428 	.globl	C$main.c$256$1_1$239
                                   1429 ;..\main.c:256: if (whitePieces[i].x == cursorx && whitePieces[i].y == cursory) {
    000006C4 69               [ 4] 1430 	ld	l, c
    000006C5 60               [ 4] 1431 	ld	h, b
    000006C6 29               [ 8] 1432 	add	hl, hl
    000006C7 09               [ 8] 1433 	add	hl, bc
    000006C8 E5               [16] 1434 	push	hl
    000006C9 7D               [ 4] 1435 	ld	a, l
    000006CA F8 06            [12] 1436 	ldhl	sp,	#6
    000006CC 77               [ 8] 1437 	ld	(hl), a
    000006CD E1               [12] 1438 	pop	hl
    000006CE 7C               [ 4] 1439 	ld	a, h
    000006CF F8 05            [12] 1440 	ldhl	sp,	#5
    000006D1 77               [ 8] 1441 	ld	(hl), a
    000006D2 11 67 C3         [12] 1442 	ld	de, #_whitePieces
    000006D5 3A               [ 8] 1443 	ld	a, (hl-)
    000006D6 6E               [ 8] 1444 	ld	l, (hl)
    000006D7 67               [ 4] 1445 	ld	h, a
    000006D8 19               [ 8] 1446 	add	hl, de
    000006D9 5D               [ 4] 1447 	ld	e, l
    000006DA 54               [ 4] 1448 	ld	d, h
    000006DB 1A               [ 8] 1449 	ld	a, (de)
    000006DC F8 09            [12] 1450 	ldhl	sp,	#9
    000006DE 96               [ 8] 1451 	sub	a, (hl)
    000006DF 20 0C            [12] 1452 	jr	NZ, 00119$
    000006E1 13               [ 8] 1453 	inc	de
    000006E2 1A               [ 8] 1454 	ld	a, (de)
    000006E3 5F               [ 4] 1455 	ld	e, a
    000006E4 F8 08            [12] 1456 	ldhl	sp,	#8
    000006E6 7E               [ 8] 1457 	ld	a, (hl)
    000006E7 93               [ 4] 1458 	sub	a, e
    000006E8 20 03            [12] 1459 	jr	NZ, 00119$
                         000004EA  1460 	C$main.c$257$5_1$255	= .
                                   1461 	.globl	C$main.c$257$5_1$255
                                   1462 ;..\main.c:257: return false;
    000006EA AF               [ 4] 1463 	xor	a, a
    000006EB 18 6B            [12] 1464 	jr	00131$
    000006ED                       1465 00119$:
                         000004ED  1466 	C$main.c$259$4_1$256	= .
                                   1467 	.globl	C$main.c$259$4_1$256
                                   1468 ;..\main.c:259: if (blackPieces[i].x == cursorx && blackPieces[i].y == cursory) {
    000006ED 11 43 C3         [12] 1469 	ld	de, #_blackPieces
    000006F0 F8 04            [12] 1470 	ldhl	sp,	#4
    000006F2 2A               [ 8] 1471 	ld	a,	(hl+)
    000006F3 66               [ 8] 1472 	ld	h, (hl)
    000006F4 6F               [ 4] 1473 	ld	l, a
    000006F5 19               [ 8] 1474 	add	hl, de
    000006F6 5D               [ 4] 1475 	ld	e, l
    000006F7 54               [ 4] 1476 	ld	d, h
    000006F8 1A               [ 8] 1477 	ld	a, (de)
    000006F9 F8 09            [12] 1478 	ldhl	sp,	#9
    000006FB 96               [ 8] 1479 	sub	a, (hl)
    000006FC 20 0C            [12] 1480 	jr	NZ, 00130$
    000006FE 13               [ 8] 1481 	inc	de
    000006FF 1A               [ 8] 1482 	ld	a, (de)
    00000700 5F               [ 4] 1483 	ld	e, a
    00000701 F8 08            [12] 1484 	ldhl	sp,	#8
    00000703 7E               [ 8] 1485 	ld	a, (hl)
    00000704 93               [ 4] 1486 	sub	a, e
    00000705 20 03            [12] 1487 	jr	NZ, 00130$
                         00000507  1488 	C$main.c$260$5_1$257	= .
                                   1489 	.globl	C$main.c$260$5_1$257
                                   1490 ;..\main.c:260: return false;
    00000707 AF               [ 4] 1491 	xor	a, a
    00000708 18 4E            [12] 1492 	jr	00131$
    0000070A                       1493 00130$:
                         0000050A  1494 	C$main.c$255$2_1$252	= .
                                   1495 	.globl	C$main.c$255$2_1$252
                                   1496 ;..\main.c:255: for (int i = 0; i < numPieces; i++) {
    0000070A 03               [ 8] 1497 	inc	bc
    0000070B 18 B2            [12] 1498 	jr	00129$
    0000070D                       1499 00124$:
                         0000050D  1500 	C$main.c$263$2_1$258	= .
                                   1501 	.globl	C$main.c$263$2_1$258
                                   1502 ;..\main.c:263: if (abs(dx) > 2 * SQUARE_SIZE || abs(dy) > 2 * SQUARE_SIZE) {
    0000070D F8 02            [12] 1503 	ldhl	sp,	#2
    0000070F 2A               [ 8] 1504 	ld	a, (hl+)
    00000710 5F               [ 4] 1505 	ld	e, a
    00000711 56               [ 8] 1506 	ld	d, (hl)
    00000712 CD 29 13         [24] 1507 	call	_abs
    00000715 58               [ 4] 1508 	ld	e, b
    00000716 16 00            [ 8] 1509 	ld	d, #0x00
    00000718 3E 20            [ 8] 1510 	ld	a, #0x20
    0000071A B9               [ 4] 1511 	cp	a, c
    0000071B 3E 00            [ 8] 1512 	ld	a, #0x00
    0000071D 98               [ 4] 1513 	sbc	a, b
    0000071E CB 7B            [ 8] 1514 	bit	7, e
    00000720 28 07            [12] 1515 	jr	Z, 00253$
    00000722 CB 7A            [ 8] 1516 	bit	7, d
    00000724 20 08            [12] 1517 	jr	NZ, 00254$
    00000726 BF               [ 4] 1518 	cp	a, a
    00000727 18 05            [12] 1519 	jr	00254$
    00000729                       1520 00253$:
    00000729 CB 7A            [ 8] 1521 	bit	7, d
    0000072B 28 01            [12] 1522 	jr	Z, 00254$
    0000072D 37               [ 4] 1523 	scf
    0000072E                       1524 00254$:
    0000072E 38 23            [12] 1525 	jr	C, 00125$
    00000730 F8 06            [12] 1526 	ldhl	sp,	#6
    00000732 2A               [ 8] 1527 	ld	a, (hl+)
    00000733 5F               [ 4] 1528 	ld	e, a
    00000734 56               [ 8] 1529 	ld	d, (hl)
    00000735 CD 29 13         [24] 1530 	call	_abs
    00000738 58               [ 4] 1531 	ld	e, b
    00000739 16 00            [ 8] 1532 	ld	d, #0x00
    0000073B 3E 20            [ 8] 1533 	ld	a, #0x20
    0000073D B9               [ 4] 1534 	cp	a, c
    0000073E 3E 00            [ 8] 1535 	ld	a, #0x00
    00000740 98               [ 4] 1536 	sbc	a, b
    00000741 CB 7B            [ 8] 1537 	bit	7, e
    00000743 28 07            [12] 1538 	jr	Z, 00255$
    00000745 CB 7A            [ 8] 1539 	bit	7, d
    00000747 20 08            [12] 1540 	jr	NZ, 00256$
    00000749 BF               [ 4] 1541 	cp	a, a
    0000074A 18 05            [12] 1542 	jr	00256$
    0000074C                       1543 00255$:
    0000074C CB 7A            [ 8] 1544 	bit	7, d
    0000074E 28 01            [12] 1545 	jr	Z, 00256$
    00000750 37               [ 4] 1546 	scf
    00000751                       1547 00256$:
    00000751 30 03            [12] 1548 	jr	NC, 00126$
    00000753                       1549 00125$:
                         00000553  1550 	C$main.c$264$3_1$259	= .
                                   1551 	.globl	C$main.c$264$3_1$259
                                   1552 ;..\main.c:264: return false;
    00000753 AF               [ 4] 1553 	xor	a, a
    00000754 18 02            [12] 1554 	jr	00131$
    00000756                       1555 00126$:
                         00000556  1556 	C$main.c$267$1_1$243	= .
                                   1557 	.globl	C$main.c$267$1_1$243
                                   1558 ;..\main.c:267: return true;
    00000756 3E 01            [ 8] 1559 	ld	a, #0x01
    00000758                       1560 00131$:
                         00000558  1561 	C$main.c$268$1_1$239	= .
                                   1562 	.globl	C$main.c$268$1_1$239
                                   1563 ;..\main.c:268: }
    00000758 E8 0A            [16] 1564 	add	sp, #10
    0000075A E1               [12] 1565 	pop	hl
    0000075B E8 03            [16] 1566 	add	sp, #3
    0000075D E9               [ 4] 1567 	jp	(hl)
                         0000055E  1568 	G$checkCollision$0$0	= .
                                   1569 	.globl	G$checkCollision$0$0
                         0000055E  1570 	C$main.c$270$1_1$261	= .
                                   1571 	.globl	C$main.c$270$1_1$261
                                   1572 ;..\main.c:270: bool checkCollision(UINT8 cursorx, UINT8 cursory, int currentPlayer) {
                                   1573 ;	---------------------------------
                                   1574 ; Function checkCollision
                                   1575 ; ---------------------------------
    0000075E                       1576 _checkCollision::
    0000075E E8 F8            [16] 1577 	add	sp, #-8
    00000760 F8 07            [12] 1578 	ldhl	sp,	#7
    00000762 32               [ 8] 1579 	ld	(hl-), a
    00000763 73               [ 8] 1580 	ld	(hl), e
                         00000564  1581 	C$main.c$274$2_0$262	= .
                                   1582 	.globl	C$main.c$274$2_0$262
                                   1583 ;..\main.c:274: if (currentPlayer == BLACK_PLAYER) {
    00000764 F8 0B            [12] 1584 	ldhl	sp,	#11
    00000766 3A               [ 8] 1585 	ld	a, (hl-)
    00000767 B6               [ 8] 1586 	or	a, (hl)
    00000768 20 09            [12] 1587 	jr	NZ, 00102$
                         0000056A  1588 	C$main.c$275$3_0$263	= .
                                   1589 	.globl	C$main.c$275$3_0$263
                                   1590 ;..\main.c:275: pieces = blackPieces;
    0000076A F8 00            [12] 1591 	ldhl	sp,	#0
    0000076C 36 43            [12] 1592 	ld	(hl), #<(_blackPieces)
    0000076E 23               [ 8] 1593 	inc	hl
    0000076F 36 C3            [12] 1594 	ld	(hl), #>(_blackPieces)
                         00000571  1595 	C$main.c$276$2_0$262	= .
                                   1596 	.globl	C$main.c$276$2_0$262
                                   1597 ;..\main.c:276: numPieces = 12;
    00000771 18 07            [12] 1598 	jr	00103$
    00000773                       1599 00102$:
                         00000573  1600 	C$main.c$278$3_0$264	= .
                                   1601 	.globl	C$main.c$278$3_0$264
                                   1602 ;..\main.c:278: pieces = whitePieces;
    00000773 F8 00            [12] 1603 	ldhl	sp,	#0
    00000775 3E 67            [ 8] 1604 	ld	a, #<(_whitePieces)
    00000777 22               [ 8] 1605 	ld	(hl+), a
    00000778 36 C3            [12] 1606 	ld	(hl), #>(_whitePieces)
                         0000057A  1607 	C$main.c$279$2_0$262	= .
                                   1608 	.globl	C$main.c$279$2_0$262
                                   1609 ;..\main.c:279: numPieces = 12;
    0000077A                       1610 00103$:
                         0000057A  1611 	C$main.c$282$3_0$265	= .
                                   1612 	.globl	C$main.c$282$3_0$265
                                   1613 ;..\main.c:282: for (int i = 0; i < numPieces; i++) {
    0000077A AF               [ 4] 1614 	xor	a, a
    0000077B F8 02            [12] 1615 	ldhl	sp,	#2
    0000077D 22               [ 8] 1616 	ld	(hl+), a
    0000077E 77               [ 8] 1617 	ld	(hl), a
    0000077F 01 00 00         [12] 1618 	ld	bc, #0x0000
    00000782                       1619 00112$:
    00000782 79               [ 4] 1620 	ld	a, c
    00000783 D6 0C            [ 8] 1621 	sub	a, #0x0c
    00000785 30 6E            [12] 1622 	jr	NC, 00110$
                         00000587  1623 	C$main.c$283$3_0$266	= .
                                   1624 	.globl	C$main.c$283$3_0$266
                                   1625 ;..\main.c:283: UINT8 pieceX = pieces[i].x;
    00000787 69               [ 4] 1626 	ld	l, c
    00000788 60               [ 4] 1627 	ld	h, b
    00000789 29               [ 8] 1628 	add	hl, hl
    0000078A 09               [ 8] 1629 	add	hl, bc
    0000078B E5               [16] 1630 	push	hl
    0000078C 7D               [ 4] 1631 	ld	a, l
    0000078D F8 06            [12] 1632 	ldhl	sp,	#6
    0000078F 77               [ 8] 1633 	ld	(hl), a
    00000790 E1               [12] 1634 	pop	hl
    00000791 7C               [ 4] 1635 	ld	a, h
    00000792 F8 05            [12] 1636 	ldhl	sp,	#5
    00000794 32               [ 8] 1637 	ld	(hl-), a
    00000795 2A               [ 8] 1638 	ld	a, (hl+)
    00000796 5F               [ 4] 1639 	ld	e, a
    00000797 56               [ 8] 1640 	ld	d, (hl)
    00000798 E1               [12] 1641 	pop	hl
    00000799 E5               [16] 1642 	push	hl
    0000079A 19               [ 8] 1643 	add	hl, de
    0000079B 5D               [ 4] 1644 	ld	e, l
    0000079C 54               [ 4] 1645 	ld	d, h
    0000079D 1A               [ 8] 1646 	ld	a, (de)
                         0000059E  1647 	C$main.c$284$3_0$266	= .
                                   1648 	.globl	C$main.c$284$3_0$266
                                   1649 ;..\main.c:284: UINT8 pieceY = pieces[i].y;
    0000079E 6B               [ 4] 1650 	ld	l, e
    0000079F 62               [ 4] 1651 	ld	h, d
    000007A0 23               [ 8] 1652 	inc	hl
    000007A1 5E               [ 8] 1653 	ld	e, (hl)
                         000005A2  1654 	C$main.c$286$4_0$267	= .
                                   1655 	.globl	C$main.c$286$4_0$267
                                   1656 ;..\main.c:286: if (cursorx == (pieceX) &&
    000007A2 F8 07            [12] 1657 	ldhl	sp,	#7
    000007A4 96               [ 8] 1658 	sub	a, (hl)
    000007A5 20 46            [12] 1659 	jr	NZ, 00113$
                         000005A7  1660 	C$main.c$287$4_0$267	= .
                                   1661 	.globl	C$main.c$287$4_0$267
                                   1662 ;..\main.c:287: cursory == (pieceY)) {
    000007A7 F8 06            [12] 1663 	ldhl	sp,	#6
    000007A9 7E               [ 8] 1664 	ld	a, (hl)
    000007AA 93               [ 4] 1665 	sub	a, e
    000007AB 20 40            [12] 1666 	jr	NZ, 00113$
                         000005AD  1667 	C$main.c$288$6_0$269	= .
                                   1668 	.globl	C$main.c$288$6_0$269
                                   1669 ;..\main.c:288: if (currentPlayer == BLACK_PLAYER) {
    000007AD F8 0B            [12] 1670 	ldhl	sp,	#11
    000007AF 3A               [ 8] 1671 	ld	a, (hl-)
    000007B0 B6               [ 8] 1672 	or	a, (hl)
    000007B1 20 1C            [12] 1673 	jr	NZ, 00105$
                         000005B3  1674 	C$main.c$289$7_0$270	= .
                                   1675 	.globl	C$main.c$289$7_0$270
                                   1676 ;..\main.c:289: selectedCoords = i;
    000007B3 F8 02            [12] 1677 	ldhl	sp,	#2
    000007B5 7E               [ 8] 1678 	ld	a, (hl)
    000007B6 21 D8 C0         [12] 1679 	ld	hl, #_selectedCoords
    000007B9 22               [ 8] 1680 	ld	(hl+), a
    000007BA AF               [ 4] 1681 	xor	a, a
    000007BB 77               [ 8] 1682 	ld	(hl), a
                         000005BC  1683 	C$main.c$290$7_0$270	= .
                                   1684 	.globl	C$main.c$290$7_0$270
                                   1685 ;..\main.c:290: selectedPieceIndex = i + 4;
    000007BC F8 02            [12] 1686 	ldhl	sp,#2
    000007BE 2A               [ 8] 1687 	ld	a, (hl+)
    000007BF 5F               [ 4] 1688 	ld	e, a
    000007C0 56               [ 8] 1689 	ld	d, (hl)
    000007C1 21 04 00         [12] 1690 	ld	hl, #0x0004
    000007C4 19               [ 8] 1691 	add	hl, de
    000007C5 5D               [ 4] 1692 	ld	e, l
    000007C6 54               [ 4] 1693 	ld	d, h
    000007C7 21 D3 C0         [12] 1694 	ld	hl, #_selectedPieceIndex
    000007CA 7B               [ 4] 1695 	ld	a, e
    000007CB 22               [ 8] 1696 	ld	(hl+), a
    000007CC 72               [ 8] 1697 	ld	(hl), d
    000007CD 18 1A            [12] 1698 	jr	00106$
    000007CF                       1699 00105$:
                         000005CF  1700 	C$main.c$292$7_0$271	= .
                                   1701 	.globl	C$main.c$292$7_0$271
                                   1702 ;..\main.c:292: selectedCoords = i;
    000007CF F8 02            [12] 1703 	ldhl	sp,	#2
    000007D1 7E               [ 8] 1704 	ld	a, (hl)
    000007D2 21 D8 C0         [12] 1705 	ld	hl, #_selectedCoords
    000007D5 22               [ 8] 1706 	ld	(hl+), a
    000007D6 AF               [ 4] 1707 	xor	a, a
    000007D7 77               [ 8] 1708 	ld	(hl), a
                         000005D8  1709 	C$main.c$293$7_0$271	= .
                                   1710 	.globl	C$main.c$293$7_0$271
                                   1711 ;..\main.c:293: selectedPieceIndex = i + 16;
    000007D8 F8 02            [12] 1712 	ldhl	sp,#2
    000007DA 2A               [ 8] 1713 	ld	a, (hl+)
    000007DB 5F               [ 4] 1714 	ld	e, a
    000007DC 56               [ 8] 1715 	ld	d, (hl)
    000007DD 21 10 00         [12] 1716 	ld	hl, #0x0010
    000007E0 19               [ 8] 1717 	add	hl, de
    000007E1 5D               [ 4] 1718 	ld	e, l
    000007E2 54               [ 4] 1719 	ld	d, h
    000007E3 21 D3 C0         [12] 1720 	ld	hl, #_selectedPieceIndex
    000007E6 7B               [ 4] 1721 	ld	a, e
    000007E7 22               [ 8] 1722 	ld	(hl+), a
    000007E8 72               [ 8] 1723 	ld	(hl), d
    000007E9                       1724 00106$:
                         000005E9  1725 	C$main.c$295$5_0$268	= .
                                   1726 	.globl	C$main.c$295$5_0$268
                                   1727 ;..\main.c:295: return true;
    000007E9 3E 01            [ 8] 1728 	ld	a, #0x01
    000007EB 18 11            [12] 1729 	jr	00114$
    000007ED                       1730 00113$:
                         000005ED  1731 	C$main.c$282$2_0$265	= .
                                   1732 	.globl	C$main.c$282$2_0$265
                                   1733 ;..\main.c:282: for (int i = 0; i < numPieces; i++) {
    000007ED 03               [ 8] 1734 	inc	bc
    000007EE F8 02            [12] 1735 	ldhl	sp,	#2
    000007F0 79               [ 4] 1736 	ld	a, c
    000007F1 22               [ 8] 1737 	ld	(hl+), a
    000007F2 70               [ 8] 1738 	ld	(hl), b
    000007F3 18 8D            [12] 1739 	jr	00112$
    000007F5                       1740 00110$:
                         000005F5  1741 	C$main.c$299$1_0$261	= .
                                   1742 	.globl	C$main.c$299$1_0$261
                                   1743 ;..\main.c:299: selectedPieceIndex = -1;
    000007F5 21 D3 C0         [12] 1744 	ld	hl, #_selectedPieceIndex
    000007F8 3E FF            [ 8] 1745 	ld	a, #0xff
    000007FA 22               [ 8] 1746 	ld	(hl+), a
    000007FB 36 FF            [12] 1747 	ld	(hl), #0xff
                         000005FD  1748 	C$main.c$300$1_0$261	= .
                                   1749 	.globl	C$main.c$300$1_0$261
                                   1750 ;..\main.c:300: return false;
    000007FD AF               [ 4] 1751 	xor	a, a
    000007FE                       1752 00114$:
                         000005FE  1753 	C$main.c$301$1_0$261	= .
                                   1754 	.globl	C$main.c$301$1_0$261
                                   1755 ;..\main.c:301: }
    000007FE E8 08            [16] 1756 	add	sp, #8
    00000800 E1               [12] 1757 	pop	hl
    00000801 C1               [12] 1758 	pop	bc
    00000802 E9               [ 4] 1759 	jp	(hl)
                         00000603  1760 	G$hasValidCaptureMoves$0$0	= .
                                   1761 	.globl	G$hasValidCaptureMoves$0$0
                         00000603  1762 	C$main.c$302$1_0$273	= .
                                   1763 	.globl	C$main.c$302$1_0$273
                                   1764 ;..\main.c:302: bool hasValidCaptureMoves(UINT8 currentPlayer) {
                                   1765 ;	---------------------------------
                                   1766 ; Function hasValidCaptureMoves
                                   1767 ; ---------------------------------
    00000803                       1768 _hasValidCaptureMoves::
    00000803 E8 EC            [16] 1769 	add	sp, #-20
    00000805 F8 11            [12] 1770 	ldhl	sp,	#17
                         00000607  1771 	C$main.c$303$1_0$273	= .
                                   1772 	.globl	C$main.c$303$1_0$273
                                   1773 ;..\main.c:303: Piece* pieces = (currentPlayer == BLACK_PLAYER) ? blackPieces : whitePieces;
    00000807 77               [ 8] 1774 	ld	(hl), a
    00000808 B7               [ 4] 1775 	or	a, a
    00000809 20 05            [12] 1776 	jr	NZ, 00116$
    0000080B 01 43 C3         [12] 1777 	ld	bc, #_blackPieces+0
    0000080E 18 03            [12] 1778 	jr	00117$
    00000810                       1779 00116$:
    00000810 01 67 C3         [12] 1780 	ld	bc, #_whitePieces+0
    00000813                       1781 00117$:
    00000813 33               [ 8] 1782 	inc	sp
    00000814 33               [ 8] 1783 	inc	sp
    00000815 C5               [16] 1784 	push	bc
                         00000616  1785 	C$main.c$304$1_0$273	= .
                                   1786 	.globl	C$main.c$304$1_0$273
                                   1787 ;..\main.c:304: Piece* opponentPieces = (currentPlayer == BLACK_PLAYER) ? whitePieces : blackPieces;
    00000816 F8 11            [12] 1788 	ldhl	sp,	#17
    00000818 7E               [ 8] 1789 	ld	a, (hl)
    00000819 B7               [ 4] 1790 	or	a, a
    0000081A 20 05            [12] 1791 	jr	NZ, 00118$
    0000081C 01 67 C3         [12] 1792 	ld	bc, #_whitePieces+0
    0000081F 18 03            [12] 1793 	jr	00119$
    00000821                       1794 00118$:
    00000821 01 43 C3         [12] 1795 	ld	bc, #_blackPieces+0
    00000824                       1796 00119$:
    00000824 F8 02            [12] 1797 	ldhl	sp,	#2
    00000826 79               [ 4] 1798 	ld	a, c
    00000827 22               [ 8] 1799 	ld	(hl+), a
    00000828 70               [ 8] 1800 	ld	(hl), b
                         00000629  1801 	C$main.c$307$1_0$273	= .
                                   1802 	.globl	C$main.c$307$1_0$273
                                   1803 ;..\main.c:307: for (int i = 0; i < numPieces; i++) {
    00000829 AF               [ 4] 1804 	xor	a, a
    0000082A F8 12            [12] 1805 	ldhl	sp,	#18
    0000082C 22               [ 8] 1806 	ld	(hl+), a
    0000082D 77               [ 8] 1807 	ld	(hl), a
    0000082E                       1808 00112$:
    0000082E F8 12            [12] 1809 	ldhl	sp,	#18
    00000830 2A               [ 8] 1810 	ld	a, (hl+)
    00000831 D6 0C            [ 8] 1811 	sub	a, #0x0c
    00000833 7E               [ 8] 1812 	ld	a, (hl)
    00000834 DE 00            [ 8] 1813 	sbc	a, #0x00
    00000836 D2 76 0A         [16] 1814 	jp	NC, 00110$
                         00000639  1815 	C$main.c$308$1_0$273	= .
                                   1816 	.globl	C$main.c$308$1_0$273
                                   1817 ;..\main.c:308: if (isValidMove(pieces[i].x - 2 * SQUARE_SIZE, pieces[i].y + 2 * SQUARE_SIZE, currentPlayer, i) && (getCaptureIndex((((pieces[i].x - 2 * SQUARE_SIZE) + (pieces[i].x)) / 2), (((pieces[i].y + 2 * SQUARE_SIZE) + (pieces[i].y)) / 2), opponentPieces, numOpponentPieces) != -1) ||
    00000839 2B               [ 8] 1818 	dec	hl
    0000083A 2A               [ 8] 1819 	ld	a, (hl+)
    0000083B 4F               [ 4] 1820 	ld	c, a
    0000083C 46               [ 8] 1821 	ld	b, (hl)
    0000083D 69               [ 4] 1822 	ld	l, c
    0000083E 60               [ 4] 1823 	ld	h, b
    0000083F 29               [ 8] 1824 	add	hl, hl
    00000840 09               [ 8] 1825 	add	hl, bc
    00000841 E5               [16] 1826 	push	hl
    00000842 7D               [ 4] 1827 	ld	a, l
    00000843 F8 11            [12] 1828 	ldhl	sp,	#17
    00000845 77               [ 8] 1829 	ld	(hl), a
    00000846 E1               [12] 1830 	pop	hl
    00000847 7C               [ 4] 1831 	ld	a, h
    00000848 F8 10            [12] 1832 	ldhl	sp,	#16
    0000084A 32               [ 8] 1833 	ld	(hl-), a
    0000084B 2A               [ 8] 1834 	ld	a, (hl+)
    0000084C 5F               [ 4] 1835 	ld	e, a
    0000084D 56               [ 8] 1836 	ld	d, (hl)
    0000084E E1               [12] 1837 	pop	hl
    0000084F E5               [16] 1838 	push	hl
    00000850 19               [ 8] 1839 	add	hl, de
    00000851 4D               [ 4] 1840 	ld	c,l
    00000852 44               [ 4] 1841 	ld	b,h
    00000853 23               [ 8] 1842 	inc	hl
    00000854 E5               [16] 1843 	push	hl
    00000855 7D               [ 4] 1844 	ld	a, l
    00000856 F8 06            [12] 1845 	ldhl	sp,	#6
    00000858 77               [ 8] 1846 	ld	(hl), a
    00000859 E1               [12] 1847 	pop	hl
    0000085A 7C               [ 4] 1848 	ld	a, h
    0000085B F8 05            [12] 1849 	ldhl	sp,	#5
    0000085D 32               [ 8] 1850 	ld	(hl-), a
    0000085E 2A               [ 8] 1851 	ld	a, (hl+)
    0000085F 5F               [ 4] 1852 	ld	e, a
    00000860 56               [ 8] 1853 	ld	d, (hl)
    00000861 1A               [ 8] 1854 	ld	a, (de)
    00000862 C6 20            [ 8] 1855 	add	a, #0x20
    00000864 F8 0E            [12] 1856 	ldhl	sp,	#14
    00000866 77               [ 8] 1857 	ld	(hl), a
    00000867 F8 06            [12] 1858 	ldhl	sp,	#6
    00000869 79               [ 4] 1859 	ld	a, c
    0000086A 22               [ 8] 1860 	ld	(hl+), a
    0000086B 78               [ 4] 1861 	ld	a, b
    0000086C 32               [ 8] 1862 	ld	(hl-), a
    0000086D 2A               [ 8] 1863 	ld	a, (hl+)
    0000086E 5F               [ 4] 1864 	ld	e, a
    0000086F 56               [ 8] 1865 	ld	d, (hl)
    00000870 1A               [ 8] 1866 	ld	a, (de)
    00000871 C6 E0            [ 8] 1867 	add	a, #0xe0
    00000873 F8 12            [12] 1868 	ldhl	sp,	#18
    00000875 5E               [ 8] 1869 	ld	e, (hl)
    00000876 2B               [ 8] 1870 	dec	hl
    00000877 16 00            [ 8] 1871 	ld	d, #0x00
    00000879 D5               [16] 1872 	push	de
    0000087A 66               [ 8] 1873 	ld	h, (hl)
    0000087B E5               [16] 1874 	push	hl
    0000087C 33               [ 8] 1875 	inc	sp
    0000087D F8 11            [12] 1876 	ldhl	sp,	#17
    0000087F 5E               [ 8] 1877 	ld	e, (hl)
    00000880 CD BA 05         [24] 1878 	call	_isValidMove
    00000883 4F               [ 4] 1879 	ld	c, a
    00000884 F8 0F            [12] 1880 	ldhl	sp,#15
    00000886 2A               [ 8] 1881 	ld	a, (hl+)
    00000887 5F               [ 4] 1882 	ld	e, a
    00000888 56               [ 8] 1883 	ld	d, (hl)
    00000889 E1               [12] 1884 	pop	hl
    0000088A E5               [16] 1885 	push	hl
    0000088B 19               [ 8] 1886 	add	hl, de
    0000088C E5               [16] 1887 	push	hl
    0000088D 7D               [ 4] 1888 	ld	a, l
    0000088E F8 0A            [12] 1889 	ldhl	sp,	#10
    00000890 77               [ 8] 1890 	ld	(hl), a
    00000891 E1               [12] 1891 	pop	hl
    00000892 7C               [ 4] 1892 	ld	a, h
    00000893 F8 09            [12] 1893 	ldhl	sp,	#9
    00000895 77               [ 8] 1894 	ld	(hl), a
    00000896 CB 41            [ 8] 1895 	bit	0, c
    00000898 28 4D            [12] 1896 	jr	Z, 00105$
    0000089A F8 04            [12] 1897 	ldhl	sp,#4
    0000089C 2A               [ 8] 1898 	ld	a, (hl+)
    0000089D 5F               [ 4] 1899 	ld	e, a
    0000089E 56               [ 8] 1900 	ld	d, (hl)
    0000089F 1A               [ 8] 1901 	ld	a, (de)
    000008A0 4F               [ 4] 1902 	ld	c, a
    000008A1 06 00            [ 8] 1903 	ld	b, #0x00
    000008A3 21 20 00         [12] 1904 	ld	hl, #0x0020
    000008A6 09               [ 8] 1905 	add	hl, bc
    000008A7 09               [ 8] 1906 	add	hl, bc
    000008A8 4D               [ 4] 1907 	ld	c, l
    000008A9 44               [ 4] 1908 	ld	b, h
    000008AA CB 28            [ 8] 1909 	sra	b
    000008AC CB 19            [ 8] 1910 	rr	c
    000008AE F8 10            [12] 1911 	ldhl	sp,	#16
    000008B0 71               [ 8] 1912 	ld	(hl), c
    000008B1 F8 08            [12] 1913 	ldhl	sp,	#8
    000008B3 2A               [ 8] 1914 	ld	a, (hl+)
    000008B4 4F               [ 4] 1915 	ld	c, a
    000008B5 46               [ 8] 1916 	ld	b, (hl)
    000008B6 0A               [ 8] 1917 	ld	a, (bc)
    000008B7 4F               [ 4] 1918 	ld	c, a
    000008B8 06 00            [ 8] 1919 	ld	b, #0x00
    000008BA 79               [ 4] 1920 	ld	a, c
    000008BB C6 E0            [ 8] 1921 	add	a, #0xe0
    000008BD 6F               [ 4] 1922 	ld	l, a
    000008BE 78               [ 4] 1923 	ld	a, b
    000008BF CE FF            [ 8] 1924 	adc	a, #0xff
    000008C1 67               [ 4] 1925 	ld	h, a
    000008C2 09               [ 8] 1926 	add	hl, bc
    000008C3 4D               [ 4] 1927 	ld	c,l
    000008C4 44               [ 4] 1928 	ld	b,h
    000008C5 CB 78            [ 8] 1929 	bit	7, b
    000008C7 28 03            [12] 1930 	jr	Z, 00121$
    000008C9 69               [ 4] 1931 	ld	l, c
    000008CA 60               [ 4] 1932 	ld	h, b
    000008CB 23               [ 8] 1933 	inc	hl
    000008CC                       1934 00121$:
    000008CC CB 2C            [ 8] 1935 	sra	h
    000008CE CB 1D            [ 8] 1936 	rr	l
    000008D0 7D               [ 4] 1937 	ld	a, l
    000008D1 11 0C 00         [12] 1938 	ld	de, #0x000c
    000008D4 D5               [16] 1939 	push	de
    000008D5 F8 04            [12] 1940 	ldhl	sp,	#4
    000008D7 5E               [ 8] 1941 	ld	e, (hl)
    000008D8 23               [ 8] 1942 	inc	hl
    000008D9 56               [ 8] 1943 	ld	d, (hl)
    000008DA D5               [16] 1944 	push	de
    000008DB F8 14            [12] 1945 	ldhl	sp,	#20
    000008DD 5E               [ 8] 1946 	ld	e, (hl)
    000008DE CD 54 05         [24] 1947 	call	_getCaptureIndex
    000008E1 79               [ 4] 1948 	ld	a, c
    000008E2 A0               [ 4] 1949 	and	a, b
    000008E3 3C               [ 4] 1950 	inc	a
    000008E4 C2 6C 0A         [16] 1951 	jp	NZ, 00101$
    000008E7                       1952 00105$:
                         000006E7  1953 	C$main.c$309$4_0$276	= .
                                   1954 	.globl	C$main.c$309$4_0$276
                                   1955 ;..\main.c:309: isValidMove(pieces[i].x + 2 * SQUARE_SIZE, pieces[i].y + 2 * SQUARE_SIZE, currentPlayer, i) && (getCaptureIndex((((pieces[i].x + 2 * SQUARE_SIZE) + (pieces[i].x)) / 2), (((pieces[i].y + 2 * SQUARE_SIZE) + (pieces[i].y)) / 2), opponentPieces, numOpponentPieces) != -1) ||
    000008E7 F8 04            [12] 1956 	ldhl	sp,#4
    000008E9 2A               [ 8] 1957 	ld	a, (hl+)
    000008EA 5F               [ 4] 1958 	ld	e, a
    000008EB 2A               [ 8] 1959 	ld	a, (hl+)
    000008EC 57               [ 4] 1960 	ld	d, a
    000008ED 1A               [ 8] 1961 	ld	a, (de)
    000008EE C6 20            [ 8] 1962 	add	a, #0x20
    000008F0 4F               [ 4] 1963 	ld	c, a
    000008F1 2A               [ 8] 1964 	ld	a, (hl+)
    000008F2 5F               [ 4] 1965 	ld	e, a
    000008F3 56               [ 8] 1966 	ld	d, (hl)
    000008F4 1A               [ 8] 1967 	ld	a, (de)
    000008F5 C6 20            [ 8] 1968 	add	a, #0x20
    000008F7 F8 12            [12] 1969 	ldhl	sp,	#18
    000008F9 5E               [ 8] 1970 	ld	e, (hl)
    000008FA 2B               [ 8] 1971 	dec	hl
    000008FB 16 00            [ 8] 1972 	ld	d, #0x00
    000008FD D5               [16] 1973 	push	de
    000008FE 66               [ 8] 1974 	ld	h, (hl)
    000008FF E5               [16] 1975 	push	hl
    00000900 33               [ 8] 1976 	inc	sp
    00000901 59               [ 4] 1977 	ld	e, c
    00000902 CD BA 05         [24] 1978 	call	_isValidMove
    00000905 CB 47            [ 8] 1979 	bit	0,a
    00000907 28 39            [12] 1980 	jr	Z, 00107$
    00000909 F8 04            [12] 1981 	ldhl	sp,#4
    0000090B 2A               [ 8] 1982 	ld	a, (hl+)
    0000090C 5F               [ 4] 1983 	ld	e, a
    0000090D 56               [ 8] 1984 	ld	d, (hl)
    0000090E 1A               [ 8] 1985 	ld	a, (de)
    0000090F 4F               [ 4] 1986 	ld	c, a
    00000910 06 00            [ 8] 1987 	ld	b, #0x00
    00000912 21 20 00         [12] 1988 	ld	hl, #0x0020
    00000915 09               [ 8] 1989 	add	hl, bc
    00000916 09               [ 8] 1990 	add	hl, bc
    00000917 5D               [ 4] 1991 	ld	e, l
    00000918 CB 2C            [ 8] 1992 	sra	h
    0000091A CB 1B            [ 8] 1993 	rr	e
    0000091C F8 08            [12] 1994 	ldhl	sp,	#8
    0000091E 2A               [ 8] 1995 	ld	a, (hl+)
    0000091F 4F               [ 4] 1996 	ld	c, a
    00000920 46               [ 8] 1997 	ld	b, (hl)
    00000921 0A               [ 8] 1998 	ld	a, (bc)
    00000922 4F               [ 4] 1999 	ld	c, a
    00000923 06 00            [ 8] 2000 	ld	b, #0x00
    00000925 21 20 00         [12] 2001 	ld	hl, #0x0020
    00000928 09               [ 8] 2002 	add	hl, bc
    00000929 09               [ 8] 2003 	add	hl, bc
    0000092A CB 2C            [ 8] 2004 	sra	h
    0000092C CB 1D            [ 8] 2005 	rr	l
    0000092E 7D               [ 4] 2006 	ld	a, l
    0000092F 01 0C 00         [12] 2007 	ld	bc, #0x000c
    00000932 C5               [16] 2008 	push	bc
    00000933 F8 04            [12] 2009 	ldhl	sp,	#4
    00000935 4E               [ 8] 2010 	ld	c, (hl)
    00000936 23               [ 8] 2011 	inc	hl
    00000937 46               [ 8] 2012 	ld	b, (hl)
    00000938 C5               [16] 2013 	push	bc
    00000939 CD 54 05         [24] 2014 	call	_getCaptureIndex
    0000093C 79               [ 4] 2015 	ld	a, c
    0000093D A0               [ 4] 2016 	and	a, b
    0000093E 3C               [ 4] 2017 	inc	a
    0000093F C2 6C 0A         [16] 2018 	jp	NZ, 00101$
    00000942                       2019 00107$:
                         00000742  2020 	C$main.c$310$4_0$276	= .
                                   2021 	.globl	C$main.c$310$4_0$276
                                   2022 ;..\main.c:310: isValidMove(pieces[i].x - 2 * SQUARE_SIZE, pieces[i].y - 2 * SQUARE_SIZE, currentPlayer, i) && (getCaptureIndex((((pieces[i].x - 2 * SQUARE_SIZE) + (pieces[i].x)) / 2), (((pieces[i].y - 2 * SQUARE_SIZE) + (pieces[i].y)) / 2), opponentPieces, numOpponentPieces) != -1) ||
    00000942 F8 04            [12] 2023 	ldhl	sp,#4
    00000944 2A               [ 8] 2024 	ld	a, (hl+)
    00000945 5F               [ 4] 2025 	ld	e, a
    00000946 2A               [ 8] 2026 	ld	a, (hl+)
    00000947 57               [ 4] 2027 	ld	d, a
    00000948 1A               [ 8] 2028 	ld	a, (de)
    00000949 C6 E0            [ 8] 2029 	add	a, #0xe0
    0000094B 4F               [ 4] 2030 	ld	c, a
    0000094C 2A               [ 8] 2031 	ld	a, (hl+)
    0000094D 5F               [ 4] 2032 	ld	e, a
    0000094E 56               [ 8] 2033 	ld	d, (hl)
    0000094F 1A               [ 8] 2034 	ld	a, (de)
    00000950 C6 E0            [ 8] 2035 	add	a, #0xe0
    00000952 F8 12            [12] 2036 	ldhl	sp,	#18
    00000954 5E               [ 8] 2037 	ld	e, (hl)
    00000955 2B               [ 8] 2038 	dec	hl
    00000956 16 00            [ 8] 2039 	ld	d, #0x00
    00000958 D5               [16] 2040 	push	de
    00000959 66               [ 8] 2041 	ld	h, (hl)
    0000095A E5               [16] 2042 	push	hl
    0000095B 33               [ 8] 2043 	inc	sp
    0000095C 59               [ 4] 2044 	ld	e, c
    0000095D CD BA 05         [24] 2045 	call	_isValidMove
    00000960 CB 47            [ 8] 2046 	bit	0,a
    00000962 CA E2 09         [16] 2047 	jp	Z, 00109$
    00000965 F8 04            [12] 2048 	ldhl	sp,#4
    00000967 2A               [ 8] 2049 	ld	a, (hl+)
    00000968 5F               [ 4] 2050 	ld	e, a
    00000969 56               [ 8] 2051 	ld	d, (hl)
    0000096A 1A               [ 8] 2052 	ld	a, (de)
    0000096B 4F               [ 4] 2053 	ld	c, a
    0000096C 06 00            [ 8] 2054 	ld	b, #0x00
    0000096E 79               [ 4] 2055 	ld	a, c
    0000096F C6 E0            [ 8] 2056 	add	a, #0xe0
    00000971 6F               [ 4] 2057 	ld	l, a
    00000972 78               [ 4] 2058 	ld	a, b
    00000973 CE FF            [ 8] 2059 	adc	a, #0xff
    00000975 67               [ 4] 2060 	ld	h, a
    00000976 09               [ 8] 2061 	add	hl, bc
    00000977 4D               [ 4] 2062 	ld	c,l
    00000978 44               [ 4] 2063 	ld	b,h
    00000979 CB 78            [ 8] 2064 	bit	7, b
    0000097B 28 03            [12] 2065 	jr	Z, 00124$
    0000097D 69               [ 4] 2066 	ld	l, c
    0000097E 60               [ 4] 2067 	ld	h, b
    0000097F 23               [ 8] 2068 	inc	hl
    00000980                       2069 00124$:
    00000980 4D               [ 4] 2070 	ld	c, l
    00000981 44               [ 4] 2071 	ld	b, h
    00000982 CB 28            [ 8] 2072 	sra	b
    00000984 CB 19            [ 8] 2073 	rr	c
    00000986 F8 0A            [12] 2074 	ldhl	sp,	#10
    00000988 79               [ 4] 2075 	ld	a, c
    00000989 32               [ 8] 2076 	ld	(hl-), a
    0000098A 2B               [ 8] 2077 	dec	hl
    0000098B 2A               [ 8] 2078 	ld	a, (hl+)
    0000098C 4F               [ 4] 2079 	ld	c, a
    0000098D 46               [ 8] 2080 	ld	b, (hl)
    0000098E 0A               [ 8] 2081 	ld	a, (bc)
    0000098F F8 10            [12] 2082 	ldhl	sp,	#16
    00000991 77               [ 8] 2083 	ld	(hl), a
    00000992 F8 0B            [12] 2084 	ldhl	sp,	#11
    00000994 22               [ 8] 2085 	ld	(hl+), a
    00000995 AF               [ 4] 2086 	xor	a, a
    00000996 32               [ 8] 2087 	ld	(hl-), a
    00000997 2A               [ 8] 2088 	ld	a, (hl+)
    00000998 5F               [ 4] 2089 	ld	e, a
    00000999 56               [ 8] 2090 	ld	d, (hl)
    0000099A 21 20 00         [12] 2091 	ld	hl, #0x0020
    0000099D 7B               [ 4] 2092 	ld	a, e
    0000099E 95               [ 4] 2093 	sub	a, l
    0000099F 5F               [ 4] 2094 	ld	e, a
    000009A0 7A               [ 4] 2095 	ld	a, d
    000009A1 9C               [ 4] 2096 	sbc	a, h
    000009A2 F8 0E            [12] 2097 	ldhl	sp,	#14
    000009A4 32               [ 8] 2098 	ld	(hl-), a
    000009A5 7B               [ 4] 2099 	ld	a, e
    000009A6 22               [ 8] 2100 	ld	(hl+), a
    000009A7 2B               [ 8] 2101 	dec	hl
    000009A8 2A               [ 8] 2102 	ld	a, (hl+)
    000009A9 5F               [ 4] 2103 	ld	e, a
    000009AA 56               [ 8] 2104 	ld	d, (hl)
    000009AB F8 0B            [12] 2105 	ldhl	sp,	#11
    000009AD 2A               [ 8] 2106 	ld	a,	(hl+)
    000009AE 66               [ 8] 2107 	ld	h, (hl)
    000009AF 6F               [ 4] 2108 	ld	l, a
    000009B0 19               [ 8] 2109 	add	hl, de
    000009B1 E5               [16] 2110 	push	hl
    000009B2 7D               [ 4] 2111 	ld	a, l
    000009B3 F8 11            [12] 2112 	ldhl	sp,	#17
    000009B5 77               [ 8] 2113 	ld	(hl), a
    000009B6 E1               [12] 2114 	pop	hl
    000009B7 7C               [ 4] 2115 	ld	a, h
    000009B8 F8 10            [12] 2116 	ldhl	sp,	#16
    000009BA 32               [ 8] 2117 	ld	(hl-), a
    000009BB 2A               [ 8] 2118 	ld	a, (hl+)
    000009BC 4F               [ 4] 2119 	ld	c, a
    000009BD 46               [ 8] 2120 	ld	b, (hl)
    000009BE CB 7E            [12] 2121 	bit	7, (hl)
    000009C0 28 05            [12] 2122 	jr	Z, 00125$
    000009C2 2B               [ 8] 2123 	dec	hl
    000009C3 2A               [ 8] 2124 	ld	a, (hl+)
    000009C4 4F               [ 4] 2125 	ld	c, a
    000009C5 46               [ 8] 2126 	ld	b, (hl)
    000009C6 03               [ 8] 2127 	inc	bc
    000009C7                       2128 00125$:
    000009C7 CB 28            [ 8] 2129 	sra	b
    000009C9 CB 19            [ 8] 2130 	rr	c
    000009CB 79               [ 4] 2131 	ld	a, c
    000009CC 11 0C 00         [12] 2132 	ld	de, #0x000c
    000009CF D5               [16] 2133 	push	de
    000009D0 F8 04            [12] 2134 	ldhl	sp,	#4
    000009D2 5E               [ 8] 2135 	ld	e, (hl)
    000009D3 23               [ 8] 2136 	inc	hl
    000009D4 56               [ 8] 2137 	ld	d, (hl)
    000009D5 D5               [16] 2138 	push	de
    000009D6 F8 0E            [12] 2139 	ldhl	sp,	#14
    000009D8 5E               [ 8] 2140 	ld	e, (hl)
    000009D9 CD 54 05         [24] 2141 	call	_getCaptureIndex
    000009DC 79               [ 4] 2142 	ld	a, c
    000009DD A0               [ 4] 2143 	and	a, b
    000009DE 3C               [ 4] 2144 	inc	a
    000009DF C2 6C 0A         [16] 2145 	jp	NZ, 00101$
    000009E2                       2146 00109$:
                         000007E2  2147 	C$main.c$311$4_0$276	= .
                                   2148 	.globl	C$main.c$311$4_0$276
                                   2149 ;..\main.c:311: isValidMove(pieces[i].x + 2 * SQUARE_SIZE, pieces[i].y - 2 * SQUARE_SIZE, currentPlayer, i) && (getCaptureIndex((((pieces[i].x + 2 * SQUARE_SIZE) + (pieces[i].x)) / 2), (((pieces[i].y - 2 * SQUARE_SIZE) + (pieces[i].y)) / 2), opponentPieces, numOpponentPieces) != -1)) {
    000009E2 F8 04            [12] 2150 	ldhl	sp,#4
    000009E4 2A               [ 8] 2151 	ld	a, (hl+)
    000009E5 5F               [ 4] 2152 	ld	e, a
    000009E6 2A               [ 8] 2153 	ld	a, (hl+)
    000009E7 57               [ 4] 2154 	ld	d, a
    000009E8 1A               [ 8] 2155 	ld	a, (de)
    000009E9 C6 E0            [ 8] 2156 	add	a, #0xe0
    000009EB 4F               [ 4] 2157 	ld	c, a
    000009EC 2A               [ 8] 2158 	ld	a, (hl+)
    000009ED 5F               [ 4] 2159 	ld	e, a
    000009EE 56               [ 8] 2160 	ld	d, (hl)
    000009EF 1A               [ 8] 2161 	ld	a, (de)
    000009F0 C6 20            [ 8] 2162 	add	a, #0x20
    000009F2 F8 12            [12] 2163 	ldhl	sp,	#18
    000009F4 5E               [ 8] 2164 	ld	e, (hl)
    000009F5 2B               [ 8] 2165 	dec	hl
    000009F6 16 00            [ 8] 2166 	ld	d, #0x00
    000009F8 D5               [16] 2167 	push	de
    000009F9 66               [ 8] 2168 	ld	h, (hl)
    000009FA E5               [16] 2169 	push	hl
    000009FB 33               [ 8] 2170 	inc	sp
    000009FC 59               [ 4] 2171 	ld	e, c
    000009FD CD BA 05         [24] 2172 	call	_isValidMove
    00000A00 CB 47            [ 8] 2173 	bit	0,a
    00000A02 28 6C            [12] 2174 	jr	Z, 00113$
    00000A04 F8 04            [12] 2175 	ldhl	sp,#4
    00000A06 2A               [ 8] 2176 	ld	a, (hl+)
    00000A07 5F               [ 4] 2177 	ld	e, a
    00000A08 56               [ 8] 2178 	ld	d, (hl)
    00000A09 1A               [ 8] 2179 	ld	a, (de)
    00000A0A 4F               [ 4] 2180 	ld	c, a
    00000A0B 06 00            [ 8] 2181 	ld	b, #0x00
    00000A0D 79               [ 4] 2182 	ld	a, c
    00000A0E C6 E0            [ 8] 2183 	add	a, #0xe0
    00000A10 5F               [ 4] 2184 	ld	e, a
    00000A11 78               [ 4] 2185 	ld	a, b
    00000A12 CE FF            [ 8] 2186 	adc	a, #0xff
    00000A14 57               [ 4] 2187 	ld	d, a
    00000A15 6B               [ 4] 2188 	ld	l, e
    00000A16 62               [ 4] 2189 	ld	h, d
    00000A17 09               [ 8] 2190 	add	hl, bc
    00000A18 E5               [16] 2191 	push	hl
    00000A19 7D               [ 4] 2192 	ld	a, l
    00000A1A F8 0F            [12] 2193 	ldhl	sp,	#15
    00000A1C 77               [ 8] 2194 	ld	(hl), a
    00000A1D E1               [12] 2195 	pop	hl
    00000A1E 7C               [ 4] 2196 	ld	a, h
    00000A1F F8 0E            [12] 2197 	ldhl	sp,	#14
    00000A21 32               [ 8] 2198 	ld	(hl-), a
    00000A22 2A               [ 8] 2199 	ld	a, (hl+)
    00000A23 23               [ 8] 2200 	inc	hl
    00000A24 32               [ 8] 2201 	ld	(hl-), a
    00000A25 2A               [ 8] 2202 	ld	a, (hl+)
    00000A26 23               [ 8] 2203 	inc	hl
    00000A27 32               [ 8] 2204 	ld	(hl-), a
    00000A28 2B               [ 8] 2205 	dec	hl
    00000A29 CB 7E            [12] 2206 	bit	7, (hl)
    00000A2B 28 11            [12] 2207 	jr	Z, 00126$
    00000A2D 2B               [ 8] 2208 	dec	hl
    00000A2E 2A               [ 8] 2209 	ld	a, (hl+)
    00000A2F 5F               [ 4] 2210 	ld	e, a
    00000A30 56               [ 8] 2211 	ld	d, (hl)
    00000A31 6B               [ 4] 2212 	ld	l, e
    00000A32 62               [ 4] 2213 	ld	h, d
    00000A33 23               [ 8] 2214 	inc	hl
    00000A34 E5               [16] 2215 	push	hl
    00000A35 7D               [ 4] 2216 	ld	a, l
    00000A36 F8 11            [12] 2217 	ldhl	sp,	#17
    00000A38 77               [ 8] 2218 	ld	(hl), a
    00000A39 E1               [12] 2219 	pop	hl
    00000A3A 7C               [ 4] 2220 	ld	a, h
    00000A3B F8 10            [12] 2221 	ldhl	sp,	#16
    00000A3D 77               [ 8] 2222 	ld	(hl), a
    00000A3E                       2223 00126$:
    00000A3E F8 0F            [12] 2224 	ldhl	sp,#15
    00000A40 2A               [ 8] 2225 	ld	a, (hl+)
    00000A41 5F               [ 4] 2226 	ld	e, a
    00000A42 56               [ 8] 2227 	ld	d, (hl)
    00000A43 CB 2A            [ 8] 2228 	sra	d
    00000A45 CB 1B            [ 8] 2229 	rr	e
    00000A47 F8 08            [12] 2230 	ldhl	sp,	#8
    00000A49 2A               [ 8] 2231 	ld	a, (hl+)
    00000A4A 4F               [ 4] 2232 	ld	c, a
    00000A4B 46               [ 8] 2233 	ld	b, (hl)
    00000A4C 0A               [ 8] 2234 	ld	a, (bc)
    00000A4D 4F               [ 4] 2235 	ld	c, a
    00000A4E 06 00            [ 8] 2236 	ld	b, #0x00
    00000A50 21 20 00         [12] 2237 	ld	hl, #0x0020
    00000A53 09               [ 8] 2238 	add	hl, bc
    00000A54 09               [ 8] 2239 	add	hl, bc
    00000A55 CB 2C            [ 8] 2240 	sra	h
    00000A57 CB 1D            [ 8] 2241 	rr	l
    00000A59 7D               [ 4] 2242 	ld	a, l
    00000A5A 01 0C 00         [12] 2243 	ld	bc, #0x000c
    00000A5D C5               [16] 2244 	push	bc
    00000A5E F8 04            [12] 2245 	ldhl	sp,	#4
    00000A60 4E               [ 8] 2246 	ld	c, (hl)
    00000A61 23               [ 8] 2247 	inc	hl
    00000A62 46               [ 8] 2248 	ld	b, (hl)
    00000A63 C5               [16] 2249 	push	bc
    00000A64 CD 54 05         [24] 2250 	call	_getCaptureIndex
    00000A67 79               [ 4] 2251 	ld	a, c
    00000A68 A0               [ 4] 2252 	and	a, b
    00000A69 3C               [ 4] 2253 	inc	a
    00000A6A 28 04            [12] 2254 	jr	Z, 00113$
    00000A6C                       2255 00101$:
                         0000086C  2256 	C$main.c$312$5_0$277	= .
                                   2257 	.globl	C$main.c$312$5_0$277
                                   2258 ;..\main.c:312: return true; // Found at least one valid capture move
    00000A6C 3E 01            [ 8] 2259 	ld	a, #0x01
    00000A6E 18 07            [12] 2260 	jr	00114$
    00000A70                       2261 00113$:
                         00000870  2262 	C$main.c$307$2_0$274	= .
                                   2263 	.globl	C$main.c$307$2_0$274
                                   2264 ;..\main.c:307: for (int i = 0; i < numPieces; i++) {
    00000A70 F8 12            [12] 2265 	ldhl	sp,	#18
    00000A72 34               [12] 2266 	inc	(hl)
    00000A73 C3 2E 08         [16] 2267 	jp	00112$
    00000A76                       2268 00110$:
                         00000876  2269 	C$main.c$315$1_0$273	= .
                                   2270 	.globl	C$main.c$315$1_0$273
                                   2271 ;..\main.c:315: return false; // No valid capture moves found for any piece
    00000A76 AF               [ 4] 2272 	xor	a, a
    00000A77                       2273 00114$:
                         00000877  2274 	C$main.c$316$1_0$273	= .
                                   2275 	.globl	C$main.c$316$1_0$273
                                   2276 ;..\main.c:316: }
    00000A77 E8 14            [16] 2277 	add	sp, #20
                         00000879  2278 	C$main.c$316$1_0$273	= .
                                   2279 	.globl	C$main.c$316$1_0$273
                         00000879  2280 	XG$hasValidCaptureMoves$0$0	= .
                                   2281 	.globl	XG$hasValidCaptureMoves$0$0
    00000A79 C9               [16] 2282 	ret
                         0000087A  2283 	G$hasValidNonCaptureMoves$0$0	= .
                                   2284 	.globl	G$hasValidNonCaptureMoves$0$0
                         0000087A  2285 	C$main.c$317$1_0$279	= .
                                   2286 	.globl	C$main.c$317$1_0$279
                                   2287 ;..\main.c:317: bool hasValidNonCaptureMoves(UINT8 currentPlayer) {
                                   2288 ;	---------------------------------
                                   2289 ; Function hasValidNonCaptureMoves
                                   2290 ; ---------------------------------
    00000A7A                       2291 _hasValidNonCaptureMoves::
    00000A7A E8 F7            [16] 2292 	add	sp, #-9
    00000A7C F8 06            [12] 2293 	ldhl	sp,	#6
                         0000087E  2294 	C$main.c$318$1_0$279	= .
                                   2295 	.globl	C$main.c$318$1_0$279
                                   2296 ;..\main.c:318: Piece* pieces = (currentPlayer == BLACK_PLAYER) ? blackPieces : whitePieces;
    00000A7E 77               [ 8] 2297 	ld	(hl), a
    00000A7F B7               [ 4] 2298 	or	a, a
    00000A80 20 05            [12] 2299 	jr	NZ, 00112$
    00000A82 01 43 C3         [12] 2300 	ld	bc, #_blackPieces+0
    00000A85 18 03            [12] 2301 	jr	00113$
    00000A87                       2302 00112$:
    00000A87 01 67 C3         [12] 2303 	ld	bc, #_whitePieces+0
    00000A8A                       2304 00113$:
    00000A8A F8 02            [12] 2305 	ldhl	sp,	#2
    00000A8C 79               [ 4] 2306 	ld	a, c
    00000A8D 22               [ 8] 2307 	ld	(hl+), a
    00000A8E 70               [ 8] 2308 	ld	(hl), b
                         0000088F  2309 	C$main.c$320$1_0$279	= .
                                   2310 	.globl	C$main.c$320$1_0$279
                                   2311 ;..\main.c:320: for (int i = 0; i < numPieces; i++) {
    00000A8F AF               [ 4] 2312 	xor	a, a
    00000A90 F8 07            [12] 2313 	ldhl	sp,	#7
    00000A92 22               [ 8] 2314 	ld	(hl+), a
    00000A93 77               [ 8] 2315 	ld	(hl), a
    00000A94                       2316 00108$:
    00000A94 F8 07            [12] 2317 	ldhl	sp,	#7
    00000A96 2A               [ 8] 2318 	ld	a, (hl+)
    00000A97 D6 0C            [ 8] 2319 	sub	a, #0x0c
    00000A99 7E               [ 8] 2320 	ld	a, (hl)
    00000A9A DE 00            [ 8] 2321 	sbc	a, #0x00
    00000A9C D2 41 0B         [16] 2322 	jp	NC, 00106$
                         0000089F  2323 	C$main.c$321$4_0$282	= .
                                   2324 	.globl	C$main.c$321$4_0$282
                                   2325 ;..\main.c:321: if (isValidMove(pieces[i].x - SQUARE_SIZE, pieces[i].y - SQUARE_SIZE, currentPlayer, i) ||
    00000A9F 2B               [ 8] 2326 	dec	hl
    00000AA0 2A               [ 8] 2327 	ld	a, (hl+)
    00000AA1 4F               [ 4] 2328 	ld	c, a
    00000AA2 46               [ 8] 2329 	ld	b, (hl)
    00000AA3 69               [ 4] 2330 	ld	l, c
    00000AA4 60               [ 4] 2331 	ld	h, b
    00000AA5 29               [ 8] 2332 	add	hl, hl
    00000AA6 09               [ 8] 2333 	add	hl, bc
    00000AA7 4D               [ 4] 2334 	ld	c, l
    00000AA8 44               [ 4] 2335 	ld	b, h
    00000AA9 F8 02            [12] 2336 	ldhl	sp,	#2
    00000AAB 2A               [ 8] 2337 	ld	a,	(hl+)
    00000AAC 66               [ 8] 2338 	ld	h, (hl)
    00000AAD 6F               [ 4] 2339 	ld	l, a
    00000AAE 09               [ 8] 2340 	add	hl, bc
    00000AAF 5D               [ 4] 2341 	ld	e, l
    00000AB0 54               [ 4] 2342 	ld	d, h
    00000AB1 4B               [ 4] 2343 	ld	c, e
    00000AB2 42               [ 4] 2344 	ld	b, d
    00000AB3 03               [ 8] 2345 	inc	bc
    00000AB4 0A               [ 8] 2346 	ld	a, (bc)
    00000AB5 C6 F0            [ 8] 2347 	add	a, #0xf0
    00000AB7 F8 05            [12] 2348 	ldhl	sp,	#5
    00000AB9 22               [ 8] 2349 	ld	(hl+), a
    00000ABA 23               [ 8] 2350 	inc	hl
    00000ABB 33               [ 8] 2351 	inc	sp
    00000ABC 33               [ 8] 2352 	inc	sp
    00000ABD D5               [16] 2353 	push	de
    00000ABE 1A               [ 8] 2354 	ld	a, (de)
    00000ABF C6 F0            [ 8] 2355 	add	a, #0xf0
    00000AC1 C5               [16] 2356 	push	bc
    00000AC2 5E               [ 8] 2357 	ld	e, (hl)
    00000AC3 2B               [ 8] 2358 	dec	hl
    00000AC4 16 00            [ 8] 2359 	ld	d, #0x00
    00000AC6 D5               [16] 2360 	push	de
    00000AC7 66               [ 8] 2361 	ld	h, (hl)
    00000AC8 E5               [16] 2362 	push	hl
    00000AC9 33               [ 8] 2363 	inc	sp
    00000ACA F8 0A            [12] 2364 	ldhl	sp,	#10
    00000ACC 5E               [ 8] 2365 	ld	e, (hl)
    00000ACD CD BA 05         [24] 2366 	call	_isValidMove
    00000AD0 5F               [ 4] 2367 	ld	e, a
    00000AD1 C1               [12] 2368 	pop	bc
    00000AD2 CB 43            [ 8] 2369 	bit	0, e
    00000AD4 20 61            [12] 2370 	jr	NZ, 00101$
                         000008D6  2371 	C$main.c$322$4_0$282	= .
                                   2372 	.globl	C$main.c$322$4_0$282
                                   2373 ;..\main.c:322: isValidMove(pieces[i].x + SQUARE_SIZE, pieces[i].y - SQUARE_SIZE, currentPlayer, i) ||
    00000AD6 0A               [ 8] 2374 	ld	a, (bc)
    00000AD7 C6 F0            [ 8] 2375 	add	a, #0xf0
    00000AD9 F8 05            [12] 2376 	ldhl	sp,	#5
    00000ADB 22               [ 8] 2377 	ld	(hl+), a
    00000ADC 23               [ 8] 2378 	inc	hl
    00000ADD D1               [12] 2379 	pop	de
    00000ADE D5               [16] 2380 	push	de
    00000ADF 1A               [ 8] 2381 	ld	a, (de)
    00000AE0 C6 10            [ 8] 2382 	add	a, #0x10
    00000AE2 C5               [16] 2383 	push	bc
    00000AE3 5E               [ 8] 2384 	ld	e, (hl)
    00000AE4 2B               [ 8] 2385 	dec	hl
    00000AE5 16 00            [ 8] 2386 	ld	d, #0x00
    00000AE7 D5               [16] 2387 	push	de
    00000AE8 66               [ 8] 2388 	ld	h, (hl)
    00000AE9 E5               [16] 2389 	push	hl
    00000AEA 33               [ 8] 2390 	inc	sp
    00000AEB F8 0A            [12] 2391 	ldhl	sp,	#10
    00000AED 5E               [ 8] 2392 	ld	e, (hl)
    00000AEE CD BA 05         [24] 2393 	call	_isValidMove
    00000AF1 5F               [ 4] 2394 	ld	e, a
    00000AF2 C1               [12] 2395 	pop	bc
    00000AF3 CB 43            [ 8] 2396 	bit	0, e
    00000AF5 20 40            [12] 2397 	jr	NZ, 00101$
                         000008F7  2398 	C$main.c$323$4_0$282	= .
                                   2399 	.globl	C$main.c$323$4_0$282
                                   2400 ;..\main.c:323: isValidMove(pieces[i].x - SQUARE_SIZE, pieces[i].y + SQUARE_SIZE, currentPlayer, i) ||
    00000AF7 0A               [ 8] 2401 	ld	a, (bc)
    00000AF8 C6 10            [ 8] 2402 	add	a, #0x10
    00000AFA F8 05            [12] 2403 	ldhl	sp,	#5
    00000AFC 22               [ 8] 2404 	ld	(hl+), a
    00000AFD 23               [ 8] 2405 	inc	hl
    00000AFE D1               [12] 2406 	pop	de
    00000AFF D5               [16] 2407 	push	de
    00000B00 1A               [ 8] 2408 	ld	a, (de)
    00000B01 C6 F0            [ 8] 2409 	add	a, #0xf0
    00000B03 C5               [16] 2410 	push	bc
    00000B04 5E               [ 8] 2411 	ld	e, (hl)
    00000B05 2B               [ 8] 2412 	dec	hl
    00000B06 16 00            [ 8] 2413 	ld	d, #0x00
    00000B08 D5               [16] 2414 	push	de
    00000B09 66               [ 8] 2415 	ld	h, (hl)
    00000B0A E5               [16] 2416 	push	hl
    00000B0B 33               [ 8] 2417 	inc	sp
    00000B0C F8 0A            [12] 2418 	ldhl	sp,	#10
    00000B0E 5E               [ 8] 2419 	ld	e, (hl)
    00000B0F CD BA 05         [24] 2420 	call	_isValidMove
    00000B12 5F               [ 4] 2421 	ld	e, a
    00000B13 C1               [12] 2422 	pop	bc
    00000B14 CB 43            [ 8] 2423 	bit	0, e
    00000B16 20 1F            [12] 2424 	jr	NZ, 00101$
                         00000918  2425 	C$main.c$324$4_0$282	= .
                                   2426 	.globl	C$main.c$324$4_0$282
                                   2427 ;..\main.c:324: isValidMove(pieces[i].x + SQUARE_SIZE, pieces[i].y + SQUARE_SIZE, currentPlayer, i)) {
    00000B18 0A               [ 8] 2428 	ld	a, (bc)
    00000B19 C6 10            [ 8] 2429 	add	a, #0x10
    00000B1B F8 04            [12] 2430 	ldhl	sp,	#4
    00000B1D 22               [ 8] 2431 	ld	(hl+), a
    00000B1E D1               [12] 2432 	pop	de
    00000B1F D5               [16] 2433 	push	de
    00000B20 1A               [ 8] 2434 	ld	a, (de)
    00000B21 22               [ 8] 2435 	ld	(hl+), a
    00000B22 23               [ 8] 2436 	inc	hl
    00000B23 C6 10            [ 8] 2437 	add	a, #0x10
    00000B25 5E               [ 8] 2438 	ld	e, (hl)
    00000B26 2B               [ 8] 2439 	dec	hl
    00000B27 16 00            [ 8] 2440 	ld	d, #0x00
    00000B29 D5               [16] 2441 	push	de
    00000B2A 66               [ 8] 2442 	ld	h, (hl)
    00000B2B E5               [16] 2443 	push	hl
    00000B2C 33               [ 8] 2444 	inc	sp
    00000B2D F8 07            [12] 2445 	ldhl	sp,	#7
    00000B2F 5E               [ 8] 2446 	ld	e, (hl)
    00000B30 CD BA 05         [24] 2447 	call	_isValidMove
    00000B33 CB 47            [ 8] 2448 	bit	0,a
    00000B35 28 04            [12] 2449 	jr	Z, 00109$
    00000B37                       2450 00101$:
                         00000937  2451 	C$main.c$325$5_0$283	= .
                                   2452 	.globl	C$main.c$325$5_0$283
                                   2453 ;..\main.c:325: return true; // Found at least one valid move
    00000B37 3E 01            [ 8] 2454 	ld	a, #0x01
    00000B39 18 07            [12] 2455 	jr	00110$
    00000B3B                       2456 00109$:
                         0000093B  2457 	C$main.c$320$2_0$280	= .
                                   2458 	.globl	C$main.c$320$2_0$280
                                   2459 ;..\main.c:320: for (int i = 0; i < numPieces; i++) {
    00000B3B F8 07            [12] 2460 	ldhl	sp,	#7
    00000B3D 34               [12] 2461 	inc	(hl)
    00000B3E C3 94 0A         [16] 2462 	jp	00108$
    00000B41                       2463 00106$:
                         00000941  2464 	C$main.c$328$1_0$279	= .
                                   2465 	.globl	C$main.c$328$1_0$279
                                   2466 ;..\main.c:328: return false; // No valid moves found for any piece
    00000B41 AF               [ 4] 2467 	xor	a, a
    00000B42                       2468 00110$:
                         00000942  2469 	C$main.c$329$1_0$279	= .
                                   2470 	.globl	C$main.c$329$1_0$279
                                   2471 ;..\main.c:329: }
    00000B42 E8 09            [16] 2472 	add	sp, #9
                         00000944  2473 	C$main.c$329$1_0$279	= .
                                   2474 	.globl	C$main.c$329$1_0$279
                         00000944  2475 	XG$hasValidNonCaptureMoves$0$0	= .
                                   2476 	.globl	XG$hasValidNonCaptureMoves$0$0
    00000B44 C9               [16] 2477 	ret
                         00000945  2478 	G$hasValidMoves$0$0	= .
                                   2479 	.globl	G$hasValidMoves$0$0
                         00000945  2480 	C$main.c$330$1_0$285	= .
                                   2481 	.globl	C$main.c$330$1_0$285
                                   2482 ;..\main.c:330: bool hasValidMoves(UINT8 currentPlayer) {
                                   2483 ;	---------------------------------
                                   2484 ; Function hasValidMoves
                                   2485 ; ---------------------------------
    00000B45                       2486 _hasValidMoves::
    00000B45 5F               [ 4] 2487 	ld	e, a
                         00000946  2488 	C$main.c$331$1_0$285	= .
                                   2489 	.globl	C$main.c$331$1_0$285
                                   2490 ;..\main.c:331: bool hasValidNonCapture = hasValidNonCaptureMoves(currentPlayer);
    00000B46 D5               [16] 2491 	push	de
    00000B47 7B               [ 4] 2492 	ld	a, e
    00000B48 CD 7A 0A         [24] 2493 	call	_hasValidNonCaptureMoves
    00000B4B 4F               [ 4] 2494 	ld	c, a
    00000B4C D1               [12] 2495 	pop	de
                         0000094D  2496 	C$main.c$332$1_0$285	= .
                                   2497 	.globl	C$main.c$332$1_0$285
                                   2498 ;..\main.c:332: bool hasValidCapture = hasValidCaptureMoves(currentPlayer);
    00000B4D C5               [16] 2499 	push	bc
    00000B4E 7B               [ 4] 2500 	ld	a, e
    00000B4F CD 03 08         [24] 2501 	call	_hasValidCaptureMoves
    00000B52 5F               [ 4] 2502 	ld	e, a
    00000B53 C1               [12] 2503 	pop	bc
                         00000954  2504 	C$main.c$333$2_0$286	= .
                                   2505 	.globl	C$main.c$333$2_0$286
                                   2506 ;..\main.c:333: if (hasValidNonCapture || hasValidCapture) {
    00000B54 CB 41            [ 8] 2507 	bit	0, c
    00000B56 20 04            [12] 2508 	jr	NZ, 00101$
    00000B58 CB 43            [ 8] 2509 	bit	0, e
    00000B5A 28 03            [12] 2510 	jr	Z, 00102$
    00000B5C                       2511 00101$:
                         0000095C  2512 	C$main.c$334$3_0$287	= .
                                   2513 	.globl	C$main.c$334$3_0$287
                                   2514 ;..\main.c:334: return true; // No valid moves
    00000B5C 3E 01            [ 8] 2515 	ld	a, #0x01
    00000B5E C9               [16] 2516 	ret
    00000B5F                       2517 00102$:
                         0000095F  2518 	C$main.c$336$1_0$285	= .
                                   2519 	.globl	C$main.c$336$1_0$285
                                   2520 ;..\main.c:336: return false; // Has valid moves
    00000B5F AF               [ 4] 2521 	xor	a, a
                         00000960  2522 	C$main.c$337$1_0$285	= .
                                   2523 	.globl	C$main.c$337$1_0$285
                                   2524 ;..\main.c:337: }
                         00000960  2525 	C$main.c$337$1_0$285	= .
                                   2526 	.globl	C$main.c$337$1_0$285
                         00000960  2527 	XG$hasValidMoves$0$0	= .
                                   2528 	.globl	XG$hasValidMoves$0$0
    00000B60 C9               [16] 2529 	ret
                         00000961  2530 	G$printTurn$0$0	= .
                                   2531 	.globl	G$printTurn$0$0
                         00000961  2532 	C$main.c$338$1_0$289	= .
                                   2533 	.globl	C$main.c$338$1_0$289
                                   2534 ;..\main.c:338: void printTurn() {
                                   2535 ;	---------------------------------
                                   2536 ; Function printTurn
                                   2537 ; ---------------------------------
    00000B61                       2538 _printTurn::
                         00000961  2539 	C$main.c$339$2_0$289	= .
                                   2540 	.globl	C$main.c$339$2_0$289
                                   2541 ;..\main.c:339: if (hasValidMoves(currentPlayer)){
    00000B61 FA D7 C0         [16] 2542 	ld	a, (_currentPlayer)
    00000B64 CD 45 0B         [24] 2543 	call	_hasValidMoves
    00000B67 CB 47            [ 8] 2544 	bit	0,a
    00000B69 28 33            [12] 2545 	jr	Z, 00108$
                         0000096B  2546 	C$main.c$340$4_0$291	= .
                                   2547 	.globl	C$main.c$340$4_0$291
                                   2548 ;..\main.c:340: if (currentPlayer == BLACK_PLAYER){
    00000B6B FA D7 C0         [16] 2549 	ld	a, (#_currentPlayer)
    00000B6E B7               [ 4] 2550 	or	a, a
    00000B6F 20 13            [12] 2551 	jr	NZ, 00102$
                         00000971  2552 	C$main.c$341$5_0$292	= .
                                   2553 	.globl	C$main.c$341$5_0$292
                                   2554 ;..\main.c:341: set_win_tiles(2, 0, 16, 1, currentPlayerBlackText);
    00000B71 11 D3 C2         [12] 2555 	ld	de, #_currentPlayerBlackText
    00000B74 D5               [16] 2556 	push	de
    00000B75 21 10 01         [12] 2557 	ld	hl, #0x110
    00000B78 E5               [16] 2558 	push	hl
    00000B79 21 02 00         [12] 2559 	ld	hl, #0x02
    00000B7C E5               [16] 2560 	push	hl
    00000B7D CD 36 13         [24] 2561 	call	_set_win_tiles
    00000B80 E8 06            [16] 2562 	add	sp, #6
    00000B82 18 11            [12] 2563 	jr	00103$
    00000B84                       2564 00102$:
                         00000984  2565 	C$main.c$343$5_0$293	= .
                                   2566 	.globl	C$main.c$343$5_0$293
                                   2567 ;..\main.c:343: set_win_tiles(2, 0, 16, 1, currentPlayerWhiteText);
    00000B84 11 E3 C2         [12] 2568 	ld	de, #_currentPlayerWhiteText
    00000B87 D5               [16] 2569 	push	de
    00000B88 21 10 01         [12] 2570 	ld	hl, #0x110
    00000B8B E5               [16] 2571 	push	hl
    00000B8C 21 02 00         [12] 2572 	ld	hl, #0x02
    00000B8F E5               [16] 2573 	push	hl
    00000B90 CD 36 13         [24] 2574 	call	_set_win_tiles
    00000B93 E8 06            [16] 2575 	add	sp, #6
    00000B95                       2576 00103$:
                                   2577 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
    00000B95 3E 07            [ 8] 2578 	ld	a, #0x07
    00000B97 E0 4B            [12] 2579 	ldh	(_WX_REG + 0), a
    00000B99 3E 88            [ 8] 2580 	ld	a, #0x88
    00000B9B E0 4A            [12] 2581 	ldh	(_WY_REG + 0), a
                         0000099D  2582 	C$main.c$345$2_0$289	= .
                                   2583 	.globl	C$main.c$345$2_0$289
                                   2584 ;..\main.c:345: move_win(7, 136);
    00000B9D C9               [16] 2585 	ret
    00000B9E                       2586 00108$:
                         0000099E  2587 	C$main.c$347$3_0$294	= .
                                   2588 	.globl	C$main.c$347$3_0$294
                                   2589 ;..\main.c:347: set_win_tiles(2, 0, 16, 1, clearText);
    00000B9E 11 F3 C2         [12] 2590 	ld	de, #_clearText
    00000BA1 D5               [16] 2591 	push	de
    00000BA2 21 10 01         [12] 2592 	ld	hl, #0x110
    00000BA5 E5               [16] 2593 	push	hl
    00000BA6 21 02 00         [12] 2594 	ld	hl, #0x02
    00000BA9 E5               [16] 2595 	push	hl
    00000BAA CD 36 13         [24] 2596 	call	_set_win_tiles
    00000BAD E8 06            [16] 2597 	add	sp, #6
                         000009AF  2598 	C$main.c$348$4_0$295	= .
                                   2599 	.globl	C$main.c$348$4_0$295
                                   2600 ;..\main.c:348: if (currentPlayer == BLACK_PLAYER){
    00000BAF FA D7 C0         [16] 2601 	ld	a, (#_currentPlayer)
    00000BB2 B7               [ 4] 2602 	or	a, a
    00000BB3 20 13            [12] 2603 	jr	NZ, 00105$
                         000009B5  2604 	C$main.c$349$5_0$296	= .
                                   2605 	.globl	C$main.c$349$5_0$296
                                   2606 ;..\main.c:349: set_win_tiles(2, 8, 16, 1, whiteWins);
    00000BB5 11 03 C3         [12] 2607 	ld	de, #_whiteWins
    00000BB8 D5               [16] 2608 	push	de
    00000BB9 21 10 01         [12] 2609 	ld	hl, #0x110
    00000BBC E5               [16] 2610 	push	hl
    00000BBD 21 02 08         [12] 2611 	ld	hl, #0x802
    00000BC0 E5               [16] 2612 	push	hl
    00000BC1 CD 36 13         [24] 2613 	call	_set_win_tiles
    00000BC4 E8 06            [16] 2614 	add	sp, #6
    00000BC6 18 11            [12] 2615 	jr	00106$
    00000BC8                       2616 00105$:
                         000009C8  2617 	C$main.c$351$5_0$297	= .
                                   2618 	.globl	C$main.c$351$5_0$297
                                   2619 ;..\main.c:351: set_win_tiles(2, 8, 16, 1, blackWins);
    00000BC8 11 13 C3         [12] 2620 	ld	de, #_blackWins
    00000BCB D5               [16] 2621 	push	de
    00000BCC 21 10 01         [12] 2622 	ld	hl, #0x110
    00000BCF E5               [16] 2623 	push	hl
    00000BD0 21 02 08         [12] 2624 	ld	hl, #0x802
    00000BD3 E5               [16] 2625 	push	hl
    00000BD4 CD 36 13         [24] 2626 	call	_set_win_tiles
    00000BD7 E8 06            [16] 2627 	add	sp, #6
    00000BD9                       2628 00106$:
                                   2629 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
    00000BD9 3E 07            [ 8] 2630 	ld	a, #0x07
    00000BDB E0 4B            [12] 2631 	ldh	(_WX_REG + 0), a
    00000BDD 3E 07            [ 8] 2632 	ld	a, #0x07
    00000BDF E0 4A            [12] 2633 	ldh	(_WY_REG + 0), a
                         000009E1  2634 	C$main.c$353$2_0$289	= .
                                   2635 	.globl	C$main.c$353$2_0$289
                                   2636 ;..\main.c:353: move_win(7, 7);
                         000009E1  2637 	C$main.c$355$2_0$289	= .
                                   2638 	.globl	C$main.c$355$2_0$289
                                   2639 ;..\main.c:355: }
                         000009E1  2640 	C$main.c$355$2_0$289	= .
                                   2641 	.globl	C$main.c$355$2_0$289
                         000009E1  2642 	XG$printTurn$0$0	= .
                                   2643 	.globl	XG$printTurn$0$0
    00000BE1 C9               [16] 2644 	ret
                         000009E2  2645 	G$main$0$0	= .
                                   2646 	.globl	G$main$0$0
                         000009E2  2647 	C$main.c$357$2_0$304	= .
                                   2648 	.globl	C$main.c$357$2_0$304
                                   2649 ;..\main.c:357: void main() {
                                   2650 ;	---------------------------------
                                   2651 ; Function main
                                   2652 ; ---------------------------------
    00000BE2                       2653 _main::
    00000BE2 E8 F0            [16] 2654 	add	sp, #-16
                         000009E4  2655 	C$main.c$358$1_0$304	= .
                                   2656 	.globl	C$main.c$358$1_0$304
                                   2657 ;..\main.c:358: font();
    00000BE4 CD F2 02         [24] 2658 	call	_font
                         000009E7  2659 	C$main.c$359$1_0$304	= .
                                   2660 	.globl	C$main.c$359$1_0$304
                                   2661 ;..\main.c:359: printTurn();
    00000BE7 CD 61 0B         [24] 2662 	call	_printTurn
                         000009EA  2663 	C$main.c$360$1_0$304	= .
                                   2664 	.globl	C$main.c$360$1_0$304
                                   2665 ;..\main.c:360: printbkg();
    00000BEA CD 03 03         [24] 2666 	call	_printbkg
                         000009ED  2667 	C$main.c$361$1_0$304	= .
                                   2668 	.globl	C$main.c$361$1_0$304
                                   2669 ;..\main.c:361: printSquare();
    00000BED CD 3B 03         [24] 2670 	call	_printSquare
                         000009F0  2671 	C$main.c$362$1_0$304	= .
                                   2672 	.globl	C$main.c$362$1_0$304
                                   2673 ;..\main.c:362: printBlack();
    00000BF0 CD 85 03         [24] 2674 	call	_printBlack
                         000009F3  2675 	C$main.c$363$1_0$304	= .
                                   2676 	.globl	C$main.c$363$1_0$304
                                   2677 ;..\main.c:363: printWhite();
    00000BF3 CD 61 04         [24] 2678 	call	_printWhite
                         000009F6  2679 	C$main.c$364$1_0$304	= .
                                   2680 	.globl	C$main.c$364$1_0$304
                                   2681 ;..\main.c:364: SHOW_BKG;  
    00000BF6 F0 40            [12] 2682 	ldh	a, (_LCDC_REG + 0)
    00000BF8 F6 01            [ 8] 2683 	or	a, #0x01
    00000BFA E0 40            [12] 2684 	ldh	(_LCDC_REG + 0), a
                         000009FC  2685 	C$main.c$365$1_0$304	= .
                                   2686 	.globl	C$main.c$365$1_0$304
                                   2687 ;..\main.c:365: SHOW_SPRITES;
    00000BFC F0 40            [12] 2688 	ldh	a, (_LCDC_REG + 0)
    00000BFE F6 02            [ 8] 2689 	or	a, #0x02
    00000C00 E0 40            [12] 2690 	ldh	(_LCDC_REG + 0), a
                         00000A02  2691 	C$main.c$366$1_0$304	= .
                                   2692 	.globl	C$main.c$366$1_0$304
                                   2693 ;..\main.c:366: SHOW_WIN;
    00000C02 F0 40            [12] 2694 	ldh	a, (_LCDC_REG + 0)
    00000C04 F6 20            [ 8] 2695 	or	a, #0x20
    00000C06 E0 40            [12] 2696 	ldh	(_LCDC_REG + 0), a
                         00000A08  2697 	C$main.c$367$1_0$304	= .
                                   2698 	.globl	C$main.c$367$1_0$304
                                   2699 ;..\main.c:367: while(1) {
    00000C08                       2700 00153$:
                         00000A08  2701 	C$main.c$368$2_0$305	= .
                                   2702 	.globl	C$main.c$368$2_0$305
                                   2703 ;..\main.c:368: joypad_input = joypad();
    00000C08 CD 99 1C         [24] 2704 	call	_joypad
    00000C0B 21 B1 C0         [12] 2705 	ld	hl, #_joypad_input
    00000C0E 77               [ 8] 2706 	ld	(hl), a
                         00000A0F  2707 	C$main.c$370$3_0$306	= .
                                   2708 	.globl	C$main.c$370$3_0$306
                                   2709 ;..\main.c:370: if (joypad_input != lastButtonState) {
    00000C0F 7E               [ 8] 2710 	ld	a, (hl)
    00000C10 21 D0 C0         [12] 2711 	ld	hl, #_lastButtonState
    00000C13 96               [ 8] 2712 	sub	a, (hl)
    00000C14 28 0E            [12] 2713 	jr	Z, 00104$
                         00000A16  2714 	C$main.c$371$4_0$307	= .
                                   2715 	.globl	C$main.c$371$4_0$307
                                   2716 ;..\main.c:371: debounceTimer = 0; // Reset the debounce timer
    00000C16 AF               [ 4] 2717 	xor	a, a
    00000C17 21 D1 C0         [12] 2718 	ld	hl, #_debounceTimer
    00000C1A 22               [ 8] 2719 	ld	(hl+), a
    00000C1B 77               [ 8] 2720 	ld	(hl), a
                         00000A1C  2721 	C$main.c$372$4_0$307	= .
                                   2722 	.globl	C$main.c$372$4_0$307
                                   2723 ;..\main.c:372: lastButtonState = joypad_input;
    00000C1C FA B1 C0         [16] 2724 	ld	a, (#_joypad_input)
    00000C1F EA D0 C0         [16] 2725 	ld	(#_lastButtonState),a
    00000C22 18 16            [12] 2726 	jr	00105$
    00000C24                       2727 00104$:
                         00000A24  2728 	C$main.c$373$4_0$308	= .
                                   2729 	.globl	C$main.c$373$4_0$308
                                   2730 ;..\main.c:373: } else if (debounceTimer < DEBOUNCE_DELAY) {
    00000C24 21 D1 C0         [12] 2731 	ld	hl, #_debounceTimer
    00000C27 2A               [ 8] 2732 	ld	a, (hl+)
    00000C28 D6 06            [ 8] 2733 	sub	a, #0x06
    00000C2A 7E               [ 8] 2734 	ld	a, (hl)
    00000C2B DE 00            [ 8] 2735 	sbc	a, #0x00
    00000C2D 30 0B            [12] 2736 	jr	NC, 00105$
                         00000A2F  2737 	C$main.c$374$5_0$309	= .
                                   2738 	.globl	C$main.c$374$5_0$309
                                   2739 ;..\main.c:374: debounceTimer += 100; // Increment the debounce timer based on the loop delay (100ms in this code)
    00000C2F 2B               [ 8] 2740 	dec	hl
    00000C30 7E               [ 8] 2741 	ld	a, (hl)
    00000C31 C6 64            [ 8] 2742 	add	a, #0x64
    00000C33 22               [ 8] 2743 	ld	(hl+), a
    00000C34 7E               [ 8] 2744 	ld	a, (hl)
    00000C35 CE 00            [ 8] 2745 	adc	a, #0x00
    00000C37 77               [ 8] 2746 	ld	(hl), a
                         00000A38  2747 	C$main.c$375$5_0$309	= .
                                   2748 	.globl	C$main.c$375$5_0$309
                                   2749 ;..\main.c:375: continue; // Skip processing input until the debounce delay is reached
    00000C38 18 CE            [12] 2750 	jr	00153$
    00000C3A                       2751 00105$:
                         00000A3A  2752 	C$main.c$377$2_0$305	= .
                                   2753 	.globl	C$main.c$377$2_0$305
                                   2754 ;..\main.c:377: dpad();
    00000C3A CD BA 02         [24] 2755 	call	_dpad
                         00000A3D  2756 	C$main.c$378$3_0$310	= .
                                   2757 	.globl	C$main.c$378$3_0$310
                                   2758 ;..\main.c:378: if (joypad_input & J_A) {
    00000C3D FA B1 C0         [16] 2759 	ld	a, (_joypad_input)
    00000C40 CB 67            [ 8] 2760 	bit	4, a
    00000C42 CA D8 0C         [16] 2761 	jp	Z, 00189$
                         00000A45  2762 	C$main.c$379$5_0$312	= .
                                   2763 	.globl	C$main.c$379$5_0$312
                                   2764 ;..\main.c:379: if (pieceSelected == false) {
    00000C45 21 DA C0         [12] 2765 	ld	hl, #_pieceSelected
    00000C48 CB 46            [12] 2766 	bit	0, (hl)
    00000C4A C2 D8 0C         [16] 2767 	jp	NZ, 00189$
                         00000A4D  2768 	C$main.c$380$6_0$313	= .
                                   2769 	.globl	C$main.c$380$6_0$313
                                   2770 ;..\main.c:380: checkCollision(cursorx - 4, cursory - 4, currentPlayer);
    00000C4D FA D7 C0         [16] 2771 	ld	a, (_currentPlayer)
    00000C50 4F               [ 4] 2772 	ld	c, a
    00000C51 06 00            [ 8] 2773 	ld	b, #0x00
    00000C53 FA D6 C0         [16] 2774 	ld	a, (_cursory)
    00000C56 C6 FC            [ 8] 2775 	add	a, #0xfc
    00000C58 5F               [ 4] 2776 	ld	e, a
    00000C59 FA D5 C0         [16] 2777 	ld	a, (_cursorx)
    00000C5C C6 FC            [ 8] 2778 	add	a, #0xfc
    00000C5E C5               [16] 2779 	push	bc
    00000C5F CD 5E 07         [24] 2780 	call	_checkCollision
                         00000A62  2781 	C$main.c$382$1_0$304	= .
                                   2782 	.globl	C$main.c$382$1_0$304
                                   2783 ;..\main.c:382: if (selectedPieceIndex >= 4 && selectedPieceIndex < 16){
    00000C62 21 D3 C0         [12] 2784 	ld	hl, #_selectedPieceIndex
    00000C65 2A               [ 8] 2785 	ld	a, (hl+)
    00000C66 D6 10            [ 8] 2786 	sub	a, #0x10
    00000C68 7E               [ 8] 2787 	ld	a, (hl)
    00000C69 DE 00            [ 8] 2788 	sbc	a, #0x00
    00000C6B 56               [ 8] 2789 	ld	d, (hl)
    00000C6C 3E 00            [ 8] 2790 	ld	a, #0x00
    00000C6E CB 7F            [ 8] 2791 	bit	7,a
    00000C70 28 07            [12] 2792 	jr	Z, 00355$
    00000C72 CB 7A            [ 8] 2793 	bit	7, d
    00000C74 20 08            [12] 2794 	jr	NZ, 00356$
    00000C76 BF               [ 4] 2795 	cp	a, a
    00000C77 18 05            [12] 2796 	jr	00356$
    00000C79                       2797 00355$:
    00000C79 CB 7A            [ 8] 2798 	bit	7, d
    00000C7B 28 01            [12] 2799 	jr	Z, 00356$
    00000C7D 37               [ 4] 2800 	scf
    00000C7E                       2801 00356$:
    00000C7E 3E 00            [ 8] 2802 	ld	a, #0x00
    00000C80 17               [ 4] 2803 	rla
    00000C81 4F               [ 4] 2804 	ld	c, a
                         00000A82  2805 	C$main.c$381$7_0$314	= .
                                   2806 	.globl	C$main.c$381$7_0$314
                                   2807 ;..\main.c:381: if (currentPlayer == BLACK_PLAYER) {
    00000C82 FA D7 C0         [16] 2808 	ld	a, (#_currentPlayer)
    00000C85 B7               [ 4] 2809 	or	a, a
    00000C86 20 29            [12] 2810 	jr	NZ, 00113$
                         00000A88  2811 	C$main.c$382$9_0$316	= .
                                   2812 	.globl	C$main.c$382$9_0$316
                                   2813 ;..\main.c:382: if (selectedPieceIndex >= 4 && selectedPieceIndex < 16){
    00000C88 21 D3 C0         [12] 2814 	ld	hl, #_selectedPieceIndex
    00000C8B 2A               [ 8] 2815 	ld	a, (hl+)
    00000C8C D6 04            [ 8] 2816 	sub	a, #0x04
    00000C8E 7E               [ 8] 2817 	ld	a, (hl)
    00000C8F DE 00            [ 8] 2818 	sbc	a, #0x00
    00000C91 56               [ 8] 2819 	ld	d, (hl)
    00000C92 3E 00            [ 8] 2820 	ld	a, #0x00
    00000C94 CB 7F            [ 8] 2821 	bit	7,a
    00000C96 28 07            [12] 2822 	jr	Z, 00357$
    00000C98 CB 7A            [ 8] 2823 	bit	7, d
    00000C9A 20 08            [12] 2824 	jr	NZ, 00358$
    00000C9C BF               [ 4] 2825 	cp	a, a
    00000C9D 18 05            [12] 2826 	jr	00358$
    00000C9F                       2827 00357$:
    00000C9F CB 7A            [ 8] 2828 	bit	7, d
    00000CA1 28 01            [12] 2829 	jr	Z, 00358$
    00000CA3 37               [ 4] 2830 	scf
    00000CA4                       2831 00358$:
    00000CA4 38 32            [12] 2832 	jr	C, 00189$
    00000CA6 79               [ 4] 2833 	ld	a, c
    00000CA7 B7               [ 4] 2834 	or	a, a
    00000CA8 28 2E            [12] 2835 	jr	Z, 00189$
                         00000AAA  2836 	C$main.c$383$10_0$317	= .
                                   2837 	.globl	C$main.c$383$10_0$317
                                   2838 ;..\main.c:383: pieceSelected = true;
    00000CAA 21 DA C0         [12] 2839 	ld	hl, #_pieceSelected
    00000CAD 36 01            [12] 2840 	ld	(hl), #0x01
    00000CAF 18 27            [12] 2841 	jr	00189$
    00000CB1                       2842 00113$:
                         00000AB1  2843 	C$main.c$385$8_0$318	= .
                                   2844 	.globl	C$main.c$385$8_0$318
                                   2845 ;..\main.c:385: } else if (selectedPieceIndex >= 16 && selectedPieceIndex < 28) {
    00000CB1 CB 41            [ 8] 2846 	bit	0, c
    00000CB3 20 23            [12] 2847 	jr	NZ, 00189$
    00000CB5 21 D3 C0         [12] 2848 	ld	hl, #_selectedPieceIndex
    00000CB8 2A               [ 8] 2849 	ld	a, (hl+)
    00000CB9 D6 1C            [ 8] 2850 	sub	a, #0x1c
    00000CBB 7E               [ 8] 2851 	ld	a, (hl)
    00000CBC DE 00            [ 8] 2852 	sbc	a, #0x00
    00000CBE 56               [ 8] 2853 	ld	d, (hl)
    00000CBF 3E 00            [ 8] 2854 	ld	a, #0x00
    00000CC1 CB 7F            [ 8] 2855 	bit	7,a
    00000CC3 28 07            [12] 2856 	jr	Z, 00359$
    00000CC5 CB 7A            [ 8] 2857 	bit	7, d
    00000CC7 20 08            [12] 2858 	jr	NZ, 00360$
    00000CC9 BF               [ 4] 2859 	cp	a, a
    00000CCA 18 05            [12] 2860 	jr	00360$
    00000CCC                       2861 00359$:
    00000CCC CB 7A            [ 8] 2862 	bit	7, d
    00000CCE 28 01            [12] 2863 	jr	Z, 00360$
    00000CD0 37               [ 4] 2864 	scf
    00000CD1                       2865 00360$:
    00000CD1 30 05            [12] 2866 	jr	NC, 00189$
                         00000AD3  2867 	C$main.c$386$9_0$319	= .
                                   2868 	.globl	C$main.c$386$9_0$319
                                   2869 ;..\main.c:386: pieceSelected = true;
    00000CD3 21 DA C0         [12] 2870 	ld	hl, #_pieceSelected
    00000CD6 36 01            [12] 2871 	ld	(hl), #0x01
                         00000AD8  2872 	C$main.c$390$1_0$304	= .
                                   2873 	.globl	C$main.c$390$1_0$304
                                   2874 ;..\main.c:390: while (pieceSelected == true) {
    00000CD8                       2875 00189$:
    00000CD8                       2876 00149$:
    00000CD8 21 DA C0         [12] 2877 	ld	hl, #_pieceSelected
    00000CDB CB 46            [12] 2878 	bit	0, (hl)
    00000CDD CA 2E 10         [16] 2879 	jp	Z, 00151$
                         00000AE0  2880 	C$main.c$391$3_0$320	= .
                                   2881 	.globl	C$main.c$391$3_0$320
                                   2882 ;..\main.c:391: delay(100);
    00000CE0 11 64 00         [12] 2883 	ld	de, #0x0064
    00000CE3 CD E2 20         [24] 2884 	call	_delay
                         00000AE6  2885 	C$main.c$392$3_0$320	= .
                                   2886 	.globl	C$main.c$392$3_0$320
                                   2887 ;..\main.c:392: joypad_input = joypad(); // Update the input inside the loop
    00000CE6 CD 99 1C         [24] 2888 	call	_joypad
    00000CE9 EA B1 C0         [16] 2889 	ld	(#_joypad_input),a
                         00000AEC  2890 	C$main.c$393$3_0$320	= .
                                   2891 	.globl	C$main.c$393$3_0$320
                                   2892 ;..\main.c:393: dpad();
    00000CEC CD BA 02         [24] 2893 	call	_dpad
                                   2894 ;..\main.c:394: move_sprite(selectedPieceIndex, cursorx - 4, cursory - 4);
    00000CEF FA D6 C0         [16] 2895 	ld	a, (_cursory)
    00000CF2 C6 FC            [ 8] 2896 	add	a, #0xfc
    00000CF4 F8 0C            [12] 2897 	ldhl	sp,	#12
    00000CF6 77               [ 8] 2898 	ld	(hl), a
    00000CF7 FA D5 C0         [16] 2899 	ld	a, (#_cursorx)
    00000CFA F8 0F            [12] 2900 	ldhl	sp,	#15
    00000CFC 77               [ 8] 2901 	ld	(hl), a
    00000CFD 3A               [ 8] 2902 	ld	a, (hl-)
    00000CFE 2B               [ 8] 2903 	dec	hl
    00000CFF C6 FC            [ 8] 2904 	add	a, #0xfc
    00000D01 77               [ 8] 2905 	ld	(hl), a
    00000D02 FA D3 C0         [16] 2906 	ld	a, (#_selectedPieceIndex)
    00000D05 F8 0F            [12] 2907 	ldhl	sp,	#15
    00000D07 77               [ 8] 2908 	ld	(hl), a
                                   2909 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
    00000D08 3A               [ 8] 2910 	ld	a, (hl-)
    00000D09 22               [ 8] 2911 	ld	(hl+), a
    00000D0A AF               [ 4] 2912 	xor	a, a
    00000D0B 32               [ 8] 2913 	ld	(hl-), a
    00000D0C 7E               [ 8] 2914 	ld	a, (hl)
    00000D0D F8 0A            [12] 2915 	ldhl	sp,	#10
    00000D0F 22               [ 8] 2916 	ld	(hl+), a
    00000D10 36 00            [12] 2917 	ld	(hl), #0x00
    00000D12 3E 02            [ 8] 2918 	ld	a, #0x02
    00000D14                       2919 00361$:
    00000D14 F8 0A            [12] 2920 	ldhl	sp,	#10
    00000D16 CB 26            [16] 2921 	sla	(hl)
    00000D18 23               [ 8] 2922 	inc	hl
    00000D19 CB 16            [16] 2923 	rl	(hl)
    00000D1B 3D               [ 4] 2924 	dec	a
    00000D1C 20 F6            [12] 2925 	jr	NZ, 00361$
    00000D1E 2B               [ 8] 2926 	dec	hl
    00000D1F 2A               [ 8] 2927 	ld	a, (hl+)
    00000D20 5F               [ 4] 2928 	ld	e, a
    00000D21 56               [ 8] 2929 	ld	d, (hl)
    00000D22 21 00 C0         [12] 2930 	ld	hl, #_shadow_OAM
    00000D25 19               [ 8] 2931 	add	hl, de
    00000D26 E5               [16] 2932 	push	hl
    00000D27 7D               [ 4] 2933 	ld	a, l
    00000D28 F8 10            [12] 2934 	ldhl	sp,	#16
    00000D2A 77               [ 8] 2935 	ld	(hl), a
    00000D2B E1               [12] 2936 	pop	hl
    00000D2C 7C               [ 4] 2937 	ld	a, h
    00000D2D F8 0F            [12] 2938 	ldhl	sp,	#15
                                   2939 ;c:\users\bluej\onedrive\desktop\code projects\vs code\checkers revived i guess\checkers\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
    00000D2F 32               [ 8] 2940 	ld	(hl-), a
    00000D30 2A               [ 8] 2941 	ld	a, (hl+)
    00000D31 5F               [ 4] 2942 	ld	e, a
    00000D32 56               [ 8] 2943 	ld	d, (hl)
    00000D33 F8 0C            [12] 2944 	ldhl	sp,	#12
    00000D35 2A               [ 8] 2945 	ld	a, (hl+)
    00000D36 23               [ 8] 2946 	inc	hl
    00000D37 12               [ 8] 2947 	ld	(de), a
    00000D38 2A               [ 8] 2948 	ld	a, (hl+)
    00000D39 4F               [ 4] 2949 	ld	c, a
    00000D3A 3A               [ 8] 2950 	ld	a, (hl-)
    00000D3B 2B               [ 8] 2951 	dec	hl
    00000D3C 47               [ 4] 2952 	ld	b, a
    00000D3D 03               [ 8] 2953 	inc	bc
    00000D3E 7E               [ 8] 2954 	ld	a, (hl)
    00000D3F 02               [ 8] 2955 	ld	(bc), a
                         00000B40  2956 	C$main.c$395$4_0$321	= .
                                   2957 	.globl	C$main.c$395$4_0$321
                                   2958 ;..\main.c:395: if (joypad_input & J_A) {
    00000D40 FA B1 C0         [16] 2959 	ld	a, (_joypad_input)
    00000D43 CB 67            [ 8] 2960 	bit	4, a
    00000D45 CA 1C 10         [16] 2961 	jp	Z, 00146$
                         00000B48  2962 	C$main.c$396$5_0$322	= .
                                   2963 	.globl	C$main.c$396$5_0$322
                                   2964 ;..\main.c:396: Piece* pieces = (currentPlayer == BLACK_PLAYER) ? blackPieces : whitePieces;
    00000D48 FA D7 C0         [16] 2965 	ld	a, (#_currentPlayer)
    00000D4B B7               [ 4] 2966 	or	a, a
    00000D4C 20 09            [12] 2967 	jr	NZ, 00158$
    00000D4E F8 0E            [12] 2968 	ldhl	sp,	#14
    00000D50 36 43            [12] 2969 	ld	(hl), #<(_blackPieces)
    00000D52 23               [ 8] 2970 	inc	hl
    00000D53 36 C3            [12] 2971 	ld	(hl), #>(_blackPieces)
    00000D55 18 07            [12] 2972 	jr	00159$
    00000D57                       2973 00158$:
    00000D57 F8 0E            [12] 2974 	ldhl	sp,	#14
    00000D59 3E 67            [ 8] 2975 	ld	a, #<(_whitePieces)
    00000D5B 22               [ 8] 2976 	ld	(hl+), a
    00000D5C 36 C3            [12] 2977 	ld	(hl), #>(_whitePieces)
    00000D5E                       2978 00159$:
    00000D5E F8 0E            [12] 2979 	ldhl	sp,	#14
    00000D60 7E               [ 8] 2980 	ld	a, (hl)
    00000D61 F8 00            [12] 2981 	ldhl	sp,	#0
    00000D63 77               [ 8] 2982 	ld	(hl), a
    00000D64 F8 0F            [12] 2983 	ldhl	sp,	#15
    00000D66 7E               [ 8] 2984 	ld	a, (hl)
    00000D67 F8 01            [12] 2985 	ldhl	sp,	#1
    00000D69 77               [ 8] 2986 	ld	(hl), a
                         00000B6A  2987 	C$main.c$397$5_0$322	= .
                                   2988 	.globl	C$main.c$397$5_0$322
                                   2989 ;..\main.c:397: Piece* opponentPieces = (currentPlayer == BLACK_PLAYER) ? whitePieces : blackPieces;
    00000D6A FA D7 C0         [16] 2990 	ld	a, (#_currentPlayer)
    00000D6D B7               [ 4] 2991 	or	a, a
    00000D6E 20 09            [12] 2992 	jr	NZ, 00160$
    00000D70 F8 0E            [12] 2993 	ldhl	sp,	#14
    00000D72 3E 67            [ 8] 2994 	ld	a, #<(_whitePieces)
    00000D74 22               [ 8] 2995 	ld	(hl+), a
    00000D75 36 C3            [12] 2996 	ld	(hl), #>(_whitePieces)
    00000D77 18 07            [12] 2997 	jr	00161$
    00000D79                       2998 00160$:
    00000D79 F8 0E            [12] 2999 	ldhl	sp,	#14
    00000D7B 36 43            [12] 3000 	ld	(hl), #<(_blackPieces)
    00000D7D 23               [ 8] 3001 	inc	hl
    00000D7E 36 C3            [12] 3002 	ld	(hl), #>(_blackPieces)
    00000D80                       3003 00161$:
    00000D80 F8 0E            [12] 3004 	ldhl	sp,	#14
    00000D82 7E               [ 8] 3005 	ld	a, (hl)
    00000D83 F8 02            [12] 3006 	ldhl	sp,	#2
    00000D85 77               [ 8] 3007 	ld	(hl), a
    00000D86 F8 0F            [12] 3008 	ldhl	sp,	#15
    00000D88 7E               [ 8] 3009 	ld	a, (hl)
    00000D89 F8 03            [12] 3010 	ldhl	sp,	#3
    00000D8B 77               [ 8] 3011 	ld	(hl), a
                         00000B8C  3012 	C$main.c$401$5_0$322	= .
                                   3013 	.globl	C$main.c$401$5_0$322
                                   3014 ;..\main.c:401: int dx = (cursorx - 4) - pieces[selectedCoords].x;
    00000D8C FA D5 C0         [16] 3015 	ld	a, (#_cursorx)
    00000D8F F8 0E            [12] 3016 	ldhl	sp,	#14
    00000D91 22               [ 8] 3017 	ld	(hl+), a
    00000D92 AF               [ 4] 3018 	xor	a, a
    00000D93 32               [ 8] 3019 	ld	(hl-), a
    00000D94 2A               [ 8] 3020 	ld	a, (hl+)
    00000D95 5F               [ 4] 3021 	ld	e, a
    00000D96 56               [ 8] 3022 	ld	d, (hl)
    00000D97 21 04 00         [12] 3023 	ld	hl, #0x0004
    00000D9A 7B               [ 4] 3024 	ld	a, e
    00000D9B 95               [ 4] 3025 	sub	a, l
    00000D9C 5F               [ 4] 3026 	ld	e, a
    00000D9D 7A               [ 4] 3027 	ld	a, d
    00000D9E 9C               [ 4] 3028 	sbc	a, h
    00000D9F F8 05            [12] 3029 	ldhl	sp,	#5
    00000DA1 32               [ 8] 3030 	ld	(hl-), a
    00000DA2 73               [ 8] 3031 	ld	(hl), e
    00000DA3 21 D8 C0         [12] 3032 	ld	hl, #_selectedCoords
    00000DA6 2A               [ 8] 3033 	ld	a, (hl+)
    00000DA7 4F               [ 4] 3034 	ld	c, a
    00000DA8 46               [ 8] 3035 	ld	b, (hl)
    00000DA9 69               [ 4] 3036 	ld	l, c
    00000DAA 60               [ 4] 3037 	ld	h, b
    00000DAB 29               [ 8] 3038 	add	hl, hl
    00000DAC 09               [ 8] 3039 	add	hl, bc
    00000DAD E5               [16] 3040 	push	hl
    00000DAE 7D               [ 4] 3041 	ld	a, l
    00000DAF F8 10            [12] 3042 	ldhl	sp,	#16
    00000DB1 77               [ 8] 3043 	ld	(hl), a
    00000DB2 E1               [12] 3044 	pop	hl
    00000DB3 7C               [ 4] 3045 	ld	a, h
    00000DB4 F8 0F            [12] 3046 	ldhl	sp,	#15
    00000DB6 77               [ 8] 3047 	ld	(hl), a
    00000DB7 D1               [12] 3048 	pop	de
    00000DB8 D5               [16] 3049 	push	de
    00000DB9 3A               [ 8] 3050 	ld	a, (hl-)
    00000DBA 6E               [ 8] 3051 	ld	l, (hl)
    00000DBB 67               [ 4] 3052 	ld	h, a
    00000DBC 19               [ 8] 3053 	add	hl, de
    00000DBD E5               [16] 3054 	push	hl
    00000DBE 7D               [ 4] 3055 	ld	a, l
    00000DBF F8 0E            [12] 3056 	ldhl	sp,	#14
    00000DC1 77               [ 8] 3057 	ld	(hl), a
    00000DC2 E1               [12] 3058 	pop	hl
    00000DC3 7C               [ 4] 3059 	ld	a, h
    00000DC4 F8 0D            [12] 3060 	ldhl	sp,	#13
    00000DC6 32               [ 8] 3061 	ld	(hl-), a
    00000DC7 2A               [ 8] 3062 	ld	a, (hl+)
    00000DC8 5F               [ 4] 3063 	ld	e, a
    00000DC9 2A               [ 8] 3064 	ld	a, (hl+)
    00000DCA 23               [ 8] 3065 	inc	hl
    00000DCB 57               [ 4] 3066 	ld	d, a
    00000DCC 1A               [ 8] 3067 	ld	a, (de)
    00000DCD 77               [ 8] 3068 	ld	(hl), a
    00000DCE 7E               [ 8] 3069 	ld	a, (hl)
    00000DCF F8 06            [12] 3070 	ldhl	sp,	#6
    00000DD1 22               [ 8] 3071 	ld	(hl+), a
    00000DD2 AF               [ 4] 3072 	xor	a, a
    00000DD3 32               [ 8] 3073 	ld	(hl-), a
    00000DD4 2B               [ 8] 3074 	dec	hl
    00000DD5 2B               [ 8] 3075 	dec	hl
    00000DD6 2A               [ 8] 3076 	ld	a, (hl+)
    00000DD7 5F               [ 4] 3077 	ld	e, a
    00000DD8 2A               [ 8] 3078 	ld	a, (hl+)
    00000DD9 57               [ 4] 3079 	ld	d, a
    00000DDA 2A               [ 8] 3080 	ld	a,	(hl+)
    00000DDB 66               [ 8] 3081 	ld	h, (hl)
    00000DDC 6F               [ 4] 3082 	ld	l, a
    00000DDD 7B               [ 4] 3083 	ld	a, e
    00000DDE 95               [ 4] 3084 	sub	a, l
    00000DDF 5F               [ 4] 3085 	ld	e, a
    00000DE0 7A               [ 4] 3086 	ld	a, d
    00000DE1 9C               [ 4] 3087 	sbc	a, h
    00000DE2 F8 09            [12] 3088 	ldhl	sp,	#9
    00000DE4 32               [ 8] 3089 	ld	(hl-), a
    00000DE5 73               [ 8] 3090 	ld	(hl), e
                         00000BE6  3091 	C$main.c$402$5_0$322	= .
                                   3092 	.globl	C$main.c$402$5_0$322
                                   3093 ;..\main.c:402: int dy = (cursory - 4) - pieces[selectedCoords].y;
    00000DE6 FA D6 C0         [16] 3094 	ld	a, (#_cursory)
    00000DE9 F8 0E            [12] 3095 	ldhl	sp,	#14
    00000DEB 22               [ 8] 3096 	ld	(hl+), a
    00000DEC AF               [ 4] 3097 	xor	a, a
    00000DED 32               [ 8] 3098 	ld	(hl-), a
    00000DEE 2A               [ 8] 3099 	ld	a, (hl+)
    00000DEF 5F               [ 4] 3100 	ld	e, a
    00000DF0 56               [ 8] 3101 	ld	d, (hl)
    00000DF1 21 04 00         [12] 3102 	ld	hl, #0x0004
    00000DF4 7B               [ 4] 3103 	ld	a, e
    00000DF5 95               [ 4] 3104 	sub	a, l
    00000DF6 5F               [ 4] 3105 	ld	e, a
    00000DF7 7A               [ 4] 3106 	ld	a, d
    00000DF8 9C               [ 4] 3107 	sbc	a, h
    00000DF9 F8 0B            [12] 3108 	ldhl	sp,	#11
    00000DFB 32               [ 8] 3109 	ld	(hl-), a
    00000DFC 73               [ 8] 3110 	ld	(hl), e
    00000DFD F8 0C            [12] 3111 	ldhl	sp,#12
    00000DFF 2A               [ 8] 3112 	ld	a, (hl+)
    00000E00 5F               [ 4] 3113 	ld	e, a
    00000E01 56               [ 8] 3114 	ld	d, (hl)
    00000E02 6B               [ 4] 3115 	ld	l, e
    00000E03 62               [ 4] 3116 	ld	h, d
    00000E04 23               [ 8] 3117 	inc	hl
    00000E05 E5               [16] 3118 	push	hl
    00000E06 7D               [ 4] 3119 	ld	a, l
    00000E07 F8 10            [12] 3120 	ldhl	sp,	#16
    00000E09 77               [ 8] 3121 	ld	(hl), a
    00000E0A E1               [12] 3122 	pop	hl
    00000E0B 7C               [ 4] 3123 	ld	a, h
    00000E0C F8 0F            [12] 3124 	ldhl	sp,	#15
    00000E0E 32               [ 8] 3125 	ld	(hl-), a
    00000E0F 2A               [ 8] 3126 	ld	a, (hl+)
    00000E10 5F               [ 4] 3127 	ld	e, a
    00000E11 56               [ 8] 3128 	ld	d, (hl)
    00000E12 1A               [ 8] 3129 	ld	a, (de)
    00000E13 77               [ 8] 3130 	ld	(hl), a
    00000E14 7E               [ 8] 3131 	ld	a, (hl)
    00000E15 F8 0C            [12] 3132 	ldhl	sp,	#12
    00000E17 22               [ 8] 3133 	ld	(hl+), a
    00000E18 AF               [ 4] 3134 	xor	a, a
    00000E19 32               [ 8] 3135 	ld	(hl-), a
    00000E1A 2B               [ 8] 3136 	dec	hl
    00000E1B 2B               [ 8] 3137 	dec	hl
    00000E1C 2A               [ 8] 3138 	ld	a, (hl+)
    00000E1D 5F               [ 4] 3139 	ld	e, a
    00000E1E 2A               [ 8] 3140 	ld	a, (hl+)
    00000E1F 57               [ 4] 3141 	ld	d, a
    00000E20 2A               [ 8] 3142 	ld	a,	(hl+)
    00000E21 66               [ 8] 3143 	ld	h, (hl)
    00000E22 6F               [ 4] 3144 	ld	l, a
    00000E23 7B               [ 4] 3145 	ld	a, e
    00000E24 95               [ 4] 3146 	sub	a, l
    00000E25 5F               [ 4] 3147 	ld	e, a
    00000E26 7A               [ 4] 3148 	ld	a, d
    00000E27 9C               [ 4] 3149 	sbc	a, h
    00000E28 F8 0F            [12] 3150 	ldhl	sp,	#15
    00000E2A 32               [ 8] 3151 	ld	(hl-), a
    00000E2B 73               [ 8] 3152 	ld	(hl), e
                         00000C2C  3153 	C$main.c$403$6_0$323	= .
                                   3154 	.globl	C$main.c$403$6_0$323
                                   3155 ;..\main.c:403: if (cursorx - 4 == pieces[selectedCoords].x && cursory - 4 == pieces[selectedCoords].y) {
    00000E2C F8 04            [12] 3156 	ldhl	sp,	#4
    00000E2E 2A               [ 8] 3157 	ld	a, (hl+)
    00000E2F 23               [ 8] 3158 	inc	hl
    00000E30 96               [ 8] 3159 	sub	a, (hl)
    00000E31 20 14            [12] 3160 	jr	NZ, 00142$
    00000E33 2B               [ 8] 3161 	dec	hl
    00000E34 2A               [ 8] 3162 	ld	a, (hl+)
    00000E35 23               [ 8] 3163 	inc	hl
    00000E36 96               [ 8] 3164 	sub	a, (hl)
    00000E37 20 0E            [12] 3165 	jr	NZ, 00142$
    00000E39 F8 0A            [12] 3166 	ldhl	sp,	#10
    00000E3B 2A               [ 8] 3167 	ld	a, (hl+)
    00000E3C 23               [ 8] 3168 	inc	hl
    00000E3D 96               [ 8] 3169 	sub	a, (hl)
    00000E3E 20 07            [12] 3170 	jr	NZ, 00365$
    00000E40 2B               [ 8] 3171 	dec	hl
    00000E41 2A               [ 8] 3172 	ld	a, (hl+)
    00000E42 23               [ 8] 3173 	inc	hl
    00000E43 96               [ 8] 3174 	sub	a, (hl)
    00000E44 CA 1C 10         [16] 3175 	jp	Z, 00146$
    00000E47                       3176 00365$:
    00000E47                       3177 00142$:
                         00000C47  3178 	C$main.c$405$7_0$325	= .
                                   3179 	.globl	C$main.c$405$7_0$325
                                   3180 ;..\main.c:405: } else if (isValidMove(cursorx - 4, cursory - 4, currentPlayer, selectedCoords)) {
    00000E47 FA D6 C0         [16] 3181 	ld	a, (_cursory)
    00000E4A C6 FC            [ 8] 3182 	add	a, #0xfc
    00000E4C 5F               [ 4] 3183 	ld	e, a
    00000E4D FA D5 C0         [16] 3184 	ld	a, (_cursorx)
    00000E50 C6 FC            [ 8] 3185 	add	a, #0xfc
    00000E52 21 D8 C0         [12] 3186 	ld	hl, #_selectedCoords
    00000E55 4E               [ 8] 3187 	ld	c, (hl)
    00000E56 23               [ 8] 3188 	inc	hl
    00000E57 46               [ 8] 3189 	ld	b, (hl)
    00000E58 C5               [16] 3190 	push	bc
    00000E59 21 D7 C0         [12] 3191 	ld	hl, #_currentPlayer
    00000E5C 66               [ 8] 3192 	ld	h, (hl)
    00000E5D E5               [16] 3193 	push	hl
    00000E5E 33               [ 8] 3194 	inc	sp
    00000E5F CD BA 05         [24] 3195 	call	_isValidMove
    00000E62 CB 47            [ 8] 3196 	bit	0,a
    00000E64 CA 1C 10         [16] 3197 	jp	Z, 00146$
                         00000C67  3198 	C$main.c$406$9_0$327	= .
                                   3199 	.globl	C$main.c$406$9_0$327
                                   3200 ;..\main.c:406: if (hasValidCaptureMoves(currentPlayer)) {
    00000E67 FA D7 C0         [16] 3201 	ld	a, (_currentPlayer)
    00000E6A CD 03 08         [24] 3202 	call	_hasValidCaptureMoves
    00000E6D CB 47            [ 8] 3203 	bit	0,a
    00000E6F CA 5B 0F         [16] 3204 	jp	Z, 00137$
                         00000C72  3205 	C$main.c$407$11_0$329	= .
                                   3206 	.globl	C$main.c$407$11_0$329
                                   3207 ;..\main.c:407: if (abs(dx) == 2 * SQUARE_SIZE || abs(dy) == 2 * SQUARE_SIZE) {
    00000E72 F8 08            [12] 3208 	ldhl	sp,	#8
    00000E74 2A               [ 8] 3209 	ld	a, (hl+)
    00000E75 5F               [ 4] 3210 	ld	e, a
    00000E76 56               [ 8] 3211 	ld	d, (hl)
    00000E77 CD 29 13         [24] 3212 	call	_abs
    00000E7A 79               [ 4] 3213 	ld	a, c
    00000E7B D6 20            [ 8] 3214 	sub	a, #0x20
    00000E7D B0               [ 4] 3215 	or	a, b
    00000E7E 28 0F            [12] 3216 	jr	Z, 00127$
    00000E80 F8 0E            [12] 3217 	ldhl	sp,	#14
    00000E82 2A               [ 8] 3218 	ld	a, (hl+)
    00000E83 5F               [ 4] 3219 	ld	e, a
    00000E84 56               [ 8] 3220 	ld	d, (hl)
    00000E85 CD 29 13         [24] 3221 	call	_abs
    00000E88 79               [ 4] 3222 	ld	a, c
    00000E89 D6 20            [ 8] 3223 	sub	a, #0x20
    00000E8B B0               [ 4] 3224 	or	a, b
    00000E8C C2 1C 10         [16] 3225 	jp	NZ, 00146$
    00000E8F                       3226 00127$:
                         00000C8F  3227 	C$main.c$408$12_0$330	= .
                                   3228 	.globl	C$main.c$408$12_0$330
                                   3229 ;..\main.c:408: int capturedIndex = getCaptureIndex(((cursorx - 4) - (dx/2)), ((cursory - 4) - (dy/2)), opponentPieces, numOpponentPieces);
    00000E8F FA D6 C0         [16] 3230 	ld	a, (_cursory)
    00000E92 C6 FC            [ 8] 3231 	add	a, #0xfc
    00000E94 F8 0D            [12] 3232 	ldhl	sp,	#13
    00000E96 22               [ 8] 3233 	ld	(hl+), a
    00000E97 2A               [ 8] 3234 	ld	a, (hl+)
    00000E98 4F               [ 4] 3235 	ld	c, a
    00000E99 46               [ 8] 3236 	ld	b, (hl)
    00000E9A CB 7E            [12] 3237 	bit	7, (hl)
    00000E9C 28 05            [12] 3238 	jr	Z, 00162$
    00000E9E 2B               [ 8] 3239 	dec	hl
    00000E9F 2A               [ 8] 3240 	ld	a, (hl+)
    00000EA0 4F               [ 4] 3241 	ld	c, a
    00000EA1 46               [ 8] 3242 	ld	b, (hl)
    00000EA2 03               [ 8] 3243 	inc	bc
    00000EA3                       3244 00162$:
    00000EA3 CB 28            [ 8] 3245 	sra	b
    00000EA5 CB 19            [ 8] 3246 	rr	c
    00000EA7 F8 0D            [12] 3247 	ldhl	sp,	#13
    00000EA9 2A               [ 8] 3248 	ld	a, (hl+)
    00000EAA 23               [ 8] 3249 	inc	hl
    00000EAB 91               [ 4] 3250 	sub	a, c
    00000EAC 32               [ 8] 3251 	ld	(hl-), a
    00000EAD FA D5 C0         [16] 3252 	ld	a, (_cursorx)
    00000EB0 C6 FC            [ 8] 3253 	add	a, #0xfc
    00000EB2 77               [ 8] 3254 	ld	(hl), a
    00000EB3 F8 08            [12] 3255 	ldhl	sp,	#8
    00000EB5 2A               [ 8] 3256 	ld	a, (hl+)
    00000EB6 4F               [ 4] 3257 	ld	c, a
    00000EB7 46               [ 8] 3258 	ld	b, (hl)
    00000EB8 CB 7E            [12] 3259 	bit	7, (hl)
    00000EBA 28 05            [12] 3260 	jr	Z, 00163$
    00000EBC 2B               [ 8] 3261 	dec	hl
    00000EBD 2A               [ 8] 3262 	ld	a, (hl+)
    00000EBE 4F               [ 4] 3263 	ld	c, a
    00000EBF 46               [ 8] 3264 	ld	b, (hl)
    00000EC0 03               [ 8] 3265 	inc	bc
    00000EC1                       3266 00163$:
    00000EC1 CB 28            [ 8] 3267 	sra	b
    00000EC3 CB 19            [ 8] 3268 	rr	c
    00000EC5 F8 0E            [12] 3269 	ldhl	sp,	#14
    00000EC7 7E               [ 8] 3270 	ld	a, (hl)
    00000EC8 91               [ 4] 3271 	sub	a, c
    00000EC9 11 0C 00         [12] 3272 	ld	de, #0x000c
    00000ECC D5               [16] 3273 	push	de
    00000ECD F8 04            [12] 3274 	ldhl	sp,	#4
    00000ECF 5E               [ 8] 3275 	ld	e, (hl)
    00000ED0 23               [ 8] 3276 	inc	hl
    00000ED1 56               [ 8] 3277 	ld	d, (hl)
    00000ED2 D5               [16] 3278 	push	de
    00000ED3 F8 13            [12] 3279 	ldhl	sp,	#19
    00000ED5 5E               [ 8] 3280 	ld	e, (hl)
    00000ED6 CD 54 05         [24] 3281 	call	_getCaptureIndex
                         00000CD9  3282 	C$main.c$409$13_0$331	= .
                                   3283 	.globl	C$main.c$409$13_0$331
                                   3284 ;..\main.c:409: if (capturedIndex != -1) {
    00000ED9 79               [ 4] 3285 	ld	a, c
    00000EDA A0               [ 4] 3286 	and	a, b
    00000EDB 3C               [ 4] 3287 	inc	a
    00000EDC CA 1C 10         [16] 3288 	jp	Z, 00146$
                         00000CDF  3289 	C$main.c$410$14_0$332	= .
                                   3290 	.globl	C$main.c$410$14_0$332
                                   3291 ;..\main.c:410: opponentPieces[capturedIndex].x = 0;
    00000EDF 69               [ 4] 3292 	ld	l, c
    00000EE0 60               [ 4] 3293 	ld	h, b
    00000EE1 29               [ 8] 3294 	add	hl, hl
    00000EE2 09               [ 8] 3295 	add	hl, bc
    00000EE3 4D               [ 4] 3296 	ld	c, l
    00000EE4 44               [ 4] 3297 	ld	b, h
    00000EE5 F8 02            [12] 3298 	ldhl	sp,	#2
    00000EE7 2A               [ 8] 3299 	ld	a,	(hl+)
    00000EE8 66               [ 8] 3300 	ld	h, (hl)
    00000EE9 6F               [ 4] 3301 	ld	l, a
    00000EEA 09               [ 8] 3302 	add	hl, bc
    00000EEB 4D               [ 4] 3303 	ld	c, l
    00000EEC 44               [ 4] 3304 	ld	b, h
    00000EED AF               [ 4] 3305 	xor	a, a
    00000EEE 02               [ 8] 3306 	ld	(bc), a
                         00000CEF  3307 	C$main.c$411$14_0$332	= .
                                   3308 	.globl	C$main.c$411$14_0$332
                                   3309 ;..\main.c:411: opponentPieces[capturedIndex].y = 0;
    00000EEF 03               [ 8] 3310 	inc	bc
    00000EF0 AF               [ 4] 3311 	xor	a, a
    00000EF1 02               [ 8] 3312 	ld	(bc), a
                         00000CF2  3313 	C$main.c$412$14_0$332	= .
                                   3314 	.globl	C$main.c$412$14_0$332
                                   3315 ;..\main.c:412: pieces[selectedCoords].x = cursorx - 4; 
    00000EF2 21 D8 C0         [12] 3316 	ld	hl, #_selectedCoords
    00000EF5 2A               [ 8] 3317 	ld	a, (hl+)
    00000EF6 4F               [ 4] 3318 	ld	c, a
    00000EF7 46               [ 8] 3319 	ld	b, (hl)
    00000EF8 69               [ 4] 3320 	ld	l, c
    00000EF9 60               [ 4] 3321 	ld	h, b
    00000EFA 29               [ 8] 3322 	add	hl, hl
    00000EFB 09               [ 8] 3323 	add	hl, bc
    00000EFC 4D               [ 4] 3324 	ld	c, l
    00000EFD 44               [ 4] 3325 	ld	b, h
    00000EFE E1               [12] 3326 	pop	hl
    00000EFF E5               [16] 3327 	push	hl
    00000F00 09               [ 8] 3328 	add	hl, bc
    00000F01 4D               [ 4] 3329 	ld	c, l
    00000F02 44               [ 4] 3330 	ld	b, h
    00000F03 FA D5 C0         [16] 3331 	ld	a, (_cursorx)
    00000F06 C6 FC            [ 8] 3332 	add	a, #0xfc
    00000F08 02               [ 8] 3333 	ld	(bc), a
                         00000D09  3334 	C$main.c$413$14_0$332	= .
                                   3335 	.globl	C$main.c$413$14_0$332
                                   3336 ;..\main.c:413: pieces[selectedCoords].y = cursory - 4;
    00000F09 21 D8 C0         [12] 3337 	ld	hl, #_selectedCoords
    00000F0C 2A               [ 8] 3338 	ld	a, (hl+)
    00000F0D 4F               [ 4] 3339 	ld	c, a
    00000F0E 46               [ 8] 3340 	ld	b, (hl)
    00000F0F 69               [ 4] 3341 	ld	l, c
    00000F10 60               [ 4] 3342 	ld	h, b
    00000F11 29               [ 8] 3343 	add	hl, hl
    00000F12 09               [ 8] 3344 	add	hl, bc
    00000F13 4D               [ 4] 3345 	ld	c, l
    00000F14 44               [ 4] 3346 	ld	b, h
    00000F15 E1               [12] 3347 	pop	hl
    00000F16 E5               [16] 3348 	push	hl
    00000F17 09               [ 8] 3349 	add	hl, bc
    00000F18 23               [ 8] 3350 	inc	hl
    00000F19 4D               [ 4] 3351 	ld	c, l
    00000F1A 44               [ 4] 3352 	ld	b, h
    00000F1B FA D6 C0         [16] 3353 	ld	a, (_cursory)
    00000F1E C6 FC            [ 8] 3354 	add	a, #0xfc
    00000F20 02               [ 8] 3355 	ld	(bc), a
                         00000D21  3356 	C$main.c$414$14_0$332	= .
                                   3357 	.globl	C$main.c$414$14_0$332
                                   3358 ;..\main.c:414: promoteToKing(pieces, numPieces, currentPlayer);
    00000F21 FA D7 C0         [16] 3359 	ld	a, (_currentPlayer)
    00000F24 F5               [16] 3360 	push	af
    00000F25 33               [ 8] 3361 	inc	sp
    00000F26 01 0C 00         [12] 3362 	ld	bc, #0x000c
    00000F29 F8 01            [12] 3363 	ldhl	sp,	#1
    00000F2B 2A               [ 8] 3364 	ld	a, (hl+)
    00000F2C 5F               [ 4] 3365 	ld	e, a
    00000F2D 56               [ 8] 3366 	ld	d, (hl)
    00000F2E CD 41 02         [24] 3367 	call	_promoteToKing
                         00000D31  3368 	C$main.c$415$14_0$332	= .
                                   3369 	.globl	C$main.c$415$14_0$332
                                   3370 ;..\main.c:415: printBlack();
    00000F31 CD 85 03         [24] 3371 	call	_printBlack
                         00000D34  3372 	C$main.c$416$14_0$332	= .
                                   3373 	.globl	C$main.c$416$14_0$332
                                   3374 ;..\main.c:416: printWhite();
    00000F34 CD 61 04         [24] 3375 	call	_printWhite
                         00000D37  3376 	C$main.c$417$15_0$333	= .
                                   3377 	.globl	C$main.c$417$15_0$333
                                   3378 ;..\main.c:417: if (hasValidCaptureMoves(currentPlayer)) {
    00000F37 FA D7 C0         [16] 3379 	ld	a, (_currentPlayer)
    00000F3A CD 03 08         [24] 3380 	call	_hasValidCaptureMoves
    00000F3D CB 47            [ 8] 3381 	bit	0,a
    00000F3F C2 1C 10         [16] 3382 	jp	NZ, 00146$
                         00000D42  3383 	C$main.c$420$17_0$336	= .
                                   3384 	.globl	C$main.c$420$17_0$336
                                   3385 ;..\main.c:420: if (currentPlayer == BLACK_PLAYER) {
    00000F42 21 D7 C0         [12] 3386 	ld	hl, #_currentPlayer
    00000F45 7E               [ 8] 3387 	ld	a, (hl)
    00000F46 B7               [ 4] 3388 	or	a, a
    00000F47 20 04            [12] 3389 	jr	NZ, 00120$
                         00000D49  3390 	C$main.c$421$18_0$337	= .
                                   3391 	.globl	C$main.c$421$18_0$337
                                   3392 ;..\main.c:421: currentPlayer = WHITE_PLAYER;
    00000F49 36 01            [12] 3393 	ld	(hl), #0x01
    00000F4B 18 04            [12] 3394 	jr	00121$
    00000F4D                       3395 00120$:
                         00000D4D  3396 	C$main.c$423$18_0$338	= .
                                   3397 	.globl	C$main.c$423$18_0$338
                                   3398 ;..\main.c:423: currentPlayer = BLACK_PLAYER;
    00000F4D AF               [ 4] 3399 	xor	a, a
    00000F4E EA D7 C0         [16] 3400 	ld	(#_currentPlayer),a
    00000F51                       3401 00121$:
                         00000D51  3402 	C$main.c$425$16_0$335	= .
                                   3403 	.globl	C$main.c$425$16_0$335
                                   3404 ;..\main.c:425: printTurn();
    00000F51 CD 61 0B         [24] 3405 	call	_printTurn
                         00000D54  3406 	C$main.c$426$16_0$335	= .
                                   3407 	.globl	C$main.c$426$16_0$335
                                   3408 ;..\main.c:426: pieceSelected = false;
    00000F54 AF               [ 4] 3409 	xor	a, a
    00000F55 EA DA C0         [16] 3410 	ld	(#_pieceSelected),a
                         00000D58  3411 	C$main.c$427$16_0$335	= .
                                   3412 	.globl	C$main.c$427$16_0$335
                                   3413 ;..\main.c:427: break; // Exit the loop after a piece has been moved
    00000F58 C3 2E 10         [16] 3414 	jp	00151$
    00000F5B                       3415 00137$:
                         00000D5B  3416 	C$main.c$431$10_0$339	= .
                                   3417 	.globl	C$main.c$431$10_0$339
                                   3418 ;..\main.c:431: } else if (abs(dx) == 1 * SQUARE_SIZE || abs(dy) == 1 * SQUARE_SIZE) {
    00000F5B F8 08            [12] 3419 	ldhl	sp,	#8
    00000F5D 2A               [ 8] 3420 	ld	a, (hl+)
    00000F5E 5F               [ 4] 3421 	ld	e, a
    00000F5F 56               [ 8] 3422 	ld	d, (hl)
    00000F60 CD 29 13         [24] 3423 	call	_abs
    00000F63 79               [ 4] 3424 	ld	a, c
    00000F64 D6 10            [ 8] 3425 	sub	a, #0x10
    00000F66 B0               [ 4] 3426 	or	a, b
    00000F67 28 0F            [12] 3427 	jr	Z, 00133$
    00000F69 F8 0E            [12] 3428 	ldhl	sp,	#14
    00000F6B 2A               [ 8] 3429 	ld	a, (hl+)
    00000F6C 5F               [ 4] 3430 	ld	e, a
    00000F6D 56               [ 8] 3431 	ld	d, (hl)
    00000F6E CD 29 13         [24] 3432 	call	_abs
    00000F71 79               [ 4] 3433 	ld	a, c
    00000F72 D6 10            [ 8] 3434 	sub	a, #0x10
    00000F74 B0               [ 4] 3435 	or	a, b
    00000F75 C2 1C 10         [16] 3436 	jp	NZ, 00146$
    00000F78                       3437 00133$:
                         00000D78  3438 	C$main.c$432$11_0$340	= .
                                   3439 	.globl	C$main.c$432$11_0$340
                                   3440 ;..\main.c:432: pieces[selectedCoords].x = cursorx - 4; 
    00000F78 21 D8 C0         [12] 3441 	ld	hl, #_selectedCoords
    00000F7B 2A               [ 8] 3442 	ld	a, (hl+)
    00000F7C 4F               [ 4] 3443 	ld	c, a
    00000F7D 46               [ 8] 3444 	ld	b, (hl)
    00000F7E 69               [ 4] 3445 	ld	l, c
    00000F7F 60               [ 4] 3446 	ld	h, b
    00000F80 29               [ 8] 3447 	add	hl, hl
    00000F81 09               [ 8] 3448 	add	hl, bc
    00000F82 E5               [16] 3449 	push	hl
    00000F83 7D               [ 4] 3450 	ld	a, l
    00000F84 F8 0D            [12] 3451 	ldhl	sp,	#13
    00000F86 77               [ 8] 3452 	ld	(hl), a
    00000F87 E1               [12] 3453 	pop	hl
    00000F88 7C               [ 4] 3454 	ld	a, h
    00000F89 F8 0C            [12] 3455 	ldhl	sp,	#12
    00000F8B 32               [ 8] 3456 	ld	(hl-), a
    00000F8C 2A               [ 8] 3457 	ld	a, (hl+)
    00000F8D 5F               [ 4] 3458 	ld	e, a
    00000F8E 56               [ 8] 3459 	ld	d, (hl)
    00000F8F E1               [12] 3460 	pop	hl
    00000F90 E5               [16] 3461 	push	hl
    00000F91 19               [ 8] 3462 	add	hl, de
    00000F92 E5               [16] 3463 	push	hl
    00000F93 7D               [ 4] 3464 	ld	a, l
    00000F94 F8 0F            [12] 3465 	ldhl	sp,	#15
    00000F96 77               [ 8] 3466 	ld	(hl), a
    00000F97 E1               [12] 3467 	pop	hl
    00000F98 7C               [ 4] 3468 	ld	a, h
    00000F99 F8 0E            [12] 3469 	ldhl	sp,	#14
    00000F9B 77               [ 8] 3470 	ld	(hl), a
    00000F9C FA D5 C0         [16] 3471 	ld	a, (#_cursorx)
    00000F9F F8 0F            [12] 3472 	ldhl	sp,	#15
    00000FA1 77               [ 8] 3473 	ld	(hl), a
    00000FA2 3A               [ 8] 3474 	ld	a, (hl-)
    00000FA3 2B               [ 8] 3475 	dec	hl
    00000FA4 C6 FC            [ 8] 3476 	add	a, #0xfc
    00000FA6 5E               [ 8] 3477 	ld	e, (hl)
    00000FA7 23               [ 8] 3478 	inc	hl
    00000FA8 66               [ 8] 3479 	ld	h, (hl)
    00000FA9 6B               [ 4] 3480 	ld	l, e
    00000FAA 77               [ 8] 3481 	ld	(hl), a
                         00000DAB  3482 	C$main.c$433$11_0$340	= .
                                   3483 	.globl	C$main.c$433$11_0$340
                                   3484 ;..\main.c:433: pieces[selectedCoords].y = cursory - 4;
    00000FAB 21 D8 C0         [12] 3485 	ld	hl, #_selectedCoords
    00000FAE 2A               [ 8] 3486 	ld	a, (hl+)
    00000FAF 4F               [ 4] 3487 	ld	c, a
    00000FB0 46               [ 8] 3488 	ld	b, (hl)
    00000FB1 69               [ 4] 3489 	ld	l, c
    00000FB2 60               [ 4] 3490 	ld	h, b
    00000FB3 29               [ 8] 3491 	add	hl, hl
    00000FB4 09               [ 8] 3492 	add	hl, bc
    00000FB5 E5               [16] 3493 	push	hl
    00000FB6 7D               [ 4] 3494 	ld	a, l
    00000FB7 F8 10            [12] 3495 	ldhl	sp,	#16
    00000FB9 77               [ 8] 3496 	ld	(hl), a
    00000FBA E1               [12] 3497 	pop	hl
    00000FBB 7C               [ 4] 3498 	ld	a, h
    00000FBC F8 0F            [12] 3499 	ldhl	sp,	#15
    00000FBE 32               [ 8] 3500 	ld	(hl-), a
    00000FBF 2A               [ 8] 3501 	ld	a, (hl+)
    00000FC0 5F               [ 4] 3502 	ld	e, a
    00000FC1 56               [ 8] 3503 	ld	d, (hl)
    00000FC2 E1               [12] 3504 	pop	hl
    00000FC3 E5               [16] 3505 	push	hl
    00000FC4 19               [ 8] 3506 	add	hl, de
    00000FC5 E5               [16] 3507 	push	hl
    00000FC6 7D               [ 4] 3508 	ld	a, l
    00000FC7 F8 0D            [12] 3509 	ldhl	sp,	#13
    00000FC9 77               [ 8] 3510 	ld	(hl), a
    00000FCA E1               [12] 3511 	pop	hl
    00000FCB 7C               [ 4] 3512 	ld	a, h
    00000FCC F8 0C            [12] 3513 	ldhl	sp,	#12
    00000FCE 32               [ 8] 3514 	ld	(hl-), a
    00000FCF 2A               [ 8] 3515 	ld	a, (hl+)
    00000FD0 5F               [ 4] 3516 	ld	e, a
    00000FD1 56               [ 8] 3517 	ld	d, (hl)
    00000FD2 6B               [ 4] 3518 	ld	l, e
    00000FD3 62               [ 4] 3519 	ld	h, d
    00000FD4 23               [ 8] 3520 	inc	hl
    00000FD5 E5               [16] 3521 	push	hl
    00000FD6 7D               [ 4] 3522 	ld	a, l
    00000FD7 F8 0F            [12] 3523 	ldhl	sp,	#15
    00000FD9 77               [ 8] 3524 	ld	(hl), a
    00000FDA E1               [12] 3525 	pop	hl
    00000FDB 7C               [ 4] 3526 	ld	a, h
    00000FDC F8 0E            [12] 3527 	ldhl	sp,	#14
    00000FDE 77               [ 8] 3528 	ld	(hl), a
    00000FDF FA D6 C0         [16] 3529 	ld	a, (#_cursory)
    00000FE2 F8 0F            [12] 3530 	ldhl	sp,	#15
    00000FE4 77               [ 8] 3531 	ld	(hl), a
    00000FE5 3A               [ 8] 3532 	ld	a, (hl-)
    00000FE6 2B               [ 8] 3533 	dec	hl
    00000FE7 C6 FC            [ 8] 3534 	add	a, #0xfc
    00000FE9 5E               [ 8] 3535 	ld	e, (hl)
    00000FEA 23               [ 8] 3536 	inc	hl
    00000FEB 66               [ 8] 3537 	ld	h, (hl)
    00000FEC 6B               [ 4] 3538 	ld	l, e
    00000FED 77               [ 8] 3539 	ld	(hl), a
                         00000DEE  3540 	C$main.c$434$11_0$340	= .
                                   3541 	.globl	C$main.c$434$11_0$340
                                   3542 ;..\main.c:434: promoteToKing(pieces, numPieces, currentPlayer);
    00000FEE FA D7 C0         [16] 3543 	ld	a, (_currentPlayer)
    00000FF1 F5               [16] 3544 	push	af
    00000FF2 33               [ 8] 3545 	inc	sp
    00000FF3 01 0C 00         [12] 3546 	ld	bc, #0x000c
    00000FF6 F8 01            [12] 3547 	ldhl	sp,	#1
    00000FF8 2A               [ 8] 3548 	ld	a, (hl+)
    00000FF9 5F               [ 4] 3549 	ld	e, a
    00000FFA 56               [ 8] 3550 	ld	d, (hl)
    00000FFB CD 41 02         [24] 3551 	call	_promoteToKing
                         00000DFE  3552 	C$main.c$435$12_0$341	= .
                                   3553 	.globl	C$main.c$435$12_0$341
                                   3554 ;..\main.c:435: if (currentPlayer == BLACK_PLAYER) {
    00000FFE 21 D7 C0         [12] 3555 	ld	hl, #_currentPlayer
    00001001 7E               [ 8] 3556 	ld	a, (hl)
    00001002 B7               [ 4] 3557 	or	a, a
    00001003 20 04            [12] 3558 	jr	NZ, 00131$
                         00000E05  3559 	C$main.c$436$13_0$342	= .
                                   3560 	.globl	C$main.c$436$13_0$342
                                   3561 ;..\main.c:436: currentPlayer = WHITE_PLAYER;
    00001005 36 01            [12] 3562 	ld	(hl), #0x01
    00001007 18 04            [12] 3563 	jr	00132$
    00001009                       3564 00131$:
                         00000E09  3565 	C$main.c$438$13_0$343	= .
                                   3566 	.globl	C$main.c$438$13_0$343
                                   3567 ;..\main.c:438: currentPlayer = BLACK_PLAYER;
    00001009 AF               [ 4] 3568 	xor	a, a
    0000100A EA D7 C0         [16] 3569 	ld	(#_currentPlayer),a
    0000100D                       3570 00132$:
                         00000E0D  3571 	C$main.c$440$11_0$340	= .
                                   3572 	.globl	C$main.c$440$11_0$340
                                   3573 ;..\main.c:440: printBlack();
    0000100D CD 85 03         [24] 3574 	call	_printBlack
                         00000E10  3575 	C$main.c$441$11_0$340	= .
                                   3576 	.globl	C$main.c$441$11_0$340
                                   3577 ;..\main.c:441: printWhite();
    00001010 CD 61 04         [24] 3578 	call	_printWhite
                         00000E13  3579 	C$main.c$442$11_0$340	= .
                                   3580 	.globl	C$main.c$442$11_0$340
                                   3581 ;..\main.c:442: printTurn();
    00001013 CD 61 0B         [24] 3582 	call	_printTurn
                         00000E16  3583 	C$main.c$443$11_0$340	= .
                                   3584 	.globl	C$main.c$443$11_0$340
                                   3585 ;..\main.c:443: pieceSelected = false;
    00001016 AF               [ 4] 3586 	xor	a, a
    00001017 EA DA C0         [16] 3587 	ld	(#_pieceSelected),a
                         00000E1A  3588 	C$main.c$444$11_0$340	= .
                                   3589 	.globl	C$main.c$444$11_0$340
                                   3590 ;..\main.c:444: break; // Exit the loop after a piece has been moved
    0000101A 18 12            [12] 3591 	jr	00151$
    0000101C                       3592 00146$:
                         00000E1C  3593 	C$main.c$448$4_0$344	= .
                                   3594 	.globl	C$main.c$448$4_0$344
                                   3595 ;..\main.c:448: if (joypad_input & J_B) {
    0000101C FA B1 C0         [16] 3596 	ld	a, (_joypad_input)
    0000101F CB 6F            [ 8] 3597 	bit	5, a
    00001021 CA D8 0C         [16] 3598 	jp	Z, 00149$
                         00000E24  3599 	C$main.c$449$5_0$345	= .
                                   3600 	.globl	C$main.c$449$5_0$345
                                   3601 ;..\main.c:449: pieceSelected = false;
    00001024 AF               [ 4] 3602 	xor	a, a
    00001025 EA DA C0         [16] 3603 	ld	(#_pieceSelected),a
                         00000E28  3604 	C$main.c$450$5_0$345	= .
                                   3605 	.globl	C$main.c$450$5_0$345
                                   3606 ;..\main.c:450: printBlack();
    00001028 CD 85 03         [24] 3607 	call	_printBlack
                         00000E2B  3608 	C$main.c$451$5_0$345	= .
                                   3609 	.globl	C$main.c$451$5_0$345
                                   3610 ;..\main.c:451: printWhite();
    0000102B CD 61 04         [24] 3611 	call	_printWhite
                         00000E2E  3612 	C$main.c$452$2_0$305	= .
                                   3613 	.globl	C$main.c$452$2_0$305
                                   3614 ;..\main.c:452: break;
    0000102E                       3615 00151$:
                         00000E2E  3616 	C$main.c$455$2_0$305	= .
                                   3617 	.globl	C$main.c$455$2_0$305
                                   3618 ;..\main.c:455: delay(100);
    0000102E 11 64 00         [12] 3619 	ld	de, #0x0064
    00001031 CD E2 20         [24] 3620 	call	_delay
    00001034 C3 08 0C         [16] 3621 	jp	00153$
                         00000E37  3622 	C$main.c$457$1_0$304	= .
                                   3623 	.globl	C$main.c$457$1_0$304
                                   3624 ;..\main.c:457: }
    00001037 E8 10            [16] 3625 	add	sp, #16
                         00000E39  3626 	C$main.c$457$1_0$304	= .
                                   3627 	.globl	C$main.c$457$1_0$304
                         00000E39  3628 	XG$main$0$0	= .
                                   3629 	.globl	XG$main$0$0
    00001039 C9               [16] 3630 	ret
                                   3631 	.area _CODE
                                   3632 	.area _INITIALIZER
                         00000000  3633 Fmain$__xinit_lastButtonState$0_0$0 == .
    0000217E                       3634 __xinit__lastButtonState:
    0000217E 00                    3635 	.db #0x00	; 0
                         00000001  3636 Fmain$__xinit_debounceTimer$0_0$0 == .
    0000217F                       3637 __xinit__debounceTimer:
    0000217F 00 00                 3638 	.dw #0x0000
                         00000003  3639 Fmain$__xinit_selectedPieceIndex$0_0$0 == .
    00002181                       3640 __xinit__selectedPieceIndex:
    00002181 FF FF                 3641 	.dw #0xffff
                         00000005  3642 Fmain$__xinit_cursorx$0_0$0 == .
    00002183                       3643 __xinit__cursorx:
    00002183 20                    3644 	.db #0x20	; 32
                         00000006  3645 Fmain$__xinit_cursory$0_0$0 == .
    00002184                       3646 __xinit__cursory:
    00002184 20                    3647 	.db #0x20	; 32
                         00000007  3648 Fmain$__xinit_currentPlayer$0_0$0 == .
    00002185                       3649 __xinit__currentPlayer:
    00002185 00                    3650 	.db #0x00	; 0
                         00000008  3651 Fmain$__xinit_selectedCoords$0_0$0 == .
    00002186                       3652 __xinit__selectedCoords:
    00002186 00 00                 3653 	.dw #0x0000
                         0000000A  3654 Fmain$__xinit_pieceSelected$0_0$0 == .
    00002188                       3655 __xinit__pieceSelected:
    00002188 00                    3656 	.db #0x00	;  0
                         0000000B  3657 Fmain$__xinit_tile1$0_0$0 == .
    00002189                       3658 __xinit__tile1:
    00002189 FF                    3659 	.db #0xff	; 255
    0000218A FF                    3660 	.db #0xff	; 255
    0000218B FF                    3661 	.db #0xff	; 255
    0000218C FF                    3662 	.db #0xff	; 255
    0000218D FF                    3663 	.db #0xff	; 255
    0000218E FF                    3664 	.db #0xff	; 255
    0000218F FF                    3665 	.db #0xff	; 255
    00002190 FF                    3666 	.db #0xff	; 255
    00002191 FF                    3667 	.db #0xff	; 255
    00002192 FF                    3668 	.db #0xff	; 255
    00002193 FF                    3669 	.db #0xff	; 255
    00002194 FF                    3670 	.db #0xff	; 255
    00002195 FF                    3671 	.db #0xff	; 255
    00002196 FF                    3672 	.db #0xff	; 255
    00002197 FF                    3673 	.db #0xff	; 255
    00002198 FF                    3674 	.db #0xff	; 255
                         0000001B  3675 Fmain$__xinit_tile2$0_0$0 == .
    00002199                       3676 __xinit__tile2:
    00002199 FF                    3677 	.db #0xff	; 255
    0000219A 00                    3678 	.db #0x00	; 0
    0000219B FF                    3679 	.db #0xff	; 255
    0000219C 00                    3680 	.db #0x00	; 0
    0000219D FF                    3681 	.db #0xff	; 255
    0000219E 00                    3682 	.db #0x00	; 0
    0000219F FF                    3683 	.db #0xff	; 255
    000021A0 00                    3684 	.db #0x00	; 0
    000021A1 FF                    3685 	.db #0xff	; 255
    000021A2 00                    3686 	.db #0x00	; 0
    000021A3 FF                    3687 	.db #0xff	; 255
    000021A4 00                    3688 	.db #0x00	; 0
    000021A5 FF                    3689 	.db #0xff	; 255
    000021A6 00                    3690 	.db #0x00	; 0
    000021A7 FF                    3691 	.db #0xff	; 255
    000021A8 00                    3692 	.db #0x00	; 0
                         0000002B  3693 Fmain$__xinit_tile3$0_0$0 == .
    000021A9                       3694 __xinit__tile3:
    000021A9 00                    3695 	.db #0x00	; 0
    000021AA FF                    3696 	.db #0xff	; 255
    000021AB 00                    3697 	.db #0x00	; 0
    000021AC FF                    3698 	.db #0xff	; 255
    000021AD 00                    3699 	.db #0x00	; 0
    000021AE FF                    3700 	.db #0xff	; 255
    000021AF 00                    3701 	.db #0x00	; 0
    000021B0 FF                    3702 	.db #0xff	; 255
    000021B1 00                    3703 	.db #0x00	; 0
    000021B2 FF                    3704 	.db #0xff	; 255
    000021B3 00                    3705 	.db #0x00	; 0
    000021B4 FF                    3706 	.db #0xff	; 255
    000021B5 00                    3707 	.db #0x00	; 0
    000021B6 FF                    3708 	.db #0xff	; 255
    000021B7 00                    3709 	.db #0x00	; 0
    000021B8 FF                    3710 	.db #0xff	; 255
                         0000003B  3711 Fmain$__xinit_map$0_0$0 == .
    000021B9                       3712 __xinit__map:
    000021B9 01                    3713 	.db #0x01	; 1
    000021BA 01                    3714 	.db #0x01	; 1
    000021BB 01                    3715 	.db #0x01	; 1
    000021BC 01                    3716 	.db #0x01	; 1
    000021BD 01                    3717 	.db #0x01	; 1
    000021BE 01                    3718 	.db #0x01	; 1
    000021BF 01                    3719 	.db #0x01	; 1
    000021C0 01                    3720 	.db #0x01	; 1
    000021C1 01                    3721 	.db #0x01	; 1
    000021C2 01                    3722 	.db #0x01	; 1
    000021C3 01                    3723 	.db #0x01	; 1
    000021C4 01                    3724 	.db #0x01	; 1
    000021C5 01                    3725 	.db #0x01	; 1
    000021C6 01                    3726 	.db #0x01	; 1
    000021C7 01                    3727 	.db #0x01	; 1
    000021C8 01                    3728 	.db #0x01	; 1
    000021C9 01                    3729 	.db #0x01	; 1
    000021CA 01                    3730 	.db #0x01	; 1
    000021CB 01                    3731 	.db #0x01	; 1
    000021CC 01                    3732 	.db #0x01	; 1
    000021CD 01                    3733 	.db #0x01	; 1
    000021CE 01                    3734 	.db #0x01	; 1
    000021CF 02                    3735 	.db #0x02	; 2
    000021D0 02                    3736 	.db #0x02	; 2
    000021D1 03                    3737 	.db #0x03	; 3
    000021D2 03                    3738 	.db #0x03	; 3
    000021D3 02                    3739 	.db #0x02	; 2
    000021D4 02                    3740 	.db #0x02	; 2
    000021D5 03                    3741 	.db #0x03	; 3
    000021D6 03                    3742 	.db #0x03	; 3
    000021D7 02                    3743 	.db #0x02	; 2
    000021D8 02                    3744 	.db #0x02	; 2
    000021D9 03                    3745 	.db #0x03	; 3
    000021DA 03                    3746 	.db #0x03	; 3
    000021DB 02                    3747 	.db #0x02	; 2
    000021DC 02                    3748 	.db #0x02	; 2
    000021DD 03                    3749 	.db #0x03	; 3
    000021DE 03                    3750 	.db #0x03	; 3
    000021DF 01                    3751 	.db #0x01	; 1
    000021E0 01                    3752 	.db #0x01	; 1
    000021E1 01                    3753 	.db #0x01	; 1
    000021E2 01                    3754 	.db #0x01	; 1
    000021E3 02                    3755 	.db #0x02	; 2
    000021E4 02                    3756 	.db #0x02	; 2
    000021E5 03                    3757 	.db #0x03	; 3
    000021E6 03                    3758 	.db #0x03	; 3
    000021E7 02                    3759 	.db #0x02	; 2
    000021E8 02                    3760 	.db #0x02	; 2
    000021E9 03                    3761 	.db #0x03	; 3
    000021EA 03                    3762 	.db #0x03	; 3
    000021EB 02                    3763 	.db #0x02	; 2
    000021EC 02                    3764 	.db #0x02	; 2
    000021ED 03                    3765 	.db #0x03	; 3
    000021EE 03                    3766 	.db #0x03	; 3
    000021EF 02                    3767 	.db #0x02	; 2
    000021F0 02                    3768 	.db #0x02	; 2
    000021F1 03                    3769 	.db #0x03	; 3
    000021F2 03                    3770 	.db #0x03	; 3
    000021F3 01                    3771 	.db #0x01	; 1
    000021F4 01                    3772 	.db #0x01	; 1
    000021F5 01                    3773 	.db #0x01	; 1
    000021F6 01                    3774 	.db #0x01	; 1
    000021F7 03                    3775 	.db #0x03	; 3
    000021F8 03                    3776 	.db #0x03	; 3
    000021F9 02                    3777 	.db #0x02	; 2
    000021FA 02                    3778 	.db #0x02	; 2
    000021FB 03                    3779 	.db #0x03	; 3
    000021FC 03                    3780 	.db #0x03	; 3
    000021FD 02                    3781 	.db #0x02	; 2
    000021FE 02                    3782 	.db #0x02	; 2
    000021FF 03                    3783 	.db #0x03	; 3
    00002200 03                    3784 	.db #0x03	; 3
    00002201 02                    3785 	.db #0x02	; 2
    00002202 02                    3786 	.db #0x02	; 2
    00002203 03                    3787 	.db #0x03	; 3
    00002204 03                    3788 	.db #0x03	; 3
    00002205 02                    3789 	.db #0x02	; 2
    00002206 02                    3790 	.db #0x02	; 2
    00002207 01                    3791 	.db #0x01	; 1
    00002208 01                    3792 	.db #0x01	; 1
    00002209 01                    3793 	.db #0x01	; 1
    0000220A 01                    3794 	.db #0x01	; 1
    0000220B 03                    3795 	.db #0x03	; 3
    0000220C 03                    3796 	.db #0x03	; 3
    0000220D 02                    3797 	.db #0x02	; 2
    0000220E 02                    3798 	.db #0x02	; 2
    0000220F 03                    3799 	.db #0x03	; 3
    00002210 03                    3800 	.db #0x03	; 3
    00002211 02                    3801 	.db #0x02	; 2
    00002212 02                    3802 	.db #0x02	; 2
    00002213 03                    3803 	.db #0x03	; 3
    00002214 03                    3804 	.db #0x03	; 3
    00002215 02                    3805 	.db #0x02	; 2
    00002216 02                    3806 	.db #0x02	; 2
    00002217 03                    3807 	.db #0x03	; 3
    00002218 03                    3808 	.db #0x03	; 3
    00002219 02                    3809 	.db #0x02	; 2
    0000221A 02                    3810 	.db #0x02	; 2
    0000221B 01                    3811 	.db #0x01	; 1
    0000221C 01                    3812 	.db #0x01	; 1
    0000221D 01                    3813 	.db #0x01	; 1
    0000221E 01                    3814 	.db #0x01	; 1
    0000221F 02                    3815 	.db #0x02	; 2
    00002220 02                    3816 	.db #0x02	; 2
    00002221 03                    3817 	.db #0x03	; 3
    00002222 03                    3818 	.db #0x03	; 3
    00002223 02                    3819 	.db #0x02	; 2
    00002224 02                    3820 	.db #0x02	; 2
    00002225 03                    3821 	.db #0x03	; 3
    00002226 03                    3822 	.db #0x03	; 3
    00002227 02                    3823 	.db #0x02	; 2
    00002228 02                    3824 	.db #0x02	; 2
    00002229 03                    3825 	.db #0x03	; 3
    0000222A 03                    3826 	.db #0x03	; 3
    0000222B 02                    3827 	.db #0x02	; 2
    0000222C 02                    3828 	.db #0x02	; 2
    0000222D 03                    3829 	.db #0x03	; 3
    0000222E 03                    3830 	.db #0x03	; 3
    0000222F 01                    3831 	.db #0x01	; 1
    00002230 01                    3832 	.db #0x01	; 1
    00002231 01                    3833 	.db #0x01	; 1
    00002232 01                    3834 	.db #0x01	; 1
    00002233 02                    3835 	.db #0x02	; 2
    00002234 02                    3836 	.db #0x02	; 2
    00002235 03                    3837 	.db #0x03	; 3
    00002236 03                    3838 	.db #0x03	; 3
    00002237 02                    3839 	.db #0x02	; 2
    00002238 02                    3840 	.db #0x02	; 2
    00002239 03                    3841 	.db #0x03	; 3
    0000223A 03                    3842 	.db #0x03	; 3
    0000223B 02                    3843 	.db #0x02	; 2
    0000223C 02                    3844 	.db #0x02	; 2
    0000223D 03                    3845 	.db #0x03	; 3
    0000223E 03                    3846 	.db #0x03	; 3
    0000223F 02                    3847 	.db #0x02	; 2
    00002240 02                    3848 	.db #0x02	; 2
    00002241 03                    3849 	.db #0x03	; 3
    00002242 03                    3850 	.db #0x03	; 3
    00002243 01                    3851 	.db #0x01	; 1
    00002244 01                    3852 	.db #0x01	; 1
    00002245 01                    3853 	.db #0x01	; 1
    00002246 01                    3854 	.db #0x01	; 1
    00002247 03                    3855 	.db #0x03	; 3
    00002248 03                    3856 	.db #0x03	; 3
    00002249 02                    3857 	.db #0x02	; 2
    0000224A 02                    3858 	.db #0x02	; 2
    0000224B 03                    3859 	.db #0x03	; 3
    0000224C 03                    3860 	.db #0x03	; 3
    0000224D 02                    3861 	.db #0x02	; 2
    0000224E 02                    3862 	.db #0x02	; 2
    0000224F 03                    3863 	.db #0x03	; 3
    00002250 03                    3864 	.db #0x03	; 3
    00002251 02                    3865 	.db #0x02	; 2
    00002252 02                    3866 	.db #0x02	; 2
    00002253 03                    3867 	.db #0x03	; 3
    00002254 03                    3868 	.db #0x03	; 3
    00002255 02                    3869 	.db #0x02	; 2
    00002256 02                    3870 	.db #0x02	; 2
    00002257 01                    3871 	.db #0x01	; 1
    00002258 01                    3872 	.db #0x01	; 1
    00002259 01                    3873 	.db #0x01	; 1
    0000225A 01                    3874 	.db #0x01	; 1
    0000225B 03                    3875 	.db #0x03	; 3
    0000225C 03                    3876 	.db #0x03	; 3
    0000225D 02                    3877 	.db #0x02	; 2
    0000225E 02                    3878 	.db #0x02	; 2
    0000225F 03                    3879 	.db #0x03	; 3
    00002260 03                    3880 	.db #0x03	; 3
    00002261 02                    3881 	.db #0x02	; 2
    00002262 02                    3882 	.db #0x02	; 2
    00002263 03                    3883 	.db #0x03	; 3
    00002264 03                    3884 	.db #0x03	; 3
    00002265 02                    3885 	.db #0x02	; 2
    00002266 02                    3886 	.db #0x02	; 2
    00002267 03                    3887 	.db #0x03	; 3
    00002268 03                    3888 	.db #0x03	; 3
    00002269 02                    3889 	.db #0x02	; 2
    0000226A 02                    3890 	.db #0x02	; 2
    0000226B 01                    3891 	.db #0x01	; 1
    0000226C 01                    3892 	.db #0x01	; 1
    0000226D 01                    3893 	.db #0x01	; 1
    0000226E 01                    3894 	.db #0x01	; 1
    0000226F 02                    3895 	.db #0x02	; 2
    00002270 02                    3896 	.db #0x02	; 2
    00002271 03                    3897 	.db #0x03	; 3
    00002272 03                    3898 	.db #0x03	; 3
    00002273 02                    3899 	.db #0x02	; 2
    00002274 02                    3900 	.db #0x02	; 2
    00002275 03                    3901 	.db #0x03	; 3
    00002276 03                    3902 	.db #0x03	; 3
    00002277 02                    3903 	.db #0x02	; 2
    00002278 02                    3904 	.db #0x02	; 2
    00002279 03                    3905 	.db #0x03	; 3
    0000227A 03                    3906 	.db #0x03	; 3
    0000227B 02                    3907 	.db #0x02	; 2
    0000227C 02                    3908 	.db #0x02	; 2
    0000227D 03                    3909 	.db #0x03	; 3
    0000227E 03                    3910 	.db #0x03	; 3
    0000227F 01                    3911 	.db #0x01	; 1
    00002280 01                    3912 	.db #0x01	; 1
    00002281 01                    3913 	.db #0x01	; 1
    00002282 01                    3914 	.db #0x01	; 1
    00002283 02                    3915 	.db #0x02	; 2
    00002284 02                    3916 	.db #0x02	; 2
    00002285 03                    3917 	.db #0x03	; 3
    00002286 03                    3918 	.db #0x03	; 3
    00002287 02                    3919 	.db #0x02	; 2
    00002288 02                    3920 	.db #0x02	; 2
    00002289 03                    3921 	.db #0x03	; 3
    0000228A 03                    3922 	.db #0x03	; 3
    0000228B 02                    3923 	.db #0x02	; 2
    0000228C 02                    3924 	.db #0x02	; 2
    0000228D 03                    3925 	.db #0x03	; 3
    0000228E 03                    3926 	.db #0x03	; 3
    0000228F 02                    3927 	.db #0x02	; 2
    00002290 02                    3928 	.db #0x02	; 2
    00002291 03                    3929 	.db #0x03	; 3
    00002292 03                    3930 	.db #0x03	; 3
    00002293 01                    3931 	.db #0x01	; 1
    00002294 01                    3932 	.db #0x01	; 1
    00002295 01                    3933 	.db #0x01	; 1
    00002296 01                    3934 	.db #0x01	; 1
    00002297 03                    3935 	.db #0x03	; 3
    00002298 03                    3936 	.db #0x03	; 3
    00002299 02                    3937 	.db #0x02	; 2
    0000229A 02                    3938 	.db #0x02	; 2
    0000229B 03                    3939 	.db #0x03	; 3
    0000229C 03                    3940 	.db #0x03	; 3
    0000229D 02                    3941 	.db #0x02	; 2
    0000229E 02                    3942 	.db #0x02	; 2
    0000229F 03                    3943 	.db #0x03	; 3
    000022A0 03                    3944 	.db #0x03	; 3
    000022A1 02                    3945 	.db #0x02	; 2
    000022A2 02                    3946 	.db #0x02	; 2
    000022A3 03                    3947 	.db #0x03	; 3
    000022A4 03                    3948 	.db #0x03	; 3
    000022A5 02                    3949 	.db #0x02	; 2
    000022A6 02                    3950 	.db #0x02	; 2
    000022A7 01                    3951 	.db #0x01	; 1
    000022A8 01                    3952 	.db #0x01	; 1
    000022A9 01                    3953 	.db #0x01	; 1
    000022AA 01                    3954 	.db #0x01	; 1
    000022AB 03                    3955 	.db #0x03	; 3
    000022AC 03                    3956 	.db #0x03	; 3
    000022AD 02                    3957 	.db #0x02	; 2
    000022AE 02                    3958 	.db #0x02	; 2
    000022AF 03                    3959 	.db #0x03	; 3
    000022B0 03                    3960 	.db #0x03	; 3
    000022B1 02                    3961 	.db #0x02	; 2
    000022B2 02                    3962 	.db #0x02	; 2
    000022B3 03                    3963 	.db #0x03	; 3
    000022B4 03                    3964 	.db #0x03	; 3
    000022B5 02                    3965 	.db #0x02	; 2
    000022B6 02                    3966 	.db #0x02	; 2
    000022B7 03                    3967 	.db #0x03	; 3
    000022B8 03                    3968 	.db #0x03	; 3
    000022B9 02                    3969 	.db #0x02	; 2
    000022BA 02                    3970 	.db #0x02	; 2
    000022BB 01                    3971 	.db #0x01	; 1
    000022BC 01                    3972 	.db #0x01	; 1
    000022BD 01                    3973 	.db #0x01	; 1
    000022BE 01                    3974 	.db #0x01	; 1
    000022BF 02                    3975 	.db #0x02	; 2
    000022C0 02                    3976 	.db #0x02	; 2
    000022C1 03                    3977 	.db #0x03	; 3
    000022C2 03                    3978 	.db #0x03	; 3
    000022C3 02                    3979 	.db #0x02	; 2
    000022C4 02                    3980 	.db #0x02	; 2
    000022C5 03                    3981 	.db #0x03	; 3
    000022C6 03                    3982 	.db #0x03	; 3
    000022C7 02                    3983 	.db #0x02	; 2
    000022C8 02                    3984 	.db #0x02	; 2
    000022C9 03                    3985 	.db #0x03	; 3
    000022CA 03                    3986 	.db #0x03	; 3
    000022CB 02                    3987 	.db #0x02	; 2
    000022CC 02                    3988 	.db #0x02	; 2
    000022CD 03                    3989 	.db #0x03	; 3
    000022CE 03                    3990 	.db #0x03	; 3
    000022CF 01                    3991 	.db #0x01	; 1
    000022D0 01                    3992 	.db #0x01	; 1
    000022D1 01                    3993 	.db #0x01	; 1
    000022D2 01                    3994 	.db #0x01	; 1
    000022D3 02                    3995 	.db #0x02	; 2
    000022D4 02                    3996 	.db #0x02	; 2
    000022D5 03                    3997 	.db #0x03	; 3
    000022D6 03                    3998 	.db #0x03	; 3
    000022D7 02                    3999 	.db #0x02	; 2
    000022D8 02                    4000 	.db #0x02	; 2
    000022D9 03                    4001 	.db #0x03	; 3
    000022DA 03                    4002 	.db #0x03	; 3
    000022DB 02                    4003 	.db #0x02	; 2
    000022DC 02                    4004 	.db #0x02	; 2
    000022DD 03                    4005 	.db #0x03	; 3
    000022DE 03                    4006 	.db #0x03	; 3
    000022DF 02                    4007 	.db #0x02	; 2
    000022E0 02                    4008 	.db #0x02	; 2
    000022E1 03                    4009 	.db #0x03	; 3
    000022E2 03                    4010 	.db #0x03	; 3
    000022E3 01                    4011 	.db #0x01	; 1
    000022E4 01                    4012 	.db #0x01	; 1
    000022E5 01                    4013 	.db #0x01	; 1
    000022E6 01                    4014 	.db #0x01	; 1
    000022E7 03                    4015 	.db #0x03	; 3
    000022E8 03                    4016 	.db #0x03	; 3
    000022E9 02                    4017 	.db #0x02	; 2
    000022EA 02                    4018 	.db #0x02	; 2
    000022EB 03                    4019 	.db #0x03	; 3
    000022EC 03                    4020 	.db #0x03	; 3
    000022ED 02                    4021 	.db #0x02	; 2
    000022EE 02                    4022 	.db #0x02	; 2
    000022EF 03                    4023 	.db #0x03	; 3
    000022F0 03                    4024 	.db #0x03	; 3
    000022F1 02                    4025 	.db #0x02	; 2
    000022F2 02                    4026 	.db #0x02	; 2
    000022F3 03                    4027 	.db #0x03	; 3
    000022F4 03                    4028 	.db #0x03	; 3
    000022F5 02                    4029 	.db #0x02	; 2
    000022F6 02                    4030 	.db #0x02	; 2
    000022F7 01                    4031 	.db #0x01	; 1
    000022F8 01                    4032 	.db #0x01	; 1
    000022F9 01                    4033 	.db #0x01	; 1
    000022FA 01                    4034 	.db #0x01	; 1
    000022FB 03                    4035 	.db #0x03	; 3
    000022FC 03                    4036 	.db #0x03	; 3
    000022FD 02                    4037 	.db #0x02	; 2
    000022FE 02                    4038 	.db #0x02	; 2
    000022FF 03                    4039 	.db #0x03	; 3
    00002300 03                    4040 	.db #0x03	; 3
    00002301 02                    4041 	.db #0x02	; 2
    00002302 02                    4042 	.db #0x02	; 2
    00002303 03                    4043 	.db #0x03	; 3
    00002304 03                    4044 	.db #0x03	; 3
    00002305 02                    4045 	.db #0x02	; 2
    00002306 02                    4046 	.db #0x02	; 2
    00002307 03                    4047 	.db #0x03	; 3
    00002308 03                    4048 	.db #0x03	; 3
    00002309 02                    4049 	.db #0x02	; 2
    0000230A 02                    4050 	.db #0x02	; 2
    0000230B 01                    4051 	.db #0x01	; 1
    0000230C 01                    4052 	.db #0x01	; 1
    0000230D 01                    4053 	.db #0x01	; 1
    0000230E 01                    4054 	.db #0x01	; 1
    0000230F 01                    4055 	.db #0x01	; 1
    00002310 01                    4056 	.db #0x01	; 1
    00002311 01                    4057 	.db #0x01	; 1
    00002312 01                    4058 	.db #0x01	; 1
    00002313 01                    4059 	.db #0x01	; 1
    00002314 01                    4060 	.db #0x01	; 1
    00002315 01                    4061 	.db #0x01	; 1
    00002316 01                    4062 	.db #0x01	; 1
    00002317 01                    4063 	.db #0x01	; 1
    00002318 01                    4064 	.db #0x01	; 1
    00002319 01                    4065 	.db #0x01	; 1
    0000231A 01                    4066 	.db #0x01	; 1
    0000231B 01                    4067 	.db #0x01	; 1
    0000231C 01                    4068 	.db #0x01	; 1
    0000231D 01                    4069 	.db #0x01	; 1
    0000231E 01                    4070 	.db #0x01	; 1
    0000231F 01                    4071 	.db #0x01	; 1
    00002320 01                    4072 	.db #0x01	; 1
                         000001A3  4073 Fmain$__xinit_squareTL$0_0$0 == .
    00002321                       4074 __xinit__squareTL:
    00002321 FF                    4075 	.db #0xff	; 255
    00002322 FF                    4076 	.db #0xff	; 255
    00002323 FF                    4077 	.db #0xff	; 255
    00002324 FF                    4078 	.db #0xff	; 255
    00002325 C0                    4079 	.db #0xc0	; 192
    00002326 C0                    4080 	.db #0xc0	; 192
    00002327 C0                    4081 	.db #0xc0	; 192
    00002328 C0                    4082 	.db #0xc0	; 192
    00002329 C0                    4083 	.db #0xc0	; 192
    0000232A C0                    4084 	.db #0xc0	; 192
    0000232B C0                    4085 	.db #0xc0	; 192
    0000232C C0                    4086 	.db #0xc0	; 192
    0000232D C0                    4087 	.db #0xc0	; 192
    0000232E C0                    4088 	.db #0xc0	; 192
    0000232F C0                    4089 	.db #0xc0	; 192
    00002330 C0                    4090 	.db #0xc0	; 192
                         000001B3  4091 Fmain$__xinit_squareTR$0_0$0 == .
    00002331                       4092 __xinit__squareTR:
    00002331 FF                    4093 	.db #0xff	; 255
    00002332 FF                    4094 	.db #0xff	; 255
    00002333 FF                    4095 	.db #0xff	; 255
    00002334 FF                    4096 	.db #0xff	; 255
    00002335 03                    4097 	.db #0x03	; 3
    00002336 03                    4098 	.db #0x03	; 3
    00002337 03                    4099 	.db #0x03	; 3
    00002338 03                    4100 	.db #0x03	; 3
    00002339 03                    4101 	.db #0x03	; 3
    0000233A 03                    4102 	.db #0x03	; 3
    0000233B 03                    4103 	.db #0x03	; 3
    0000233C 03                    4104 	.db #0x03	; 3
    0000233D 03                    4105 	.db #0x03	; 3
    0000233E 03                    4106 	.db #0x03	; 3
    0000233F 03                    4107 	.db #0x03	; 3
    00002340 03                    4108 	.db #0x03	; 3
                         000001C3  4109 Fmain$__xinit_squareBL$0_0$0 == .
    00002341                       4110 __xinit__squareBL:
    00002341 C0                    4111 	.db #0xc0	; 192
    00002342 C0                    4112 	.db #0xc0	; 192
    00002343 C0                    4113 	.db #0xc0	; 192
    00002344 C0                    4114 	.db #0xc0	; 192
    00002345 C0                    4115 	.db #0xc0	; 192
    00002346 C0                    4116 	.db #0xc0	; 192
    00002347 C0                    4117 	.db #0xc0	; 192
    00002348 C0                    4118 	.db #0xc0	; 192
    00002349 C0                    4119 	.db #0xc0	; 192
    0000234A C0                    4120 	.db #0xc0	; 192
    0000234B C0                    4121 	.db #0xc0	; 192
    0000234C C0                    4122 	.db #0xc0	; 192
    0000234D FF                    4123 	.db #0xff	; 255
    0000234E FF                    4124 	.db #0xff	; 255
    0000234F FF                    4125 	.db #0xff	; 255
    00002350 FF                    4126 	.db #0xff	; 255
                         000001D3  4127 Fmain$__xinit_squareBR$0_0$0 == .
    00002351                       4128 __xinit__squareBR:
    00002351 03                    4129 	.db #0x03	; 3
    00002352 03                    4130 	.db #0x03	; 3
    00002353 03                    4131 	.db #0x03	; 3
    00002354 03                    4132 	.db #0x03	; 3
    00002355 03                    4133 	.db #0x03	; 3
    00002356 03                    4134 	.db #0x03	; 3
    00002357 03                    4135 	.db #0x03	; 3
    00002358 03                    4136 	.db #0x03	; 3
    00002359 03                    4137 	.db #0x03	; 3
    0000235A 03                    4138 	.db #0x03	; 3
    0000235B 03                    4139 	.db #0x03	; 3
    0000235C 03                    4140 	.db #0x03	; 3
    0000235D FF                    4141 	.db #0xff	; 255
    0000235E FF                    4142 	.db #0xff	; 255
    0000235F FF                    4143 	.db #0xff	; 255
    00002360 FF                    4144 	.db #0xff	; 255
                         000001E3  4145 Fmain$__xinit_black_piece$0_0$0 == .
    00002361                       4146 __xinit__black_piece:
    00002361 FF                    4147 	.db #0xff	; 255
    00002362 FF                    4148 	.db #0xff	; 255
    00002363 FF                    4149 	.db #0xff	; 255
    00002364 FF                    4150 	.db #0xff	; 255
    00002365 FF                    4151 	.db #0xff	; 255
    00002366 FF                    4152 	.db #0xff	; 255
    00002367 FF                    4153 	.db #0xff	; 255
    00002368 FF                    4154 	.db #0xff	; 255
    00002369 FF                    4155 	.db #0xff	; 255
    0000236A FF                    4156 	.db #0xff	; 255
    0000236B FF                    4157 	.db #0xff	; 255
    0000236C FF                    4158 	.db #0xff	; 255
    0000236D FF                    4159 	.db #0xff	; 255
    0000236E FF                    4160 	.db #0xff	; 255
    0000236F FF                    4161 	.db #0xff	; 255
    00002370 FF                    4162 	.db #0xff	; 255
                         000001F3  4163 Fmain$__xinit_white_piece$0_0$0 == .
    00002371                       4164 __xinit__white_piece:
    00002371 FF                    4165 	.db #0xff	; 255
    00002372 00                    4166 	.db #0x00	; 0
    00002373 FF                    4167 	.db #0xff	; 255
    00002374 00                    4168 	.db #0x00	; 0
    00002375 FF                    4169 	.db #0xff	; 255
    00002376 00                    4170 	.db #0x00	; 0
    00002377 FF                    4171 	.db #0xff	; 255
    00002378 00                    4172 	.db #0x00	; 0
    00002379 FF                    4173 	.db #0xff	; 255
    0000237A 00                    4174 	.db #0x00	; 0
    0000237B FF                    4175 	.db #0xff	; 255
    0000237C 00                    4176 	.db #0x00	; 0
    0000237D FF                    4177 	.db #0xff	; 255
    0000237E 00                    4178 	.db #0x00	; 0
    0000237F FF                    4179 	.db #0xff	; 255
    00002380 00                    4180 	.db #0x00	; 0
                         00000203  4181 Fmain$__xinit_currentPlayerBlackText$0_0$0 == .
    00002381                       4182 __xinit__currentPlayerBlackText:
    00002381 00                    4183 	.db #0x00	; 0
    00002382 00                    4184 	.db #0x00	; 0
    00002383 50                    4185 	.db #0x50	; 80	'P'
    00002384 6C                    4186 	.db #0x6c	; 108	'l'
    00002385 61                    4187 	.db #0x61	; 97	'a'
    00002386 79                    4188 	.db #0x79	; 121	'y'
    00002387 65                    4189 	.db #0x65	; 101	'e'
    00002388 72                    4190 	.db #0x72	; 114	'r'
    00002389 00                    4191 	.db #0x00	; 0
    0000238A 42                    4192 	.db #0x42	; 66	'B'
    0000238B 6C                    4193 	.db #0x6c	; 108	'l'
    0000238C 61                    4194 	.db #0x61	; 97	'a'
    0000238D 63                    4195 	.db #0x63	; 99	'c'
    0000238E 6B                    4196 	.db #0x6b	; 107	'k'
    0000238F 00                    4197 	.db #0x00	; 0
    00002390 00                    4198 	.db #0x00	; 0
                         00000213  4199 Fmain$__xinit_currentPlayerWhiteText$0_0$0 == .
    00002391                       4200 __xinit__currentPlayerWhiteText:
    00002391 00                    4201 	.db #0x00	; 0
    00002392 00                    4202 	.db #0x00	; 0
    00002393 50                    4203 	.db #0x50	; 80	'P'
    00002394 6C                    4204 	.db #0x6c	; 108	'l'
    00002395 61                    4205 	.db #0x61	; 97	'a'
    00002396 79                    4206 	.db #0x79	; 121	'y'
    00002397 65                    4207 	.db #0x65	; 101	'e'
    00002398 72                    4208 	.db #0x72	; 114	'r'
    00002399 00                    4209 	.db #0x00	; 0
    0000239A 57                    4210 	.db #0x57	; 87	'W'
    0000239B 68                    4211 	.db #0x68	; 104	'h'
    0000239C 69                    4212 	.db #0x69	; 105	'i'
    0000239D 74                    4213 	.db #0x74	; 116	't'
    0000239E 65                    4214 	.db #0x65	; 101	'e'
    0000239F 00                    4215 	.db #0x00	; 0
    000023A0 00                    4216 	.db #0x00	; 0
                         00000223  4217 Fmain$__xinit_clearText$0_0$0 == .
    000023A1                       4218 __xinit__clearText:
    000023A1 00                    4219 	.db #0x00	; 0
    000023A2 00                    4220 	.db #0x00	; 0
    000023A3 00                    4221 	.db #0x00	; 0
    000023A4 00                    4222 	.db #0x00	; 0
    000023A5 00                    4223 	.db #0x00	; 0
    000023A6 00                    4224 	.db #0x00	; 0
    000023A7 00                    4225 	.db #0x00	; 0
    000023A8 00                    4226 	.db #0x00	; 0
    000023A9 00                    4227 	.db #0x00	; 0
    000023AA 00                    4228 	.db #0x00	; 0
    000023AB 00                    4229 	.db #0x00	; 0
    000023AC 00                    4230 	.db #0x00	; 0
    000023AD 00                    4231 	.db #0x00	; 0
    000023AE 00                    4232 	.db #0x00	; 0
    000023AF 00                    4233 	.db #0x00	; 0
    000023B0 00                    4234 	.db #0x00	; 0
                         00000233  4235 Fmain$__xinit_whiteWins$0_0$0 == .
    000023B1                       4236 __xinit__whiteWins:
    000023B1 00                    4237 	.db #0x00	; 0
    000023B2 00                    4238 	.db #0x00	; 0
    000023B3 00                    4239 	.db #0x00	; 0
    000023B4 57                    4240 	.db #0x57	; 87	'W'
    000023B5 68                    4241 	.db #0x68	; 104	'h'
    000023B6 69                    4242 	.db #0x69	; 105	'i'
    000023B7 74                    4243 	.db #0x74	; 116	't'
    000023B8 65                    4244 	.db #0x65	; 101	'e'
    000023B9 00                    4245 	.db #0x00	; 0
    000023BA 57                    4246 	.db #0x57	; 87	'W'
    000023BB 69                    4247 	.db #0x69	; 105	'i'
    000023BC 6E                    4248 	.db #0x6e	; 110	'n'
    000023BD 73                    4249 	.db #0x73	; 115	's'
    000023BE 00                    4250 	.db #0x00	; 0
    000023BF 00                    4251 	.db #0x00	; 0
    000023C0 00                    4252 	.db #0x00	; 0
                         00000243  4253 Fmain$__xinit_blackWins$0_0$0 == .
    000023C1                       4254 __xinit__blackWins:
    000023C1 00                    4255 	.db #0x00	; 0
    000023C2 00                    4256 	.db #0x00	; 0
    000023C3 00                    4257 	.db #0x00	; 0
    000023C4 42                    4258 	.db #0x42	; 66	'B'
    000023C5 6C                    4259 	.db #0x6c	; 108	'l'
    000023C6 61                    4260 	.db #0x61	; 97	'a'
    000023C7 63                    4261 	.db #0x63	; 99	'c'
    000023C8 6B                    4262 	.db #0x6b	; 107	'k'
    000023C9 00                    4263 	.db #0x00	; 0
    000023CA 57                    4264 	.db #0x57	; 87	'W'
    000023CB 69                    4265 	.db #0x69	; 105	'i'
    000023CC 6E                    4266 	.db #0x6e	; 110	'n'
    000023CD 73                    4267 	.db #0x73	; 115	's'
    000023CE 00                    4268 	.db #0x00	; 0
    000023CF 00                    4269 	.db #0x00	; 0
    000023D0 00                    4270 	.db #0x00	; 0
                         00000253  4271 Fmain$__xinit_blackKing$0_0$0 == .
    000023D1                       4272 __xinit__blackKing:
    000023D1 FF                    4273 	.db #0xff	; 255
    000023D2 FF                    4274 	.db #0xff	; 255
    000023D3 DB                    4275 	.db #0xdb	; 219
    000023D4 FF                    4276 	.db #0xff	; 255
    000023D5 66                    4277 	.db #0x66	; 102	'f'
    000023D6 FF                    4278 	.db #0xff	; 255
    000023D7 81                    4279 	.db #0x81	; 129
    000023D8 FF                    4280 	.db #0xff	; 255
    000023D9 81                    4281 	.db #0x81	; 129
    000023DA FF                    4282 	.db #0xff	; 255
    000023DB C3                    4283 	.db #0xc3	; 195
    000023DC FF                    4284 	.db #0xff	; 255
    000023DD FF                    4285 	.db #0xff	; 255
    000023DE FF                    4286 	.db #0xff	; 255
    000023DF FF                    4287 	.db #0xff	; 255
    000023E0 FF                    4288 	.db #0xff	; 255
                         00000263  4289 Fmain$__xinit_whiteKing$0_0$0 == .
    000023E1                       4290 __xinit__whiteKing:
    000023E1 FF                    4291 	.db #0xff	; 255
    000023E2 00                    4292 	.db #0x00	; 0
    000023E3 DB                    4293 	.db #0xdb	; 219
    000023E4 24                    4294 	.db #0x24	; 36
    000023E5 66                    4295 	.db #0x66	; 102	'f'
    000023E6 99                    4296 	.db #0x99	; 153
    000023E7 81                    4297 	.db #0x81	; 129
    000023E8 7E                    4298 	.db #0x7e	; 126
    000023E9 81                    4299 	.db #0x81	; 129
    000023EA 7E                    4300 	.db #0x7e	; 126
    000023EB C3                    4301 	.db #0xc3	; 195
    000023EC 3C                    4302 	.db #0x3c	; 60
    000023ED FF                    4303 	.db #0xff	; 255
    000023EE 00                    4304 	.db #0x00	; 0
    000023EF FF                    4305 	.db #0xff	; 255
    000023F0 00                    4306 	.db #0x00	; 0
                         00000273  4307 Fmain$__xinit_blackPieces$0_0$0 == .
    000023F1                       4308 __xinit__blackPieces:
    000023F1 2C                    4309 	.db #0x2c	; 44
    000023F2 1C                    4310 	.db #0x1c	; 28
    000023F3 00                    4311 	.db #0x00	;  0
    000023F4 4C                    4312 	.db #0x4c	; 76	'L'
    000023F5 1C                    4313 	.db #0x1c	; 28
    000023F6 00                    4314 	.db #0x00	;  0
    000023F7 6C                    4315 	.db #0x6c	; 108	'l'
    000023F8 1C                    4316 	.db #0x1c	; 28
    000023F9 00                    4317 	.db #0x00	;  0
    000023FA 8C                    4318 	.db #0x8c	; 140
    000023FB 1C                    4319 	.db #0x1c	; 28
    000023FC 00                    4320 	.db #0x00	;  0
    000023FD 1C                    4321 	.db #0x1c	; 28
    000023FE 2C                    4322 	.db #0x2c	; 44
    000023FF 00                    4323 	.db #0x00	;  0
    00002400 3C                    4324 	.db #0x3c	; 60
    00002401 2C                    4325 	.db #0x2c	; 44
    00002402 00                    4326 	.db #0x00	;  0
    00002403 5C                    4327 	.db #0x5c	; 92
    00002404 2C                    4328 	.db #0x2c	; 44
    00002405 00                    4329 	.db #0x00	;  0
    00002406 7C                    4330 	.db #0x7c	; 124
    00002407 2C                    4331 	.db #0x2c	; 44
    00002408 00                    4332 	.db #0x00	;  0
    00002409 2C                    4333 	.db #0x2c	; 44
    0000240A 3C                    4334 	.db #0x3c	; 60
    0000240B 00                    4335 	.db #0x00	;  0
    0000240C 4C                    4336 	.db #0x4c	; 76	'L'
    0000240D 3C                    4337 	.db #0x3c	; 60
    0000240E 00                    4338 	.db #0x00	;  0
    0000240F 6C                    4339 	.db #0x6c	; 108	'l'
    00002410 3C                    4340 	.db #0x3c	; 60
    00002411 00                    4341 	.db #0x00	;  0
    00002412 8C                    4342 	.db #0x8c	; 140
    00002413 3C                    4343 	.db #0x3c	; 60
    00002414 00                    4344 	.db #0x00	;  0
                         00000297  4345 Fmain$__xinit_whitePieces$0_0$0 == .
    00002415                       4346 __xinit__whitePieces:
    00002415 1C                    4347 	.db #0x1c	; 28
    00002416 8C                    4348 	.db #0x8c	; 140
    00002417 00                    4349 	.db #0x00	;  0
    00002418 3C                    4350 	.db #0x3c	; 60
    00002419 8C                    4351 	.db #0x8c	; 140
    0000241A 00                    4352 	.db #0x00	;  0
    0000241B 5C                    4353 	.db #0x5c	; 92
    0000241C 8C                    4354 	.db #0x8c	; 140
    0000241D 00                    4355 	.db #0x00	;  0
    0000241E 7C                    4356 	.db #0x7c	; 124
    0000241F 8C                    4357 	.db #0x8c	; 140
    00002420 00                    4358 	.db #0x00	;  0
    00002421 2C                    4359 	.db #0x2c	; 44
    00002422 7C                    4360 	.db #0x7c	; 124
    00002423 00                    4361 	.db #0x00	;  0
    00002424 4C                    4362 	.db #0x4c	; 76	'L'
    00002425 7C                    4363 	.db #0x7c	; 124
    00002426 00                    4364 	.db #0x00	;  0
    00002427 6C                    4365 	.db #0x6c	; 108	'l'
    00002428 7C                    4366 	.db #0x7c	; 124
    00002429 00                    4367 	.db #0x00	;  0
    0000242A 8C                    4368 	.db #0x8c	; 140
    0000242B 7C                    4369 	.db #0x7c	; 124
    0000242C 00                    4370 	.db #0x00	;  0
    0000242D 1C                    4371 	.db #0x1c	; 28
    0000242E 6C                    4372 	.db #0x6c	; 108	'l'
    0000242F 00                    4373 	.db #0x00	;  0
    00002430 3C                    4374 	.db #0x3c	; 60
    00002431 6C                    4375 	.db #0x6c	; 108	'l'
    00002432 00                    4376 	.db #0x00	;  0
    00002433 5C                    4377 	.db #0x5c	; 92
    00002434 6C                    4378 	.db #0x6c	; 108	'l'
    00002435 00                    4379 	.db #0x00	;  0
    00002436 7C                    4380 	.db #0x7c	; 124
    00002437 6C                    4381 	.db #0x6c	; 108	'l'
    00002438 00                    4382 	.db #0x00	;  0
                                   4383 	.area _CABS (ABS)
