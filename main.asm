;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _checkCollision
	.globl _isValidMove
	.globl _checkCapture
	.globl _isMoveWithinBoard
	.globl _modifyCoordinates
	.globl _printWhite
	.globl _printBlack
	.globl _printSquare
	.globl _printbkg
	.globl _printTurn
	.globl _font
	.globl _dpad
	.globl _moveSquare
	.globl _font_set
	.globl _font_load
	.globl _font_init
	.globl _abs
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _joypad
	.globl _delay
	.globl _whitePieces
	.globl _blackPieces
	.globl _whiteKing
	.globl _blackKing
	.globl _currentPlayerWhiteText
	.globl _currentPlayerBlackText
	.globl _white_piece
	.globl _black_piece
	.globl _squareBR
	.globl _squareBL
	.globl _squareTR
	.globl _squareTL
	.globl _map
	.globl _tile3
	.globl _tile2
	.globl _tile1
	.globl _pieceSelected
	.globl _selectedCoords
	.globl _currentPlayer
	.globl _cursory
	.globl _cursorx
	.globl _selectedPieceIndex
	.globl _debounceTimer
	.globl _lastButtonState
	.globl _joypad_input
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$joypad_input$0_0$0==.
_joypad_input::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
G$lastButtonState$0_0$0==.
_lastButtonState::
	.ds 1
G$debounceTimer$0_0$0==.
_debounceTimer::
	.ds 2
G$selectedPieceIndex$0_0$0==.
_selectedPieceIndex::
	.ds 2
G$cursorx$0_0$0==.
_cursorx::
	.ds 1
G$cursory$0_0$0==.
_cursory::
	.ds 1
G$currentPlayer$0_0$0==.
_currentPlayer::
	.ds 1
G$selectedCoords$0_0$0==.
_selectedCoords::
	.ds 2
G$pieceSelected$0_0$0==.
_pieceSelected::
	.ds 1
G$tile1$0_0$0==.
_tile1::
	.ds 16
G$tile2$0_0$0==.
_tile2::
	.ds 16
G$tile3$0_0$0==.
_tile3::
	.ds 16
G$map$0_0$0==.
_map::
	.ds 360
G$squareTL$0_0$0==.
_squareTL::
	.ds 16
G$squareTR$0_0$0==.
_squareTR::
	.ds 16
G$squareBL$0_0$0==.
_squareBL::
	.ds 16
G$squareBR$0_0$0==.
_squareBR::
	.ds 16
G$black_piece$0_0$0==.
_black_piece::
	.ds 16
G$white_piece$0_0$0==.
_white_piece::
	.ds 16
G$currentPlayerBlackText$0_0$0==.
_currentPlayerBlackText::
	.ds 16
G$currentPlayerWhiteText$0_0$0==.
_currentPlayerWhiteText::
	.ds 16
G$blackKing$0_0$0==.
_blackKing::
	.ds 16
G$whiteKing$0_0$0==.
_whiteKing::
	.ds 16
G$blackPieces$0_0$0==.
_blackPieces::
	.ds 36
G$whitePieces$0_0$0==.
_whitePieces::
	.ds 36
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	G$moveSquare$0$0	= .
	.globl	G$moveSquare$0$0
	C$main.c$96$0_0$125	= .
	.globl	C$main.c$96$0_0$125
;main.c:96: void moveSquare() {
;	---------------------------------
; Function moveSquare
; ---------------------------------
_moveSquare::
;main.c:97: move_sprite(0, cursorx - 4, cursory - 4);
	ld	a, (#_cursory)
	add	a, #0xfc
	ld	b, a
	ld	a, (#_cursorx)
	add	a, #0xfc
	ld	c, a
;c:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:98: move_sprite(1, cursorx + 4, cursory - 4);
	ld	a, (#_cursory)
	add	a, #0xfc
	ld	b, a
	ld	a, (#_cursorx)
	add	a, #0x04
	ld	c, a
;c:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:99: move_sprite(2, cursorx - 4, cursory + 4);
	ld	a, (#_cursory)
	add	a, #0x04
	ld	b, a
	ld	a, (#_cursorx)
	add	a, #0xfc
	ld	c, a
;c:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:100: move_sprite(3, cursorx + 4, cursory + 4);
	ld	a, (#_cursory)
	add	a, #0x04
	ld	b, a
	ld	a, (#_cursorx)
	add	a, #0x04
	ld	c, a
;c:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;c:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$main.c$100$3_0$125	= .
	.globl	C$main.c$100$3_0$125
;main.c:100: move_sprite(3, cursorx + 4, cursory + 4);
	C$main.c$101$3_0$125	= .
	.globl	C$main.c$101$3_0$125
;main.c:101: }
	C$main.c$101$3_0$125	= .
	.globl	C$main.c$101$3_0$125
	XG$moveSquare$0$0	= .
	.globl	XG$moveSquare$0$0
	ret
	G$dpad$0$0	= .
	.globl	G$dpad$0$0
	C$main.c$119$3_0$138	= .
	.globl	C$main.c$119$3_0$138
;main.c:119: void dpad() {
;	---------------------------------
; Function dpad
; ---------------------------------
_dpad::
	C$main.c$120$1_0$138	= .
	.globl	C$main.c$120$1_0$138
;main.c:120: if (joypad_input & J_RIGHT) {
	ld	hl, #_joypad_input
	ld	c, (hl)
	bit	0, c
	jr	Z, 00102$
	C$main.c$121$2_0$139	= .
	.globl	C$main.c$121$2_0$139
;main.c:121: cursorx = cursorx + SQUARE_SIZE;
	ld	hl, #_cursorx
	ld	a, (hl)
	add	a, #0x10
	ld	(hl), a
00102$:
	C$main.c$123$1_0$138	= .
	.globl	C$main.c$123$1_0$138
;main.c:123: if (joypad_input & J_LEFT) {
	bit	1, c
	jr	Z, 00104$
	C$main.c$124$2_0$140	= .
	.globl	C$main.c$124$2_0$140
;main.c:124: cursorx = cursorx - SQUARE_SIZE;
	ld	hl, #_cursorx
	ld	a, (hl)
	add	a, #0xf0
	ld	(hl), a
00104$:
	C$main.c$126$1_0$138	= .
	.globl	C$main.c$126$1_0$138
;main.c:126: if (joypad_input & J_UP) {
	bit	2, c
	jr	Z, 00106$
	C$main.c$127$2_0$141	= .
	.globl	C$main.c$127$2_0$141
;main.c:127: cursory = cursory - SQUARE_SIZE;
	ld	hl, #_cursory
	ld	a, (hl)
	add	a, #0xf0
	ld	(hl), a
00106$:
	C$main.c$129$1_0$138	= .
	.globl	C$main.c$129$1_0$138
;main.c:129: if (joypad_input & J_DOWN) {
	bit	3, c
	jp	Z,_moveSquare
	C$main.c$130$2_0$142	= .
	.globl	C$main.c$130$2_0$142
;main.c:130: cursory = cursory + SQUARE_SIZE;
	ld	hl, #_cursory
	ld	a, (hl)
	add	a, #0x10
	ld	(hl), a
	C$main.c$132$1_0$138	= .
	.globl	C$main.c$132$1_0$138
;main.c:132: moveSquare();
	C$main.c$133$1_0$138	= .
	.globl	C$main.c$133$1_0$138
;main.c:133: }
	C$main.c$133$1_0$138	= .
	.globl	C$main.c$133$1_0$138
	XG$dpad$0$0	= .
	.globl	XG$dpad$0$0
	jp	_moveSquare
	G$font$0$0	= .
	.globl	G$font$0$0
	C$main.c$134$1_0$143	= .
	.globl	C$main.c$134$1_0$143
;main.c:134: void font() {
;	---------------------------------
; Function font
; ---------------------------------
_font::
	C$main.c$136$1_0$143	= .
	.globl	C$main.c$136$1_0$143
;main.c:136: font_init();
	call	_font_init
	C$main.c$137$1_0$143	= .
	.globl	C$main.c$137$1_0$143
;main.c:137: min_font = font_load(font_ibm_fixed);
	ld	de, #_font_ibm_fixed
	push	de
	call	_font_load
	pop	hl
	C$main.c$138$1_0$143	= .
	.globl	C$main.c$138$1_0$143
;main.c:138: font_set(min_font);
	push	de
	call	_font_set
	pop	hl
	C$main.c$139$1_0$143	= .
	.globl	C$main.c$139$1_0$143
;main.c:139: }
	C$main.c$139$1_0$143	= .
	.globl	C$main.c$139$1_0$143
	XG$font$0$0	= .
	.globl	XG$font$0$0
	ret
	G$printTurn$0$0	= .
	.globl	G$printTurn$0$0
	C$main.c$140$1_0$144	= .
	.globl	C$main.c$140$1_0$144
;main.c:140: void printTurn() {
;	---------------------------------
; Function printTurn
; ---------------------------------
_printTurn::
	C$main.c$141$1_0$144	= .
	.globl	C$main.c$141$1_0$144
;main.c:141: if (currentPlayer == BLACK_PLAYER){
	ld	a, (#_currentPlayer)
	or	a, a
	jr	NZ, 00102$
	C$main.c$142$2_0$145	= .
	.globl	C$main.c$142$2_0$145
;main.c:142: set_win_tiles(2, 0, 16, 1, currentPlayerBlackText);
	ld	de, #_currentPlayerBlackText
	push	de
	ld	hl, #0x110
	push	hl
	ld	hl, #0x02
	push	hl
	call	_set_win_tiles
	add	sp, #6
	jr	00103$
00102$:
	C$main.c$144$2_0$146	= .
	.globl	C$main.c$144$2_0$146
;main.c:144: set_win_tiles(2, 0, 16, 1, currentPlayerWhiteText);
	ld	de, #_currentPlayerWhiteText
	push	de
	ld	hl, #0x110
	push	hl
	ld	hl, #0x02
	push	hl
	call	_set_win_tiles
	add	sp, #6
00103$:
;c:/gbdk/include/gb/gb.h:1468: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
	C$main.c$146$3_0$144	= .
	.globl	C$main.c$146$3_0$144
;main.c:146: move_win(7, 136);
	C$main.c$147$3_0$144	= .
	.globl	C$main.c$147$3_0$144
;main.c:147: }
	C$main.c$147$3_0$144	= .
	.globl	C$main.c$147$3_0$144
	XG$printTurn$0$0	= .
	.globl	XG$printTurn$0$0
	ret
	G$printbkg$0$0	= .
	.globl	G$printbkg$0$0
	C$main.c$148$3_0$150	= .
	.globl	C$main.c$148$3_0$150
;main.c:148: void printbkg() {
;	---------------------------------
; Function printbkg
; ---------------------------------
_printbkg::
	C$main.c$149$1_0$150	= .
	.globl	C$main.c$149$1_0$150
;main.c:149: set_bkg_data(1, 1, tile1);
	ld	de, #_tile1
	push	de
	ld	hl, #0x101
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$main.c$150$1_0$150	= .
	.globl	C$main.c$150$1_0$150
;main.c:150: set_bkg_data(2, 1, tile2);
	ld	de, #_tile2
	push	de
	ld	hl, #0x102
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$main.c$151$1_0$150	= .
	.globl	C$main.c$151$1_0$150
;main.c:151: set_bkg_data(3, 1, tile3);
	ld	de, #_tile3
	push	de
	ld	hl, #0x103
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$main.c$152$1_0$150	= .
	.globl	C$main.c$152$1_0$150
;main.c:152: set_bkg_tiles(0, 0, 20, 18, map);
	ld	de, #_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
	C$main.c$153$1_0$150	= .
	.globl	C$main.c$153$1_0$150
;main.c:153: }
	C$main.c$153$1_0$150	= .
	.globl	C$main.c$153$1_0$150
	XG$printbkg$0$0	= .
	.globl	XG$printbkg$0$0
	ret
	G$printSquare$0$0	= .
	.globl	G$printSquare$0$0
	C$main.c$154$1_0$151	= .
	.globl	C$main.c$154$1_0$151
;main.c:154: void printSquare() {
;	---------------------------------
; Function printSquare
; ---------------------------------
_printSquare::
	C$main.c$155$1_0$151	= .
	.globl	C$main.c$155$1_0$151
;main.c:155: set_sprite_data(0, 1, squareTL);
	ld	de, #_squareTL
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_data
	add	sp, #4
	C$main.c$156$1_0$151	= .
	.globl	C$main.c$156$1_0$151
;main.c:156: set_sprite_data(1, 1, squareTR);
	ld	de, #_squareTR
	push	de
	ld	hl, #0x101
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$157$1_0$151	= .
	.globl	C$main.c$157$1_0$151
;main.c:157: set_sprite_data(2, 1, squareBL);
	ld	de, #_squareBL
	push	de
	ld	hl, #0x102
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$158$1_0$151	= .
	.globl	C$main.c$158$1_0$151
;main.c:158: set_sprite_data(3, 1, squareBR);
	ld	de, #_squareBR
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;c:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x02
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x03
	C$main.c$163$1_0$151	= .
	.globl	C$main.c$163$1_0$151
;main.c:163: moveSquare();
	C$main.c$164$1_0$151	= .
	.globl	C$main.c$164$1_0$151
;main.c:164: }
	C$main.c$164$1_0$151	= .
	.globl	C$main.c$164$1_0$151
	XG$printSquare$0$0	= .
	.globl	XG$printSquare$0$0
	jp	_moveSquare
	G$printBlack$0$0	= .
	.globl	G$printBlack$0$0
	C$main.c$165$1_0$164	= .
	.globl	C$main.c$165$1_0$164
;main.c:165: void printBlack() {
;	---------------------------------
; Function printBlack
; ---------------------------------
_printBlack::
	add	sp, #-6
	C$main.c$166$1_0$164	= .
	.globl	C$main.c$166$1_0$164
;main.c:166: set_sprite_data(4, 12, black_piece);
	ld	de, #_black_piece
	push	de
	ld	hl, #0xc04
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$167$1_0$164	= .
	.globl	C$main.c$167$1_0$164
;main.c:167: set_sprite_data(8, 12, blackKing);
	ld	de, #_blackKing
	push	de
	ld	hl, #0xc08
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$169$3_0$166	= .
	.globl	C$main.c$169$3_0$166
;main.c:169: for (int i = 0; i < 12; i++){
	xor	a, a
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), a
00109$:
	ldhl	sp,	#4
	ld	a, (hl+)
	sub	a, #0x0c
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00129$
	bit	7, d
	jr	NZ, 00130$
	cp	a, a
	jr	00130$
00129$:
	bit	7, d
	jr	Z, 00130$
	scf
00130$:
	jp	NC, 00111$
	C$main.c$170$3_0$166	= .
	.globl	C$main.c$170$3_0$166
;main.c:170: if (blackPieces[i].isKing) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	de, #_blackPieces
	add	hl, de
	inc	hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	C$main.c$171$2_0$164	= .
	.globl	C$main.c$171$2_0$164
;main.c:171: set_sprite_tile(i + 4, 8); // Use the black king sprite tile
	ldhl	sp,	#4
	ld	a, (hl-)
	add	a, #0x04
	C$main.c$170$3_0$166	= .
	.globl	C$main.c$170$3_0$166
;main.c:170: if (blackPieces[i].isKing) {
	ld	(hl-), a
	bit	0, (hl)
	jr	Z, 00102$
;main.c:171: set_sprite_tile(i + 4, 8); // Use the black king sprite tile
;c:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	inc	hl
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00131$:
	ldhl	sp,	#2
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00131$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x08
	C$main.c$171$3_0$166	= .
	.globl	C$main.c$171$3_0$166
;main.c:171: set_sprite_tile(i + 4, 8); // Use the black king sprite tile
	jr	00103$
00102$:
;main.c:173: set_sprite_tile(i + 4, 4); // Use the black regular piece sprite tile
;c:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#3
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00132$:
	ldhl	sp,	#2
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00132$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x04
	C$main.c$173$3_0$166	= .
	.globl	C$main.c$173$3_0$166
;main.c:173: set_sprite_tile(i + 4, 4); // Use the black regular piece sprite tile
00103$:
;main.c:175: move_sprite(i + 4, blackPieces[i].x, blackPieces[i].y);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	de, #_blackPieces
	add	hl, de
	ld	c, l
	ld	b, h
	inc	bc
	ld	a, (bc)
	ld	e, a
	ld	c, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, #0x04
;c:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;c:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
	C$main.c$169$2_0$165	= .
	.globl	C$main.c$169$2_0$165
;main.c:169: for (int i = 0; i < 12; i++){
	ldhl	sp,	#4
	inc	(hl)
	jp	NZ,00109$
	inc	hl
	inc	(hl)
	jp	00109$
00111$:
	C$main.c$177$2_0$164	= .
	.globl	C$main.c$177$2_0$164
;main.c:177: }
	add	sp, #6
	C$main.c$177$2_0$164	= .
	.globl	C$main.c$177$2_0$164
	XG$printBlack$0$0	= .
	.globl	XG$printBlack$0$0
	ret
	G$printWhite$0$0	= .
	.globl	G$printWhite$0$0
	C$main.c$178$2_0$178	= .
	.globl	C$main.c$178$2_0$178
;main.c:178: void printWhite() {
;	---------------------------------
; Function printWhite
; ---------------------------------
_printWhite::
	add	sp, #-6
	C$main.c$179$1_0$178	= .
	.globl	C$main.c$179$1_0$178
;main.c:179: set_sprite_data(5, 12, white_piece);
	ld	de, #_white_piece
	push	de
	ld	hl, #0xc05
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$180$1_0$178	= .
	.globl	C$main.c$180$1_0$178
;main.c:180: set_sprite_data(20, 12, whiteKing);
	ld	de, #_whiteKing
	push	de
	ld	hl, #0xc14
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$182$3_0$180	= .
	.globl	C$main.c$182$3_0$180
;main.c:182: for (int i = 0; i < 12; i++){
	xor	a, a
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), a
00109$:
	ldhl	sp,	#4
	ld	a, (hl+)
	sub	a, #0x0c
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00129$
	bit	7, d
	jr	NZ, 00130$
	cp	a, a
	jr	00130$
00129$:
	bit	7, d
	jr	Z, 00130$
	scf
00130$:
	jp	NC, 00111$
	C$main.c$183$3_0$180	= .
	.globl	C$main.c$183$3_0$180
;main.c:183: if (whitePieces[i].isKing) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	de, #_whitePieces
	add	hl, de
	inc	hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	C$main.c$184$2_0$178	= .
	.globl	C$main.c$184$2_0$178
;main.c:184: set_sprite_tile(i + 16, 20); // Use the white king sprite tile
	ldhl	sp,	#4
	ld	a, (hl-)
	add	a, #0x10
	C$main.c$183$3_0$180	= .
	.globl	C$main.c$183$3_0$180
;main.c:183: if (whitePieces[i].isKing) {
	ld	(hl-), a
	bit	0, (hl)
	jr	Z, 00102$
;main.c:184: set_sprite_tile(i + 16, 20); // Use the white king sprite tile
;c:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	inc	hl
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00131$:
	ldhl	sp,	#2
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00131$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x14
	C$main.c$184$3_0$180	= .
	.globl	C$main.c$184$3_0$180
;main.c:184: set_sprite_tile(i + 16, 20); // Use the white king sprite tile
	jr	00103$
00102$:
;main.c:186: set_sprite_tile(i + 16, 5); // Use the white regular piece sprite tile
;c:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#3
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00132$:
	ldhl	sp,	#2
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00132$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x05
	C$main.c$186$3_0$180	= .
	.globl	C$main.c$186$3_0$180
;main.c:186: set_sprite_tile(i + 16, 5); // Use the white regular piece sprite tile
00103$:
;main.c:188: move_sprite(i + 16, whitePieces[i].x, whitePieces[i].y);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	de, #_whitePieces
	add	hl, de
	ld	c, l
	ld	b, h
	inc	bc
	ld	a, (bc)
	ld	e, a
	ld	c, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, #0x10
;c:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;c:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
	C$main.c$182$2_0$179	= .
	.globl	C$main.c$182$2_0$179
;main.c:182: for (int i = 0; i < 12; i++){
	ldhl	sp,	#4
	inc	(hl)
	jp	NZ,00109$
	inc	hl
	inc	(hl)
	jp	00109$
00111$:
	C$main.c$190$2_0$178	= .
	.globl	C$main.c$190$2_0$178
;main.c:190: }
	add	sp, #6
	C$main.c$190$2_0$178	= .
	.globl	C$main.c$190$2_0$178
	XG$printWhite$0$0	= .
	.globl	XG$printWhite$0$0
	ret
	G$modifyCoordinates$0$0	= .
	.globl	G$modifyCoordinates$0$0
	C$main.c$191$2_0$193	= .
	.globl	C$main.c$191$2_0$193
;main.c:191: void modifyCoordinates(Piece input[], int selectedCoords, int newX, int newY) {
;	---------------------------------
; Function modifyCoordinates
; ---------------------------------
_modifyCoordinates::
	push	de
	C$main.c$193$1_0$193	= .
	.globl	C$main.c$193$1_0$193
;main.c:193: if (selectedCoords >= 0) {
	bit	7, b
	jr	NZ, 00113$
	C$main.c$195$2_0$194	= .
	.globl	C$main.c$195$2_0$194
;main.c:195: input[selectedCoords].x = newX;
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	C$main.c$196$2_0$194	= .
	.globl	C$main.c$196$2_0$194
;main.c:196: input[selectedCoords].y = newY;
	ld	a, (hl+)
	inc	hl
	ld	(bc), a
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$main.c$198$2_0$194	= .
	.globl	C$main.c$198$2_0$194
;main.c:198: if (currentPlayer == WHITE_PLAYER && input[selectedCoords].y == 28 ||
	ld	a, (#_currentPlayer)
	dec	a
	jr	NZ, 00108$
	ld	a, (de)
	sub	a, #0x1c
	jr	Z, 00104$
00108$:
	C$main.c$199$2_0$194	= .
	.globl	C$main.c$199$2_0$194
;main.c:199: currentPlayer == BLACK_PLAYER && input[selectedCoords].y == 140) {
	ld	a, (#_currentPlayer)
	or	a, a
	jr	NZ, 00113$
	ld	a, (de)
	sub	a, #0x8c
	jr	NZ, 00113$
00104$:
	C$main.c$200$3_0$195	= .
	.globl	C$main.c$200$3_0$195
;main.c:200: input[selectedCoords].isKing = true;
	inc	bc
	inc	bc
	ld	a, #0x01
	ld	(bc), a
	C$main.c$203$1_0$193	= .
	.globl	C$main.c$203$1_0$193
;main.c:203: set_sprite_tile(selectedPieceIndex, 8); // Use the black king sprite tile
	ld	hl, #_selectedPieceIndex
	ld	e, (hl)
	C$main.c$202$3_0$195	= .
	.globl	C$main.c$202$3_0$195
;main.c:202: if (currentPlayer == BLACK_PLAYER) {
	ld	a, (#_currentPlayer)
	or	a, a
	jr	NZ, 00102$
;main.c:203: set_sprite_tile(selectedPieceIndex, 8); // Use the black king sprite tile
;c:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	bc, #_shadow_OAM+0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x08
	C$main.c$203$3_0$195	= .
	.globl	C$main.c$203$3_0$195
;main.c:203: set_sprite_tile(selectedPieceIndex, 8); // Use the black king sprite tile
	jr	00113$
00102$:
;main.c:205: set_sprite_tile(selectedPieceIndex, 20); // Use the white king sprite tile
;c:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	bc, #_shadow_OAM+0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x14
	C$main.c$205$1_0$193	= .
	.globl	C$main.c$205$1_0$193
;main.c:205: set_sprite_tile(selectedPieceIndex, 20); // Use the white king sprite tile
00113$:
	C$main.c$209$1_0$193	= .
	.globl	C$main.c$209$1_0$193
;main.c:209: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #4
	jp	(hl)
	G$isMoveWithinBoard$0$0	= .
	.globl	G$isMoveWithinBoard$0$0
	C$main.c$210$1_0$205	= .
	.globl	C$main.c$210$1_0$205
;main.c:210: bool isMoveWithinBoard(UINT8 x, UINT8 y) {
;	---------------------------------
; Function isMoveWithinBoard
; ---------------------------------
_isMoveWithinBoard::
	C$main.c$211$1_0$205	= .
	.globl	C$main.c$211$1_0$205
;main.c:211: return (x >= 20 && x <=140 && y >= 20 && y <= 140);
	ld	c, a
	sub	a, #0x14
	jr	C, 00103$
	ld	a, #0x8c
	sub	a, c
	jr	C, 00103$
	ld	a, e
	sub	a, #0x14
	jr	C, 00103$
	ld	a, #0x8c
	sub	a, e
	jr	NC, 00104$
00103$:
	xor	a, a
	ret
00104$:
	ld	a, #0x01
	C$main.c$212$1_0$205	= .
	.globl	C$main.c$212$1_0$205
;main.c:212: }
	C$main.c$212$1_0$205	= .
	.globl	C$main.c$212$1_0$205
	XG$isMoveWithinBoard$0$0	= .
	.globl	XG$isMoveWithinBoard$0$0
	ret
	G$checkCapture$0$0	= .
	.globl	G$checkCapture$0$0
	C$main.c$213$1_0$207	= .
	.globl	C$main.c$213$1_0$207
;main.c:213: bool checkCapture(UINT8 capturedX, UINT8 capturedY, Piece* opponentPieces) {
;	---------------------------------
; Function checkCapture
; ---------------------------------
_checkCapture::
	add	sp, #-12
	ldhl	sp,	#11
	ld	(hl-), a
	ld	(hl), e
	C$main.c$216$1_0$207	= .
	.globl	C$main.c$216$1_0$207
;main.c:216: for (int i = 0; i < 12; i++) {
	ld	bc, #0x0000
00108$:
	ld	a, c
	sub	a, #0x0c
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00106$
	C$main.c$217$3_0$209	= .
	.globl	C$main.c$217$3_0$209
;main.c:217: UINT8 pieceX = opponentPieces[i].x;
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#14
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
	C$main.c$218$3_0$209	= .
	.globl	C$main.c$218$3_0$209
;main.c:218: UINT8 pieceY = opponentPieces[i].y;
	pop	de
	push	de
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#9
	C$main.c$221$3_0$209	= .
	.globl	C$main.c$221$3_0$209
;main.c:221: UINT8 pieceLeft = pieceX - 4;
	ld	(hl-), a
	ld	e, (hl)
	ld	a, e
	add	a, #0xfc
	ldhl	sp,	#4
	C$main.c$222$3_0$209	= .
	.globl	C$main.c$222$3_0$209
;main.c:222: UINT8 pieceRight = pieceX + 4;
	ld	(hl+), a
	ld	a, e
	add	a, #0x04
	ld	(hl), a
	C$main.c$223$3_0$209	= .
	.globl	C$main.c$223$3_0$209
;main.c:223: UINT8 pieceTop = pieceY - 4;
	ldhl	sp,	#9
	ld	e, (hl)
	ld	a, e
	add	a, #0xfc
	ldhl	sp,	#6
	C$main.c$224$3_0$209	= .
	.globl	C$main.c$224$3_0$209
;main.c:224: UINT8 pieceBottom = pieceY + 4;
	ld	(hl+), a
	ld	a, e
	add	a, #0x04
	ld	(hl), a
	C$main.c$225$3_0$209	= .
	.globl	C$main.c$225$3_0$209
;main.c:225: UINT8 tileLeft = capturedX - 4;
	ldhl	sp,	#11
	ld	e, (hl)
	ld	a, e
	add	a, #0xfc
	ld	d, a
	C$main.c$226$3_0$209	= .
	.globl	C$main.c$226$3_0$209
;main.c:226: UINT8 tileRight = capturedX + 4;
	ld	a, e
	add	a, #0x04
	ldhl	sp,	#8
	C$main.c$227$3_0$209	= .
	.globl	C$main.c$227$3_0$209
;main.c:227: UINT8 tileTop = capturedY - 4;
	ld	(hl+), a
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	add	a, #0xfc
	ld	e, a
	C$main.c$228$3_0$209	= .
	.globl	C$main.c$228$3_0$209
;main.c:228: UINT8 tileBottom = capturedY + 4;
	ld	a, l
	add	a, #0x04
	ldhl	sp,	#9
	ld	(hl), a
	C$main.c$231$3_0$209	= .
	.globl	C$main.c$231$3_0$209
;main.c:231: if (tileLeft <= pieceRight && tileRight >= pieceLeft &&
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, d
	jr	C, 00109$
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#4
	sub	a, (hl)
	jr	C, 00109$
	C$main.c$232$3_0$209	= .
	.globl	C$main.c$232$3_0$209
;main.c:232: tileTop <= pieceBottom && tileBottom >= pieceTop) {
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, e
	jr	C, 00109$
	inc	hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#6
	sub	a, (hl)
	jr	C, 00109$
	C$main.c$233$4_0$210	= .
	.globl	C$main.c$233$4_0$210
;main.c:233: opponentPieces[i].x = 0;
	pop	hl
	ld	(hl), #0x00
	push	hl
	C$main.c$234$4_0$210	= .
	.globl	C$main.c$234$4_0$210
;main.c:234: opponentPieces[i].y = 0;
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	C$main.c$235$4_0$210	= .
	.globl	C$main.c$235$4_0$210
;main.c:235: return true;
	ld	a, #0x01
	jr	00110$
00109$:
	C$main.c$216$2_0$208	= .
	.globl	C$main.c$216$2_0$208
;main.c:216: for (int i = 0; i < 12; i++) {
	inc	bc
	jp	00108$
00106$:
	C$main.c$238$1_0$207	= .
	.globl	C$main.c$238$1_0$207
;main.c:238: return false;
	xor	a, a
00110$:
	C$main.c$239$1_0$207	= .
	.globl	C$main.c$239$1_0$207
;main.c:239: }
	add	sp, #12
	pop	hl
	pop	bc
	jp	(hl)
	G$isValidMove$0$0	= .
	.globl	G$isValidMove$0$0
	C$main.c$241$1_0$212	= .
	.globl	C$main.c$241$1_0$212
;main.c:241: bool isValidMove(UINT8 cursorx, UINT8 cursory, UINT8 currentPlayer, int selectedCoords) {
;	---------------------------------
; Function isValidMove
; ---------------------------------
_isValidMove::
	add	sp, #-20
	ldhl	sp,	#19
	ld	(hl-), a
	ld	(hl), e
	C$main.c$248$1_0$212	= .
	.globl	C$main.c$248$1_0$212
;main.c:248: if (currentPlayer == BLACK_PLAYER) {
	ldhl	sp,	#22
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
	C$main.c$249$2_0$213	= .
	.globl	C$main.c$249$2_0$213
;main.c:249: pieces = blackPieces;
	ldhl	sp,	#14
	ld	(hl), #<(_blackPieces)
	inc	hl
	ld	(hl), #>(_blackPieces)
	C$main.c$250$2_0$213	= .
	.globl	C$main.c$250$2_0$213
;main.c:250: opponentPieces = whitePieces;
	ldhl	sp,	#2
	ld	a, #<(_whitePieces)
	ld	(hl+), a
	C$main.c$251$2_0$213	= .
	.globl	C$main.c$251$2_0$213
;main.c:251: numPieces = MAX_BLACK_PIECES;
	ld	a, #>(_whitePieces)
	ld	(hl+), a
	ld	a, #0x0c
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	C$main.c$252$1_0$212	= .
	.globl	C$main.c$252$1_0$212
;main.c:252: numOpponentPieces = MAX_WHITE_PIECES;
	jr	00103$
00102$:
	C$main.c$254$2_0$214	= .
	.globl	C$main.c$254$2_0$214
;main.c:254: pieces = whitePieces;
	ldhl	sp,	#14
	ld	a, #<(_whitePieces)
	ld	(hl+), a
	ld	(hl), #>(_whitePieces)
	C$main.c$255$2_0$214	= .
	.globl	C$main.c$255$2_0$214
;main.c:255: opponentPieces = blackPieces;
	ldhl	sp,	#2
	ld	a, #<(_blackPieces)
	ld	(hl+), a
	C$main.c$256$2_0$214	= .
	.globl	C$main.c$256$2_0$214
;main.c:256: numPieces = MAX_WHITE_PIECES;
	ld	a, #>(_blackPieces)
	ld	(hl+), a
	ld	a, #0x0c
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	C$main.c$257$1_0$212	= .
	.globl	C$main.c$257$1_0$212
;main.c:257: numOpponentPieces = MAX_BLACK_PIECES;
00103$:
	C$main.c$261$1_0$212	= .
	.globl	C$main.c$261$1_0$212
;main.c:261: if (cursorx > 160 || cursorx <= 20 || cursory > 160 || cursory <= 20) {
	ld	a, #0xa0
	ldhl	sp,	#19
	sub	a, (hl)
	jr	C, 00104$
	ld	a, #0x14
	sub	a, (hl)
	jr	NC, 00104$
	dec	hl
	ld	a, #0xa0
	sub	a, (hl)
	jr	C, 00104$
	ld	a, #0x14
	sub	a, (hl)
	jr	C, 00105$
00104$:
	C$main.c$262$2_0$215	= .
	.globl	C$main.c$262$2_0$215
;main.c:262: return false;
	xor	a, a
	jp	00141$
00105$:
	C$main.c$266$1_0$212	= .
	.globl	C$main.c$266$1_0$212
;main.c:266: if (selectedCoords < 0 || selectedCoords >= numPieces) {
	ldhl	sp,	#24
	bit	7, (hl)
	jr	NZ, 00109$
	ldhl	sp,	#23
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00250$
	bit	7, d
	jr	NZ, 00251$
	cp	a, a
	jr	00251$
00250$:
	bit	7, d
	jr	Z, 00251$
	scf
00251$:
	jr	C, 00110$
00109$:
	C$main.c$267$2_0$216	= .
	.globl	C$main.c$267$2_0$216
;main.c:267: return false;
	xor	a, a
	jp	00141$
00110$:
	C$main.c$271$1_1$217	= .
	.globl	C$main.c$271$1_1$217
;main.c:271: int dx = cursorx - pieces[selectedCoords].x;
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#23
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#14
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#18
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#17
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	C$main.c$272$1_1$217	= .
	.globl	C$main.c$272$1_1$217
;main.c:272: int dy = cursory - pieces[selectedCoords].y;
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#16
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#15
	ld	(hl), a
	ldhl	sp,	#12
	ld	(hl+), a
	ld	(hl), #0x00
	pop	de
	push	de
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	C$main.c$275$1_1$217	= .
	.globl	C$main.c$275$1_1$217
;main.c:275: if (abs(dx) != abs(dy)) {
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_abs
	pop	hl
	push	de
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_abs
	pop	hl
	pop	bc
	ld	a, e
	sub	a, c
	jr	NZ, 00252$
	ld	a, d
	sub	a, b
	jr	Z, 00113$
00252$:
	C$main.c$276$2_1$218	= .
	.globl	C$main.c$276$2_1$218
;main.c:276: return false;
	xor	a, a
	jp	00141$
00113$:
	C$main.c$280$1_1$212	= .
	.globl	C$main.c$280$1_1$212
;main.c:280: if ((currentPlayer == BLACK_PLAYER && dy < 0 && !pieces[selectedCoords].isKing) ||
	ldhl	sp,	#13
	ld	a, (hl+)
	rlca
	and	a,#0x01
	ld	(hl+), a
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ldhl	sp,	#22
	ld	a, (hl)
	or	a, a
	jr	NZ, 00120$
	ldhl	sp,	#14
	ld	a, (hl)
	or	a, a
	jr	Z, 00120$
	ld	a, (bc)
	ld	e, a
	bit	0, e
	jr	Z, 00114$
00120$:
	C$main.c$281$1_1$217	= .
	.globl	C$main.c$281$1_1$217
;main.c:281: (currentPlayer == WHITE_PLAYER && dy > 0 && !pieces[selectedCoords].isKing)) {
	ldhl	sp,	#22
	ld	a, (hl)
	dec	a
	jr	NZ, 00160$
	ldhl	sp,	#12
	xor	a, a
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00255$
	bit	7, d
	jr	NZ, 00256$
	cp	a, a
	jr	00256$
00255$:
	bit	7, d
	jr	Z, 00256$
	scf
00256$:
	jr	NC, 00160$
	ld	a, (bc)
	ld	c, a
	bit	0, c
	jr	NZ, 00160$
00114$:
	C$main.c$282$2_1$219	= .
	.globl	C$main.c$282$2_1$219
;main.c:282: return false;
	xor	a, a
	jp	00141$
	C$main.c$286$1_1$212	= .
	.globl	C$main.c$286$1_1$212
;main.c:286: for (int i = 0; i < numPieces; i++) {
00160$:
	ld	bc, #0x0000
00139$:
	ldhl	sp,	#4
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00257$
	bit	7, d
	jr	NZ, 00258$
	cp	a, a
	jr	00258$
00257$:
	bit	7, d
	jr	Z, 00258$
	scf
00258$:
	jr	NC, 00127$
	C$main.c$287$1_1$212	= .
	.globl	C$main.c$287$1_1$212
;main.c:287: if (whitePieces[i].x == cursorx && whitePieces[i].y == cursory) {
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl), a
	ld	de, #_whitePieces
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#17
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	jr	NZ, 00122$
	inc	de
	ld	a, (de)
	ld	e, a
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00122$
	C$main.c$288$4_1$222	= .
	.globl	C$main.c$288$4_1$222
;main.c:288: return false;
	xor	a, a
	jp	00141$
00122$:
	C$main.c$290$1_1$212	= .
	.globl	C$main.c$290$1_1$212
;main.c:290: if (blackPieces[i].x == cursorx && blackPieces[i].y == cursory) {
	ld	de, #_blackPieces
	ldhl	sp,	#15
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#17
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	jr	NZ, 00140$
	inc	de
	ld	a, (de)
	ld	e, a
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00140$
	C$main.c$291$4_1$223	= .
	.globl	C$main.c$291$4_1$223
;main.c:291: return false;
	xor	a, a
	jp	00141$
00140$:
	C$main.c$286$2_1$220	= .
	.globl	C$main.c$286$2_1$220
;main.c:286: for (int i = 0; i < numPieces; i++) {
	inc	bc
	jr	00139$
00127$:
	C$main.c$296$1_1$217	= .
	.globl	C$main.c$296$1_1$217
;main.c:296: if (abs(dx) > 2 * SQUARE_SIZE || abs(dy) > 2 * SQUARE_SIZE) {
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_abs
	pop	hl
	ld	c, e
	ld	b, d
	ld	e, b
	ld	d, #0x00
	ld	a, #0x20
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00267$
	bit	7, d
	jr	NZ, 00268$
	cp	a, a
	jr	00268$
00267$:
	bit	7, d
	jr	Z, 00268$
	scf
00268$:
	jr	C, 00134$
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_abs
	pop	hl
	ld	c, e
	ld	b, d
	ld	e, b
	ld	d, #0x00
	ld	a, #0x20
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00269$
	bit	7, d
	jr	NZ, 00270$
	cp	a, a
	jr	00270$
00269$:
	bit	7, d
	jr	Z, 00270$
	scf
00270$:
	jr	NC, 00135$
00134$:
	C$main.c$297$2_1$224	= .
	.globl	C$main.c$297$2_1$224
;main.c:297: return false;
	xor	a, a
	jr	00141$
00135$:
	C$main.c$298$1_1$217	= .
	.globl	C$main.c$298$1_1$217
;main.c:298: } else if (abs(dx) == 2 * SQUARE_SIZE || abs(dy) == 2 * SQUARE_SIZE) {
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_abs
	pop	hl
	ld	a, e
	sub	a, #0x20
	or	a, d
	jr	Z, 00131$
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_abs
	pop	hl
	ld	a, e
	sub	a, #0x20
	or	a, d
	jr	NZ, 00136$
00131$:
	C$main.c$300$2_1$225	= .
	.globl	C$main.c$300$2_1$225
;main.c:300: UINT8 capturedX = pieces[selectedCoords].x + (dx / 2);
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#17
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00143$
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
00143$:
	sra	b
	rr	c
	ldhl	sp,	#17
	ld	a, (hl)
	add	a, c
	ld	b, a
	C$main.c$301$2_1$225	= .
	.globl	C$main.c$301$2_1$225
;main.c:301: UINT8 capturedY = pieces[selectedCoords].y + (dy / 2);
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	or	a, a
	jr	Z, 00144$
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
00144$:
	sra	d
	rr	e
	ld	a, e
	add	a, c
	ld	c, a
	C$main.c$302$2_1$225	= .
	.globl	C$main.c$302$2_1$225
;main.c:302: if (checkCapture(capturedX, capturedY, opponentPieces)) {
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	e, c
	ld	a, b
	call	_checkCapture
	ld	c, a
	bit	0, c
	jr	Z, 00129$
	C$main.c$303$3_1$226	= .
	.globl	C$main.c$303$3_1$226
;main.c:303: return true;
	ld	a, #0x01
	jr	00141$
00129$:
	C$main.c$305$3_1$227	= .
	.globl	C$main.c$305$3_1$227
;main.c:305: return false;
	xor	a, a
	jr	00141$
00136$:
	C$main.c$310$1_1$217	= .
	.globl	C$main.c$310$1_1$217
;main.c:310: return true;
	ld	a, #0x01
00141$:
	C$main.c$311$1_1$212	= .
	.globl	C$main.c$311$1_1$212
;main.c:311: }
	add	sp, #20
	pop	hl
	add	sp, #3
	jp	(hl)
	G$checkCollision$0$0	= .
	.globl	G$checkCollision$0$0
	C$main.c$313$1_1$229	= .
	.globl	C$main.c$313$1_1$229
;main.c:313: bool checkCollision(UINT8 cursorx, UINT8 cursory, int currentPlayer) {
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	add	sp, #-14
	ldhl	sp,	#13
	ld	(hl-), a
	ld	(hl), e
	C$main.c$318$1_0$229	= .
	.globl	C$main.c$318$1_0$229
;main.c:318: if (currentPlayer == BLACK_PLAYER) {
	ldhl	sp,	#17
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00102$
	C$main.c$319$2_0$230	= .
	.globl	C$main.c$319$2_0$230
;main.c:319: pieces = blackPieces;
	ldhl	sp,	#0
	ld	a, #<(_blackPieces)
	ld	(hl+), a
	C$main.c$320$2_0$230	= .
	.globl	C$main.c$320$2_0$230
;main.c:320: numPieces = 12;
	ld	a, #>(_blackPieces)
	ld	(hl+), a
	ld	a, #0x0c
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jr	00103$
00102$:
	C$main.c$322$2_0$231	= .
	.globl	C$main.c$322$2_0$231
;main.c:322: pieces = whitePieces;
	ldhl	sp,	#0
	ld	a, #<(_whitePieces)
	ld	(hl+), a
	C$main.c$323$2_0$231	= .
	.globl	C$main.c$323$2_0$231
;main.c:323: numPieces = 12;
	ld	a, #>(_whitePieces)
	ld	(hl+), a
	ld	a, #0x0c
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00103$:
	C$main.c$327$3_0$232	= .
	.globl	C$main.c$327$3_0$232
;main.c:327: for (int i = 0; i < numPieces; i++) {
	xor	a, a
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), a
	ld	bc, #0x0000
00114$:
	ldhl	sp,	#2
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00158$
	bit	7, d
	jr	NZ, 00159$
	cp	a, a
	jr	00159$
00158$:
	bit	7, d
	jr	Z, 00159$
	scf
00159$:
	jp	NC, 00112$
	C$main.c$328$3_0$233	= .
	.globl	C$main.c$328$3_0$233
;main.c:328: UINT8 pieceX = pieces[i].x;
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	C$main.c$329$3_0$233	= .
	.globl	C$main.c$329$3_0$233
;main.c:329: UINT8 pieceY = pieces[i].y;
	inc	de
	ld	a, (de)
	ld	e, a
	C$main.c$332$3_0$233	= .
	.globl	C$main.c$332$3_0$233
;main.c:332: UINT8 pieceLeft = pieceX - 4;
	ld	a, l
	add	a, #0xfc
	ld	d, a
	C$main.c$333$3_0$233	= .
	.globl	C$main.c$333$3_0$233
;main.c:333: UINT8 pieceRight = pieceX + 4;
	ld	a, l
	add	a, #0x04
	ldhl	sp,	#6
	C$main.c$334$3_0$233	= .
	.globl	C$main.c$334$3_0$233
;main.c:334: UINT8 pieceTop = pieceY - 4;
	ld	(hl+), a
	ld	a, e
	add	a, #0xfc
	C$main.c$335$3_0$233	= .
	.globl	C$main.c$335$3_0$233
;main.c:335: UINT8 pieceBottom = pieceY + 4;
	ld	(hl+), a
	ld	a, e
	add	a, #0x04
	ld	(hl), a
	C$main.c$338$3_0$233	= .
	.globl	C$main.c$338$3_0$233
;main.c:338: UINT8 cursorLeft = cursorx - 4;
	ldhl	sp,	#13
	ld	e, (hl)
	ld	a, e
	add	a, #0xfc
	ldhl	sp,	#9
	C$main.c$339$3_0$233	= .
	.globl	C$main.c$339$3_0$233
;main.c:339: UINT8 cursorRight = cursorx + 4;
	ld	(hl+), a
	ld	a, e
	add	a, #0x04
	C$main.c$340$3_0$233	= .
	.globl	C$main.c$340$3_0$233
;main.c:340: UINT8 cursorTop = cursory - 4;
	ld	(hl+), a
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	add	a, #0xfc
	ld	e, a
	C$main.c$341$3_0$233	= .
	.globl	C$main.c$341$3_0$233
;main.c:341: UINT8 cursorBottom = cursory + 4;
	ld	a, l
	add	a, #0x04
	ldhl	sp,	#11
	ld	(hl), a
	C$main.c$344$3_0$233	= .
	.globl	C$main.c$344$3_0$233
;main.c:344: if (cursorLeft <= pieceRight && cursorRight >= pieceLeft &&
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#9
	sub	a, (hl)
	jr	C, 00115$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	C, 00115$
	C$main.c$345$3_0$233	= .
	.globl	C$main.c$345$3_0$233
;main.c:345: cursorTop <= pieceBottom && cursorBottom >= pieceTop) {
	dec	hl
	dec	hl
	ld	a, (hl)
	sub	a, e
	jr	C, 00115$
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#7
	sub	a, (hl)
	jr	C, 00115$
	C$main.c$346$4_0$234	= .
	.globl	C$main.c$346$4_0$234
;main.c:346: if (currentPlayer == BLACK_PLAYER) {
	ldhl	sp,	#17
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00105$
	C$main.c$347$5_0$235	= .
	.globl	C$main.c$347$5_0$235
;main.c:347: selectedCoords = i;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_selectedCoords),a
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#_selectedCoords + 1),a
	C$main.c$348$5_0$235	= .
	.globl	C$main.c$348$5_0$235
;main.c:348: selectedPieceIndex = i + 4;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_selectedPieceIndex
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	jr	00106$
00105$:
	C$main.c$350$5_0$236	= .
	.globl	C$main.c$350$5_0$236
;main.c:350: selectedCoords = i;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_selectedCoords),a
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#_selectedCoords + 1),a
	C$main.c$351$5_0$236	= .
	.globl	C$main.c$351$5_0$236
;main.c:351: selectedPieceIndex = i + 16;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_selectedPieceIndex
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00106$:
	C$main.c$353$4_0$234	= .
	.globl	C$main.c$353$4_0$234
;main.c:353: return true;
	ld	a, #0x01
	jr	00116$
00115$:
	C$main.c$327$2_0$232	= .
	.globl	C$main.c$327$2_0$232
;main.c:327: for (int i = 0; i < numPieces; i++) {
	inc	bc
	ldhl	sp,	#4
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jp	00114$
00112$:
	C$main.c$357$1_0$229	= .
	.globl	C$main.c$357$1_0$229
;main.c:357: selectedPieceIndex = -1;
	ld	hl, #_selectedPieceIndex
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$main.c$358$1_0$229	= .
	.globl	C$main.c$358$1_0$229
;main.c:358: return false;
	xor	a, a
00116$:
	C$main.c$359$1_0$229	= .
	.globl	C$main.c$359$1_0$229
;main.c:359: }
	add	sp, #14
	pop	hl
	pop	bc
	jp	(hl)
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$361$1_0$237	= .
	.globl	C$main.c$361$1_0$237
;main.c:361: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	dec	sp
	dec	sp
	C$main.c$362$1_0$237	= .
	.globl	C$main.c$362$1_0$237
;main.c:362: font();
	call	_font
	C$main.c$363$1_0$237	= .
	.globl	C$main.c$363$1_0$237
;main.c:363: printTurn();
	call	_printTurn
	C$main.c$364$1_0$237	= .
	.globl	C$main.c$364$1_0$237
;main.c:364: printbkg();
	call	_printbkg
	C$main.c$365$1_0$237	= .
	.globl	C$main.c$365$1_0$237
;main.c:365: printSquare();
	call	_printSquare
	C$main.c$366$1_0$237	= .
	.globl	C$main.c$366$1_0$237
;main.c:366: printBlack();
	call	_printBlack
	C$main.c$367$1_0$237	= .
	.globl	C$main.c$367$1_0$237
;main.c:367: printWhite();
	call	_printWhite
	C$main.c$368$1_0$237	= .
	.globl	C$main.c$368$1_0$237
;main.c:368: SHOW_BKG;  
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	C$main.c$369$1_0$237	= .
	.globl	C$main.c$369$1_0$237
;main.c:369: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
	C$main.c$370$1_0$237	= .
	.globl	C$main.c$370$1_0$237
;main.c:370: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
	C$main.c$372$1_1$238	= .
	.globl	C$main.c$372$1_1$238
;main.c:372: while(1) {
00139$:
	C$main.c$373$2_1$239	= .
	.globl	C$main.c$373$2_1$239
;main.c:373: joypad_input = joypad();
	call	_joypad
	ld	hl, #_joypad_input
	ld	(hl), a
	C$main.c$375$2_1$239	= .
	.globl	C$main.c$375$2_1$239
;main.c:375: if (joypad_input != lastButtonState) {
	ld	a, (hl)
	ld	hl, #_lastButtonState
	sub	a, (hl)
	jr	Z, 00104$
	C$main.c$376$3_1$240	= .
	.globl	C$main.c$376$3_1$240
;main.c:376: debounceTimer = 0; // Reset the debounce timer
	xor	a, a
	ld	hl, #_debounceTimer
	ld	(hl+), a
	ld	(hl), a
	C$main.c$377$3_1$240	= .
	.globl	C$main.c$377$3_1$240
;main.c:377: lastButtonState = joypad_input;
	ld	a, (#_joypad_input)
	ld	(#_lastButtonState),a
	jr	00105$
00104$:
	C$main.c$378$2_1$239	= .
	.globl	C$main.c$378$2_1$239
;main.c:378: } else if (debounceTimer < DEBOUNCE_DELAY) {
	ld	hl, #_debounceTimer
	ld	a, (hl+)
	sub	a, #0x06
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00105$
	C$main.c$379$3_1$241	= .
	.globl	C$main.c$379$3_1$241
;main.c:379: debounceTimer += 100; // Increment the debounce timer based on the loop delay (100ms in this code)
	dec	hl
	ld	a, (hl)
	add	a, #0x64
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
	C$main.c$380$3_1$241	= .
	.globl	C$main.c$380$3_1$241
;main.c:380: continue; // Skip processing input until the debounce delay is reached
	jr	00139$
00105$:
	C$main.c$383$2_1$239	= .
	.globl	C$main.c$383$2_1$239
;main.c:383: dpad();
	call	_dpad
	C$main.c$384$2_1$239	= .
	.globl	C$main.c$384$2_1$239
;main.c:384: if (joypad_input & J_A) {
	ld	a, (#_joypad_input)
	bit	4, a
	jp	Z,00135$
	C$main.c$385$3_1$242	= .
	.globl	C$main.c$385$3_1$242
;main.c:385: if (pieceSelected == false) {
	ld	hl, #_pieceSelected
	bit	0, (hl)
	jp	NZ, 00135$
	C$main.c$386$4_1$243	= .
	.globl	C$main.c$386$4_1$243
;main.c:386: checkCollision(cursorx, cursory, currentPlayer);
	ld	hl, #_currentPlayer
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	hl, #_cursory
	ld	e, (hl)
	ld	a, (#_cursorx)
	call	_checkCollision
	C$main.c$388$1_1$237	= .
	.globl	C$main.c$388$1_1$237
;main.c:388: if (selectedPieceIndex >= 4 && selectedPieceIndex < 16){
	ld	hl, #_selectedPieceIndex
	ld	a, (hl+)
	sub	a, #0x10
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00236$
	bit	7, d
	jr	NZ, 00237$
	cp	a, a
	jr	00237$
00236$:
	bit	7, d
	jr	Z, 00237$
	scf
00237$:
	ld	a, #0x00
	rla
	ld	c, a
	C$main.c$387$4_1$243	= .
	.globl	C$main.c$387$4_1$243
;main.c:387: if (currentPlayer == BLACK_PLAYER) {
	ld	a, (#_currentPlayer)
	or	a, a
	jr	NZ, 00113$
	C$main.c$388$5_1$244	= .
	.globl	C$main.c$388$5_1$244
;main.c:388: if (selectedPieceIndex >= 4 && selectedPieceIndex < 16){
	ld	hl, #_selectedPieceIndex
	ld	a, (hl+)
	sub	a, #0x04
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00238$
	bit	7, d
	jr	NZ, 00239$
	cp	a, a
	jr	00239$
00238$:
	bit	7, d
	jr	Z, 00239$
	scf
00239$:
	jr	C, 00135$
	ld	a, c
	or	a, a
	jr	Z, 00135$
	C$main.c$389$6_1$245	= .
	.globl	C$main.c$389$6_1$245
;main.c:389: pieceSelected = true;
	ld	hl, #_pieceSelected
	ld	(hl), #0x01
	jr	00135$
00113$:
	C$main.c$391$4_1$243	= .
	.globl	C$main.c$391$4_1$243
;main.c:391: } else if (selectedPieceIndex >= 16 && selectedPieceIndex < 28) {
	bit	0, c
	jr	NZ, 00135$
	ld	hl, #_selectedPieceIndex
	ld	a, (hl+)
	sub	a, #0x1c
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00240$
	bit	7, d
	jr	NZ, 00241$
	cp	a, a
	jr	00241$
00240$:
	bit	7, d
	jr	Z, 00241$
	scf
00241$:
	jr	NC, 00135$
	C$main.c$392$5_1$246	= .
	.globl	C$main.c$392$5_1$246
;main.c:392: pieceSelected = true;
	ld	hl, #_pieceSelected
	ld	(hl), #0x01
	C$main.c$396$2_1$239	= .
	.globl	C$main.c$396$2_1$239
;main.c:396: while (pieceSelected == true) {
00135$:
	ld	hl, #_pieceSelected
	bit	0, (hl)
	jp	Z, 00137$
	C$main.c$397$3_1$247	= .
	.globl	C$main.c$397$3_1$247
;main.c:397: delay(100);
	ld	de, #0x0064
	call	_delay
	C$main.c$398$3_1$247	= .
	.globl	C$main.c$398$3_1$247
;main.c:398: joypad_input = joypad(); // Update the input inside the loop
	call	_joypad
	ld	(#_joypad_input),a
	C$main.c$399$3_1$247	= .
	.globl	C$main.c$399$3_1$247
;main.c:399: dpad();
	call	_dpad
;main.c:400: move_sprite(selectedPieceIndex, cursorx, cursory);
	ld	hl, #_cursory
	ld	b, (hl)
	ld	hl, #_cursorx
	ld	c, (hl)
	ld	hl, #_selectedPieceIndex
;c:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$main.c$377$1_1$237	= .
	.globl	C$main.c$377$1_1$237
;main.c:377: lastButtonState = joypad_input;
	ld	a, (#_joypad_input)
	C$main.c$401$3_1$247	= .
	.globl	C$main.c$401$3_1$247
;main.c:401: if (joypad_input & J_A) {
	bit	4, a
	jp	Z,00132$
	C$main.c$402$4_1$248	= .
	.globl	C$main.c$402$4_1$248
;main.c:402: if (currentPlayer == BLACK_PLAYER){
	ld	a, (#_currentPlayer)
	or	a, a
	jr	NZ, 00120$
	C$main.c$403$5_1$249	= .
	.globl	C$main.c$403$5_1$249
;main.c:403: input = blackPieces;
	ldhl	sp,	#0
	ld	(hl), #<(_blackPieces)
	inc	hl
	ld	(hl), #>(_blackPieces)
	jr	00121$
00120$:
	C$main.c$405$5_1$250	= .
	.globl	C$main.c$405$5_1$250
;main.c:405: input = whitePieces;
	ldhl	sp,	#0
	ld	a, #<(_whitePieces)
	ld	(hl+), a
	ld	(hl), #>(_whitePieces)
00121$:
	C$main.c$407$4_1$248	= .
	.globl	C$main.c$407$4_1$248
;main.c:407: if (cursorx == input[selectedCoords].x && cursory == input[selectedCoords].y){
	ld	hl, #_selectedCoords
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e, a
	ld	a, (#_cursorx)
	sub	a, e
	jr	NZ, 00128$
	inc	bc
	ld	a, (bc)
	ld	c, a
	ld	a, (#_cursory)
	sub	a, c
	jr	Z, 00129$
00128$:
	C$main.c$410$5_1$252	= .
	.globl	C$main.c$410$5_1$252
;main.c:410: if (isValidMove(cursorx, cursory, currentPlayer, selectedCoords)) {
	ld	hl, #_selectedCoords
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	a, (#_currentPlayer)
	push	af
	inc	sp
	ld	hl, #_cursory
	ld	e, (hl)
	ld	a, (#_cursorx)
	call	_isValidMove
	bit	0,a
	jr	Z, 00129$
	C$main.c$411$6_1$253	= .
	.globl	C$main.c$411$6_1$253
;main.c:411: modifyCoordinates(input, selectedCoords, cursorx, cursory);
	ld	hl, #_cursory
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_cursorx
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	ld	hl, #_selectedCoords
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_modifyCoordinates
	C$main.c$412$6_1$253	= .
	.globl	C$main.c$412$6_1$253
;main.c:412: pieceSelected = false;
	ld	hl, #_pieceSelected
	ld	(hl), #0x00
	C$main.c$413$6_1$253	= .
	.globl	C$main.c$413$6_1$253
;main.c:413: if (currentPlayer == BLACK_PLAYER) {
	ld	hl, #_currentPlayer
	ld	a, (hl)
	or	a, a
	jr	NZ, 00123$
	C$main.c$414$7_1$254	= .
	.globl	C$main.c$414$7_1$254
;main.c:414: currentPlayer = WHITE_PLAYER;
	ld	(hl), #0x01
	jr	00124$
00123$:
	C$main.c$416$7_1$255	= .
	.globl	C$main.c$416$7_1$255
;main.c:416: currentPlayer = BLACK_PLAYER;
	ld	hl, #_currentPlayer
	ld	(hl), #0x00
00124$:
	C$main.c$418$6_1$253	= .
	.globl	C$main.c$418$6_1$253
;main.c:418: printBlack();
	call	_printBlack
	C$main.c$419$6_1$253	= .
	.globl	C$main.c$419$6_1$253
;main.c:419: printWhite();
	call	_printWhite
00129$:
	C$main.c$422$4_1$248	= .
	.globl	C$main.c$422$4_1$248
;main.c:422: printTurn();
	call	_printTurn
	C$main.c$423$4_1$248	= .
	.globl	C$main.c$423$4_1$248
;main.c:423: break; // Exit the loop after a piece has been moved
	jr	00137$
00132$:
	C$main.c$425$3_1$247	= .
	.globl	C$main.c$425$3_1$247
;main.c:425: if (joypad_input & J_B) {
	bit	5, a
	jp	Z,00135$
	C$main.c$426$4_1$256	= .
	.globl	C$main.c$426$4_1$256
;main.c:426: pieceSelected = false;
	ld	hl, #_pieceSelected
	ld	(hl), #0x00
	C$main.c$427$4_1$256	= .
	.globl	C$main.c$427$4_1$256
;main.c:427: printBlack();
	call	_printBlack
	C$main.c$428$4_1$256	= .
	.globl	C$main.c$428$4_1$256
;main.c:428: printWhite();
	call	_printWhite
	C$main.c$429$2_1$239	= .
	.globl	C$main.c$429$2_1$239
;main.c:429: break;
00137$:
	C$main.c$432$2_1$239	= .
	.globl	C$main.c$432$2_1$239
;main.c:432: delay(100);
	ld	de, #0x0064
	call	_delay
	jp	00139$
	C$main.c$434$1_1$237	= .
	.globl	C$main.c$434$1_1$237
;main.c:434: }
	inc	sp
	inc	sp
	C$main.c$434$1_1$237	= .
	.globl	C$main.c$434$1_1$237
	XG$main$0$0	= .
	.globl	XG$main$0$0
	ret
	.area _CODE
	.area _INITIALIZER
Fmain$__xinit_lastButtonState$0_0$0 == .
__xinit__lastButtonState:
	.db #0x00	; 0
Fmain$__xinit_debounceTimer$0_0$0 == .
__xinit__debounceTimer:
	.dw #0x0000
Fmain$__xinit_selectedPieceIndex$0_0$0 == .
__xinit__selectedPieceIndex:
	.dw #0xffff
Fmain$__xinit_cursorx$0_0$0 == .
__xinit__cursorx:
	.db #0x1c	; 28
Fmain$__xinit_cursory$0_0$0 == .
__xinit__cursory:
	.db #0x1c	; 28
Fmain$__xinit_currentPlayer$0_0$0 == .
__xinit__currentPlayer:
	.db #0x00	; 0
Fmain$__xinit_selectedCoords$0_0$0 == .
__xinit__selectedCoords:
	.dw #0x0000
Fmain$__xinit_pieceSelected$0_0$0 == .
__xinit__pieceSelected:
	.db #0x00	;  0
Fmain$__xinit_tile1$0_0$0 == .
__xinit__tile1:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
Fmain$__xinit_tile2$0_0$0 == .
__xinit__tile2:
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
Fmain$__xinit_tile3$0_0$0 == .
__xinit__tile3:
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
Fmain$__xinit_map$0_0$0 == .
__xinit__map:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
Fmain$__xinit_squareTL$0_0$0 == .
__xinit__squareTL:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
Fmain$__xinit_squareTR$0_0$0 == .
__xinit__squareTR:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
Fmain$__xinit_squareBL$0_0$0 == .
__xinit__squareBL:
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
Fmain$__xinit_squareBR$0_0$0 == .
__xinit__squareBR:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
Fmain$__xinit_black_piece$0_0$0 == .
__xinit__black_piece:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
Fmain$__xinit_white_piece$0_0$0 == .
__xinit__white_piece:
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
Fmain$__xinit_currentPlayerBlackText$0_0$0 == .
__xinit__currentPlayerBlackText:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x6c	; 108	'l'
	.db #0x61	; 97	'a'
	.db #0x79	; 121	'y'
	.db #0x65	; 101	'e'
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x6c	; 108	'l'
	.db #0x61	; 97	'a'
	.db #0x63	; 99	'c'
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0x00	; 0
Fmain$__xinit_currentPlayerWhiteText$0_0$0 == .
__xinit__currentPlayerWhiteText:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x6c	; 108	'l'
	.db #0x61	; 97	'a'
	.db #0x79	; 121	'y'
	.db #0x65	; 101	'e'
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x57	; 87	'W'
	.db #0x68	; 104	'h'
	.db #0x69	; 105	'i'
	.db #0x74	; 116	't'
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x00	; 0
Fmain$__xinit_blackKing$0_0$0 == .
__xinit__blackKing:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdb	; 219
	.db #0xff	; 255
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
Fmain$__xinit_whiteKing$0_0$0 == .
__xinit__whiteKing:
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xdb	; 219
	.db #0x24	; 36
	.db #0x66	; 102	'f'
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
Fmain$__xinit_blackPieces$0_0$0 == .
__xinit__blackPieces:
	.db #0x2c	; 44
	.db #0x1c	; 28
	.db #0x00	;  0
	.db #0x4c	; 76	'L'
	.db #0x1c	; 28
	.db #0x00	;  0
	.db #0x6c	; 108	'l'
	.db #0x1c	; 28
	.db #0x00	;  0
	.db #0x8c	; 140
	.db #0x1c	; 28
	.db #0x00	;  0
	.db #0x1c	; 28
	.db #0x2c	; 44
	.db #0x00	;  0
	.db #0x3c	; 60
	.db #0x2c	; 44
	.db #0x00	;  0
	.db #0x5c	; 92
	.db #0x2c	; 44
	.db #0x00	;  0
	.db #0x7c	; 124
	.db #0x2c	; 44
	.db #0x00	;  0
	.db #0x2c	; 44
	.db #0x3c	; 60
	.db #0x00	;  0
	.db #0x4c	; 76	'L'
	.db #0x3c	; 60
	.db #0x00	;  0
	.db #0x6c	; 108	'l'
	.db #0x3c	; 60
	.db #0x00	;  0
	.db #0x8c	; 140
	.db #0x3c	; 60
	.db #0x00	;  0
Fmain$__xinit_whitePieces$0_0$0 == .
__xinit__whitePieces:
	.db #0x1c	; 28
	.db #0x8c	; 140
	.db #0x00	;  0
	.db #0x3c	; 60
	.db #0x8c	; 140
	.db #0x00	;  0
	.db #0x5c	; 92
	.db #0x8c	; 140
	.db #0x00	;  0
	.db #0x7c	; 124
	.db #0x8c	; 140
	.db #0x00	;  0
	.db #0x2c	; 44
	.db #0x7c	; 124
	.db #0x00	;  0
	.db #0x4c	; 76	'L'
	.db #0x7c	; 124
	.db #0x00	;  0
	.db #0x6c	; 108	'l'
	.db #0x7c	; 124
	.db #0x00	;  0
	.db #0x8c	; 140
	.db #0x7c	; 124
	.db #0x00	;  0
	.db #0x1c	; 28
	.db #0x6c	; 108	'l'
	.db #0x00	;  0
	.db #0x3c	; 60
	.db #0x6c	; 108	'l'
	.db #0x00	;  0
	.db #0x5c	; 92
	.db #0x6c	; 108	'l'
	.db #0x00	;  0
	.db #0x7c	; 124
	.db #0x6c	; 108	'l'
	.db #0x00	;  0
	.area _CABS (ABS)
