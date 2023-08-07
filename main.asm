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
	.globl _testMoves
	.globl _testValidMove
	.globl _isCaptureMove
	.globl _isValidMove
	.globl _capture
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
	G$capture$0$0	= .
	.globl	G$capture$0$0
	C$main.c$213$1_0$207	= .
	.globl	C$main.c$213$1_0$207
;main.c:213: bool capture(UINT8 capturedX, UINT8 capturedY, Piece* opponentPieces) {
;	---------------------------------
; Function capture
; ---------------------------------
_capture::
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
	C$main.c$295$1_1$217	= .
	.globl	C$main.c$295$1_1$217
;main.c:295: if (abs(dx) > 2 * SQUARE_SIZE || abs(dy) > 2 * SQUARE_SIZE) {
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
	C$main.c$296$2_1$224	= .
	.globl	C$main.c$296$2_1$224
;main.c:296: return false;
	xor	a, a
	jr	00141$
00135$:
	C$main.c$297$1_1$217	= .
	.globl	C$main.c$297$1_1$217
;main.c:297: } else if (abs(dx) == 2 * SQUARE_SIZE || abs(dy) == 2 * SQUARE_SIZE) {
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
	C$main.c$299$2_1$225	= .
	.globl	C$main.c$299$2_1$225
;main.c:299: UINT8 capturedX = pieces[selectedCoords].x + (dx / 2);
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
	C$main.c$300$2_1$225	= .
	.globl	C$main.c$300$2_1$225
;main.c:300: UINT8 capturedY = pieces[selectedCoords].y + (dy / 2);
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
	C$main.c$301$2_1$225	= .
	.globl	C$main.c$301$2_1$225
;main.c:301: if (capture(capturedX, capturedY, opponentPieces)) {
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	e, c
	ld	a, b
	call	_capture
	ld	c, a
	bit	0, c
	jr	Z, 00129$
	C$main.c$302$3_1$226	= .
	.globl	C$main.c$302$3_1$226
;main.c:302: return true;
	ld	a, #0x01
	jr	00141$
00129$:
	C$main.c$304$3_1$227	= .
	.globl	C$main.c$304$3_1$227
;main.c:304: return false;
	xor	a, a
	jr	00141$
00136$:
	C$main.c$307$1_1$217	= .
	.globl	C$main.c$307$1_1$217
;main.c:307: return true;
	ld	a, #0x01
00141$:
	C$main.c$308$1_1$212	= .
	.globl	C$main.c$308$1_1$212
;main.c:308: }
	add	sp, #20
	pop	hl
	add	sp, #3
	jp	(hl)
	G$isCaptureMove$0$0	= .
	.globl	G$isCaptureMove$0$0
	C$main.c$310$1_1$229	= .
	.globl	C$main.c$310$1_1$229
;main.c:310: bool isCaptureMove(UINT8 cursorx, UINT8 cursory, int currentPlayer, int selectedCoords) {
;	---------------------------------
; Function isCaptureMove
; ---------------------------------
_isCaptureMove::
	add	sp, #-10
	ldhl	sp,	#9
	ld	(hl-), a
	ld	(hl), e
	C$main.c$317$1_0$229	= .
	.globl	C$main.c$317$1_0$229
;main.c:317: if (currentPlayer == BLACK_PLAYER) {
	ldhl	sp,	#13
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00102$
	C$main.c$318$2_0$230	= .
	.globl	C$main.c$318$2_0$230
;main.c:318: pieces = blackPieces;
	ldhl	sp,	#4
	ld	(hl), #<(_blackPieces)
	inc	hl
	ld	(hl), #>(_blackPieces)
	C$main.c$319$2_0$230	= .
	.globl	C$main.c$319$2_0$230
;main.c:319: opponentPieces = whitePieces;
	ldhl	sp,	#0
	ld	a, #<(_whitePieces)
	ld	(hl+), a
	ld	(hl), #>(_whitePieces)
	C$main.c$321$1_0$229	= .
	.globl	C$main.c$321$1_0$229
;main.c:321: numOpponentPieces = MAX_WHITE_PIECES;
	jr	00103$
00102$:
	C$main.c$323$2_0$231	= .
	.globl	C$main.c$323$2_0$231
;main.c:323: pieces = whitePieces;
	ldhl	sp,	#4
	ld	(hl), #<(_whitePieces)
	inc	hl
	ld	(hl), #>(_whitePieces)
	C$main.c$324$2_0$231	= .
	.globl	C$main.c$324$2_0$231
;main.c:324: opponentPieces = blackPieces;
	ldhl	sp,	#0
	ld	(hl), #<(_blackPieces)
	inc	hl
	ld	(hl), #>(_blackPieces)
	C$main.c$326$1_0$229	= .
	.globl	C$main.c$326$1_0$229
;main.c:326: numOpponentPieces = MAX_BLACK_PIECES;
00103$:
	C$main.c$329$1_1$232	= .
	.globl	C$main.c$329$1_1$232
;main.c:329: int dx = cursorx - pieces[selectedCoords].x;
	ldhl	sp,	#9
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ldhl	sp,	#6
	ld	(hl), c
	inc	hl
	C$main.c$330$1_1$232	= .
	.globl	C$main.c$330$1_1$232
;main.c:330: int dy = cursory - pieces[selectedCoords].y;
	ld	(hl+), a
	C$main.c$331$1_1$232	= .
	.globl	C$main.c$331$1_1$232
;main.c:331: if (abs(dx) == 2 * SQUARE_SIZE || abs(dy) == 2 * SQUARE_SIZE) {
	ld	a, (hl-)
	dec	hl
	ld	c, a
	ld	b, #0x00
	inc	de
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
	push	bc
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_abs
	pop	hl
	pop	bc
	ld	a, e
	sub	a, #0x20
	or	a, d
	jr	Z, 00125$
	push	bc
	call	_abs
	pop	hl
	ld	a, e
	sub	a, #0x20
	or	a, d
	jr	NZ, 00111$
	C$main.c$333$1_1$229	= .
	.globl	C$main.c$333$1_1$229
;main.c:333: for (int i = 0; i < 12; i++) {
00125$:
	ld	bc, #0x0000
00114$:
	ld	a, c
	sub	a, #0x0c
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00111$
	C$main.c$334$4_1$235	= .
	.globl	C$main.c$334$4_1$235
;main.c:334: UINT8 pieceX = opponentPieces[i].x;
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
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
	C$main.c$335$4_1$235	= .
	.globl	C$main.c$335$4_1$235
;main.c:335: UINT8 pieceY = opponentPieces[i].y;
	inc	de
	ld	a, (de)
	ld	e, a
	C$main.c$338$4_1$235	= .
	.globl	C$main.c$338$4_1$235
;main.c:338: UINT8 pieceLeft = pieceX - 4;
	ld	a, l
	add	a, #0xfc
	ld	d, a
	C$main.c$339$4_1$235	= .
	.globl	C$main.c$339$4_1$235
;main.c:339: UINT8 pieceRight = pieceX + 4;
	ld	a, l
	add	a, #0x04
	ldhl	sp,	#2
	C$main.c$340$4_1$235	= .
	.globl	C$main.c$340$4_1$235
;main.c:340: UINT8 pieceTop = pieceY - 4;
	ld	(hl+), a
	ld	a, e
	add	a, #0xfc
	C$main.c$341$4_1$235	= .
	.globl	C$main.c$341$4_1$235
;main.c:341: UINT8 pieceBottom = pieceY + 4;
	ld	(hl+), a
	ld	a, e
	add	a, #0x04
	ld	(hl), a
	C$main.c$342$4_1$235	= .
	.globl	C$main.c$342$4_1$235
;main.c:342: UINT8 tileLeft = cursorx - 4;
	ldhl	sp,	#9
	ld	e, (hl)
	ld	a, e
	add	a, #0xfc
	ldhl	sp,	#5
	C$main.c$343$4_1$235	= .
	.globl	C$main.c$343$4_1$235
;main.c:343: UINT8 tileRight = cursorx + 4;
	ld	(hl+), a
	ld	a, e
	add	a, #0x04
	C$main.c$344$4_1$235	= .
	.globl	C$main.c$344$4_1$235
;main.c:344: UINT8 tileTop = cursory - 4;
	ld	(hl+), a
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	add	a, #0xfc
	ld	e, a
	C$main.c$345$4_1$235	= .
	.globl	C$main.c$345$4_1$235
;main.c:345: UINT8 tileBottom = cursory + 4;
	ld	a, l
	add	a, #0x04
	ldhl	sp,	#7
	ld	(hl), a
	C$main.c$348$4_1$235	= .
	.globl	C$main.c$348$4_1$235
;main.c:348: if (tileLeft <= pieceRight && tileRight >= pieceLeft &&
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#5
	sub	a, (hl)
	jr	C, 00115$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	C, 00115$
	C$main.c$349$4_1$235	= .
	.globl	C$main.c$349$4_1$235
;main.c:349: tileTop <= pieceBottom && tileBottom >= pieceTop) {
	dec	hl
	dec	hl
	ld	a, (hl)
	sub	a, e
	jr	C, 00115$
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#3
	sub	a, (hl)
	jr	C, 00115$
	C$main.c$351$5_1$236	= .
	.globl	C$main.c$351$5_1$236
;main.c:351: return true;
	ld	a, #0x01
	jr	00116$
00115$:
	C$main.c$333$3_1$234	= .
	.globl	C$main.c$333$3_1$234
;main.c:333: for (int i = 0; i < 12; i++) {
	inc	bc
	jr	00114$
00111$:
	C$main.c$356$1_1$232	= .
	.globl	C$main.c$356$1_1$232
;main.c:356: return false;
	xor	a, a
00116$:
	C$main.c$357$1_1$229	= .
	.globl	C$main.c$357$1_1$229
;main.c:357: }
	add	sp, #10
	pop	hl
	add	sp, #4
	jp	(hl)
	G$testValidMove$0$0	= .
	.globl	G$testValidMove$0$0
	C$main.c$358$1_1$238	= .
	.globl	C$main.c$358$1_1$238
;main.c:358: bool testValidMove(UINT8 cursorx, UINT8 cursory, UINT8 currentPlayer, int selectedCoords) {
;	---------------------------------
; Function testValidMove
; ---------------------------------
_testValidMove::
	add	sp, #-18
	ldhl	sp,	#17
	ld	(hl-), a
	ld	(hl), e
	C$main.c$365$1_0$238	= .
	.globl	C$main.c$365$1_0$238
;main.c:365: if (currentPlayer == BLACK_PLAYER) {
	ldhl	sp,	#20
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
	C$main.c$366$2_0$239	= .
	.globl	C$main.c$366$2_0$239
;main.c:366: pieces = blackPieces;
	ldhl	sp,	#12
	ld	(hl), #<(_blackPieces)
	inc	hl
	ld	(hl), #>(_blackPieces)
	C$main.c$368$2_0$239	= .
	.globl	C$main.c$368$2_0$239
;main.c:368: numPieces = MAX_BLACK_PIECES;
	ldhl	sp,	#2
	ld	a, #0x0c
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	C$main.c$369$1_0$238	= .
	.globl	C$main.c$369$1_0$238
;main.c:369: numOpponentPieces = MAX_WHITE_PIECES;
	jr	00103$
00102$:
	C$main.c$371$2_0$240	= .
	.globl	C$main.c$371$2_0$240
;main.c:371: pieces = whitePieces;
	ldhl	sp,	#12
	ld	a, #<(_whitePieces)
	ld	(hl+), a
	ld	(hl), #>(_whitePieces)
	C$main.c$373$2_0$240	= .
	.globl	C$main.c$373$2_0$240
;main.c:373: numPieces = MAX_WHITE_PIECES;
	ldhl	sp,	#2
	ld	a, #0x0c
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	C$main.c$374$1_0$238	= .
	.globl	C$main.c$374$1_0$238
;main.c:374: numOpponentPieces = MAX_BLACK_PIECES;
00103$:
	C$main.c$378$1_0$238	= .
	.globl	C$main.c$378$1_0$238
;main.c:378: if (cursorx > 160 || cursorx <= 20 || cursory > 160 || cursory <= 20) {
	ld	a, #0xa0
	ldhl	sp,	#17
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
	C$main.c$379$2_0$241	= .
	.globl	C$main.c$379$2_0$241
;main.c:379: return false;
	xor	a, a
	jp	00141$
00105$:
	C$main.c$383$1_0$238	= .
	.globl	C$main.c$383$1_0$238
;main.c:383: if (selectedCoords < 0 || selectedCoords >= numPieces) {
	ldhl	sp,	#22
	bit	7, (hl)
	jr	NZ, 00109$
	ldhl	sp,	#21
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
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
	C$main.c$384$2_0$242	= .
	.globl	C$main.c$384$2_0$242
;main.c:384: return false;
	xor	a, a
	jp	00141$
00110$:
	C$main.c$388$1_1$243	= .
	.globl	C$main.c$388$1_1$243
;main.c:388: int dx = cursorx - pieces[selectedCoords].x;
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#12
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ldhl	sp,#10
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
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
	C$main.c$389$1_1$243	= .
	.globl	C$main.c$389$1_1$243
;main.c:389: int dy = cursory - pieces[selectedCoords].y;
	ldhl	sp,	#16
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
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
	ld	a, (de)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#10
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
	ldhl	sp,	#13
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	C$main.c$392$1_1$243	= .
	.globl	C$main.c$392$1_1$243
;main.c:392: if (abs(dx) != abs(dy)) {
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_abs
	pop	hl
	push	de
	ldhl	sp,	#12
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
	C$main.c$393$2_1$244	= .
	.globl	C$main.c$393$2_1$244
;main.c:393: return false;
	xor	a, a
	jp	00141$
00113$:
	C$main.c$397$1_1$238	= .
	.globl	C$main.c$397$1_1$238
;main.c:397: if ((currentPlayer == BLACK_PLAYER && dy < 0 && !pieces[selectedCoords].isKing) ||
	ldhl	sp,	#11
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
	ldhl	sp,	#20
	ld	a, (hl)
	or	a, a
	jr	NZ, 00120$
	ldhl	sp,	#12
	ld	a, (hl)
	or	a, a
	jr	Z, 00120$
	ld	a, (bc)
	ld	e, a
	bit	0, e
	jr	Z, 00114$
00120$:
	C$main.c$398$1_1$243	= .
	.globl	C$main.c$398$1_1$243
;main.c:398: (currentPlayer == WHITE_PLAYER && dy > 0 && !pieces[selectedCoords].isKing)) {
	ldhl	sp,	#20
	ld	a, (hl)
	dec	a
	jr	NZ, 00160$
	ldhl	sp,	#10
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
	C$main.c$399$2_1$245	= .
	.globl	C$main.c$399$2_1$245
;main.c:399: return false;
	xor	a, a
	jp	00141$
	C$main.c$403$1_1$238	= .
	.globl	C$main.c$403$1_1$238
;main.c:403: for (int i = 0; i < numPieces; i++) {
00160$:
	ld	bc, #0x0000
00139$:
	ldhl	sp,	#2
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
	C$main.c$404$1_1$238	= .
	.globl	C$main.c$404$1_1$238
;main.c:404: if (whitePieces[i].x == cursorx && whitePieces[i].y == cursory) {
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl), a
	ld	de, #_whitePieces
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#15
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	jr	NZ, 00122$
	inc	de
	ld	a, (de)
	ld	e, a
	ldhl	sp,	#16
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00122$
	C$main.c$405$4_1$248	= .
	.globl	C$main.c$405$4_1$248
;main.c:405: return false;
	xor	a, a
	jp	00141$
00122$:
	C$main.c$407$1_1$238	= .
	.globl	C$main.c$407$1_1$238
;main.c:407: if (blackPieces[i].x == cursorx && blackPieces[i].y == cursory) {
	ld	de, #_blackPieces
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#15
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	jr	NZ, 00140$
	inc	de
	ld	a, (de)
	ld	e, a
	ldhl	sp,	#16
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00140$
	C$main.c$408$4_1$249	= .
	.globl	C$main.c$408$4_1$249
;main.c:408: return false;
	xor	a, a
	jp	00141$
00140$:
	C$main.c$403$2_1$246	= .
	.globl	C$main.c$403$2_1$246
;main.c:403: for (int i = 0; i < numPieces; i++) {
	inc	bc
	jr	00139$
00127$:
	C$main.c$412$1_1$243	= .
	.globl	C$main.c$412$1_1$243
;main.c:412: if (abs(dx) > 2 * SQUARE_SIZE || abs(dy) > 2 * SQUARE_SIZE) {
	ldhl	sp,	#4
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
	ldhl	sp,	#10
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
	C$main.c$413$2_1$250	= .
	.globl	C$main.c$413$2_1$250
;main.c:413: return false;
	xor	a, a
	jr	00141$
00135$:
	C$main.c$414$1_1$243	= .
	.globl	C$main.c$414$1_1$243
;main.c:414: } else if (abs(dx) == 2 * SQUARE_SIZE || abs(dy) == 2 * SQUARE_SIZE) {
	ldhl	sp,	#4
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
	ldhl	sp,	#10
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
	C$main.c$416$2_1$251	= .
	.globl	C$main.c$416$2_1$251
;main.c:416: UINT8 capturedX = pieces[selectedCoords].x + (dx / 2);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#15
	ld	(hl), a
	ldhl	sp,	#4
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
	ldhl	sp,	#15
	ld	a, (hl)
	add	a, c
	ld	b, a
	C$main.c$417$2_1$251	= .
	.globl	C$main.c$417$2_1$251
;main.c:417: UINT8 capturedY = pieces[selectedCoords].y + (dy / 2);
	ldhl	sp,#8
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
	C$main.c$418$2_1$251	= .
	.globl	C$main.c$418$2_1$251
;main.c:418: if (isCaptureMove(capturedX, capturedY, currentPlayer, selectedCoords)) {
	ldhl	sp,	#20
	ld	a, (hl+)
	ld	e, a
	ld	d, #0x00
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	de
	ld	e, c
	ld	a, b
	call	_isCaptureMove
	ld	c, a
	bit	0, c
	jr	Z, 00129$
	C$main.c$419$3_1$252	= .
	.globl	C$main.c$419$3_1$252
;main.c:419: return true;
	ld	a, #0x01
	jr	00141$
00129$:
	C$main.c$421$3_1$253	= .
	.globl	C$main.c$421$3_1$253
;main.c:421: return false;
	xor	a, a
	jr	00141$
00136$:
	C$main.c$424$1_1$243	= .
	.globl	C$main.c$424$1_1$243
;main.c:424: return true;
	ld	a, #0x01
00141$:
	C$main.c$425$1_1$238	= .
	.globl	C$main.c$425$1_1$238
;main.c:425: }
	add	sp, #18
	pop	hl
	add	sp, #3
	jp	(hl)
	G$testMoves$0$0	= .
	.globl	G$testMoves$0$0
	C$main.c$427$1_1$255	= .
	.globl	C$main.c$427$1_1$255
;main.c:427: void testMoves(UINT8 currentPlayer, int* validNonCaptureMoves, int* validCaptureMoves) {
;	---------------------------------
; Function testMoves
; ---------------------------------
_testMoves::
	add	sp, #-51
	ldhl	sp,	#48
	ld	(hl-), a
	dec	hl
	ld	a, e
	ld	(hl+), a
	C$main.c$433$1_0$255	= .
	.globl	C$main.c$433$1_0$255
;main.c:433: if (currentPlayer == BLACK_PLAYER) {
	ld	a, d
	ld	(hl+), a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
	C$main.c$434$2_0$256	= .
	.globl	C$main.c$434$2_0$256
;main.c:434: pieces = blackPieces;
	ldhl	sp,	#32
	ld	a, #<(_blackPieces)
	ld	(hl+), a
	C$main.c$436$2_0$256	= .
	.globl	C$main.c$436$2_0$256
;main.c:436: numPieces = MAX_BLACK_PIECES;
	ld	a, #>(_blackPieces)
	ld	(hl+), a
	ld	a, #0x0c
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jr	00103$
00102$:
	C$main.c$438$2_0$257	= .
	.globl	C$main.c$438$2_0$257
;main.c:438: pieces = whitePieces;
	ldhl	sp,	#32
	ld	a, #<(_whitePieces)
	ld	(hl+), a
	C$main.c$440$2_0$257	= .
	.globl	C$main.c$440$2_0$257
;main.c:440: numPieces = MAX_WHITE_PIECES;
	ld	a, #>(_whitePieces)
	ld	(hl+), a
	ld	a, #0x0c
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00103$:
	C$main.c$443$1_0$255	= .
	.globl	C$main.c$443$1_0$255
;main.c:443: *validNonCaptureMoves = 0;
	ldhl	sp,	#46
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	C$main.c$444$1_0$255	= .
	.globl	C$main.c$444$1_0$255
;main.c:444: *validCaptureMoves = 0;
	ldhl	sp,	#53
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
	ldhl	sp,	#54
	ld	a, (hl)
	ldhl	sp,	#37
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	C$main.c$447$3_0$259	= .
	.globl	C$main.c$447$3_0$259
;main.c:447: for (int i = 0; i < numPieces; i++) {
	xor	a, a
	ldhl	sp,	#49
	ld	(hl+), a
	ld	(hl), a
00115$:
	ldhl	sp,	#49
	ld	e, l
	ld	d, h
	ldhl	sp,	#34
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
	jr	Z, 00156$
	bit	7, d
	jr	NZ, 00157$
	cp	a, a
	jr	00157$
00156$:
	bit	7, d
	jr	Z, 00157$
	scf
00157$:
	jp	NC, 00117$
	C$main.c$448$3_0$259	= .
	.globl	C$main.c$448$3_0$259
;main.c:448: UINT8 pieceX = pieces[i].x;
	ldhl	sp,#49
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#46
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#45
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#32
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#44
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#43
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	C$main.c$449$3_0$259	= .
	.globl	C$main.c$449$3_0$259
;main.c:449: UINT8 pieceY = pieces[i].y;
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	inc	hl
	ld	b, a
	inc	bc
	ld	a, (bc)
	C$main.c$452$3_0$259	= .
	.globl	C$main.c$452$3_0$259
;main.c:452: int possibleMoves[8][2] = {
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#38
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#44
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#43
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#43
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#45
	ld	a, (hl)
	ldhl	sp,	#40
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,#38
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#45
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#45
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl+), a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,	#42
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#43
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,#40
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,	#44
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl), a
	ldhl	sp,	#45
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl+), a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,#38
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0020
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#44
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#43
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,	#43
	ld	a, (hl)
	ldhl	sp,	#17
	ld	(hl), a
	ldhl	sp,#40
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0020
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#18
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,#38
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0020
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#45
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl)
	ldhl	sp,	#20
	ld	(hl), a
	ldhl	sp,	#45
	ld	a, (hl)
	ldhl	sp,	#21
	ld	(hl+), a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,	#42
	ld	a, (hl)
	ldhl	sp,	#24
	ld	(hl), a
	ldhl	sp,	#43
	ld	a, (hl)
	ldhl	sp,	#25
	ld	(hl), a
	ldhl	sp,#40
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0020
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
	ldhl	sp,	#26
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,	#44
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
	ldhl	sp,	#45
	ld	a, (hl)
	ldhl	sp,	#29
	ld	(hl+), a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$main.c$463$2_0$255	= .
	.globl	C$main.c$463$2_0$255
;main.c:463: for (int j = 0; j < 8; j++) {
	ld	bc, #0x0000
00112$:
	ld	a, c
	sub	a, #0x08
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00116$
	C$main.c$464$5_0$261	= .
	.globl	C$main.c$464$5_0$261
;main.c:464: UINT8 moveX = possibleMoves[j][0];
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	push	hl
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	add	hl, de
	C$main.c$465$5_0$261	= .
	.globl	C$main.c$465$5_0$261
;main.c:465: UINT8 moveY = possibleMoves[j][1];
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (hl)
	ldhl	sp,	#45
	ld	(hl), a
	C$main.c$468$5_0$261	= .
	.globl	C$main.c$468$5_0$261
;main.c:468: if (testValidMove(moveX, moveY, currentPlayer, i)) {
	push	bc
	push	de
	ldhl	sp,	#53
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ldhl	sp,	#54
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#52
	ld	e, (hl)
	ld	a, d
	call	_testValidMove
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	de
	pop	bc
	bit	0, l
	jr	Z, 00113$
	C$main.c$469$6_0$262	= .
	.globl	C$main.c$469$6_0$262
;main.c:469: if (!isCaptureMove(moveX, moveY, currentPlayer, i)) {
	ldhl	sp,	#48
	ld	a, (hl+)
	ld	e, #0x00
	push	bc
	push	af
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	push	hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, e
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ldhl	sp,	#51
	ld	e, (hl)
	ld	a, d
	call	_isCaptureMove
	ld	e, a
	pop	bc
	bit	0, e
	jr	NZ, 00105$
	C$main.c$470$7_0$263	= .
	.globl	C$main.c$470$7_0$263
;main.c:470: (*validNonCaptureMoves)++;
	ldhl	sp,#46
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#42
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#46
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#45
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#44
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	jr	00113$
00105$:
	C$main.c$472$7_0$264	= .
	.globl	C$main.c$472$7_0$264
;main.c:472: (*validCaptureMoves)++;
	ldhl	sp,#36
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#42
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#46
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#45
	ld	(hl), a
	ldhl	sp,#36
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#44
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
00113$:
	C$main.c$463$4_0$260	= .
	.globl	C$main.c$463$4_0$260
;main.c:463: for (int j = 0; j < 8; j++) {
	inc	bc
	jp	00112$
00116$:
	C$main.c$447$2_0$258	= .
	.globl	C$main.c$447$2_0$258
;main.c:447: for (int i = 0; i < numPieces; i++) {
	ldhl	sp,	#49
	inc	(hl)
	jp	NZ,00115$
	inc	hl
	inc	(hl)
	jp	00115$
00117$:
	C$main.c$477$2_0$255	= .
	.globl	C$main.c$477$2_0$255
;main.c:477: }
	add	sp, #51
	pop	hl
	pop	af
	jp	(hl)
	G$checkCollision$0$0	= .
	.globl	G$checkCollision$0$0
	C$main.c$479$2_0$266	= .
	.globl	C$main.c$479$2_0$266
;main.c:479: bool checkCollision(UINT8 cursorx, UINT8 cursory, int currentPlayer) {
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	add	sp, #-14
	ldhl	sp,	#13
	ld	(hl-), a
	ld	(hl), e
	C$main.c$484$1_0$266	= .
	.globl	C$main.c$484$1_0$266
;main.c:484: if (currentPlayer == BLACK_PLAYER) {
	ldhl	sp,	#17
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00102$
	C$main.c$485$2_0$267	= .
	.globl	C$main.c$485$2_0$267
;main.c:485: pieces = blackPieces;
	ldhl	sp,	#0
	ld	a, #<(_blackPieces)
	ld	(hl+), a
	C$main.c$486$2_0$267	= .
	.globl	C$main.c$486$2_0$267
;main.c:486: numPieces = 12;
	ld	a, #>(_blackPieces)
	ld	(hl+), a
	ld	a, #0x0c
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jr	00103$
00102$:
	C$main.c$488$2_0$268	= .
	.globl	C$main.c$488$2_0$268
;main.c:488: pieces = whitePieces;
	ldhl	sp,	#0
	ld	a, #<(_whitePieces)
	ld	(hl+), a
	C$main.c$489$2_0$268	= .
	.globl	C$main.c$489$2_0$268
;main.c:489: numPieces = 12;
	ld	a, #>(_whitePieces)
	ld	(hl+), a
	ld	a, #0x0c
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00103$:
	C$main.c$493$3_0$269	= .
	.globl	C$main.c$493$3_0$269
;main.c:493: for (int i = 0; i < numPieces; i++) {
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
	C$main.c$494$3_0$270	= .
	.globl	C$main.c$494$3_0$270
;main.c:494: UINT8 pieceX = pieces[i].x;
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
	C$main.c$495$3_0$270	= .
	.globl	C$main.c$495$3_0$270
;main.c:495: UINT8 pieceY = pieces[i].y;
	inc	de
	ld	a, (de)
	ld	e, a
	C$main.c$498$3_0$270	= .
	.globl	C$main.c$498$3_0$270
;main.c:498: UINT8 pieceLeft = pieceX - 4;
	ld	a, l
	add	a, #0xfc
	ld	d, a
	C$main.c$499$3_0$270	= .
	.globl	C$main.c$499$3_0$270
;main.c:499: UINT8 pieceRight = pieceX + 4;
	ld	a, l
	add	a, #0x04
	ldhl	sp,	#6
	C$main.c$500$3_0$270	= .
	.globl	C$main.c$500$3_0$270
;main.c:500: UINT8 pieceTop = pieceY - 4;
	ld	(hl+), a
	ld	a, e
	add	a, #0xfc
	C$main.c$501$3_0$270	= .
	.globl	C$main.c$501$3_0$270
;main.c:501: UINT8 pieceBottom = pieceY + 4;
	ld	(hl+), a
	ld	a, e
	add	a, #0x04
	ld	(hl), a
	C$main.c$504$3_0$270	= .
	.globl	C$main.c$504$3_0$270
;main.c:504: UINT8 cursorLeft = cursorx - 4;
	ldhl	sp,	#13
	ld	e, (hl)
	ld	a, e
	add	a, #0xfc
	ldhl	sp,	#9
	C$main.c$505$3_0$270	= .
	.globl	C$main.c$505$3_0$270
;main.c:505: UINT8 cursorRight = cursorx + 4;
	ld	(hl+), a
	ld	a, e
	add	a, #0x04
	C$main.c$506$3_0$270	= .
	.globl	C$main.c$506$3_0$270
;main.c:506: UINT8 cursorTop = cursory - 4;
	ld	(hl+), a
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	add	a, #0xfc
	ld	e, a
	C$main.c$507$3_0$270	= .
	.globl	C$main.c$507$3_0$270
;main.c:507: UINT8 cursorBottom = cursory + 4;
	ld	a, l
	add	a, #0x04
	ldhl	sp,	#11
	ld	(hl), a
	C$main.c$510$3_0$270	= .
	.globl	C$main.c$510$3_0$270
;main.c:510: if (cursorLeft <= pieceRight && cursorRight >= pieceLeft &&
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#9
	sub	a, (hl)
	jr	C, 00115$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	C, 00115$
	C$main.c$511$3_0$270	= .
	.globl	C$main.c$511$3_0$270
;main.c:511: cursorTop <= pieceBottom && cursorBottom >= pieceTop) {
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
	C$main.c$512$4_0$271	= .
	.globl	C$main.c$512$4_0$271
;main.c:512: if (currentPlayer == BLACK_PLAYER) {
	ldhl	sp,	#17
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00105$
	C$main.c$513$5_0$272	= .
	.globl	C$main.c$513$5_0$272
;main.c:513: selectedCoords = i;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_selectedCoords),a
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#_selectedCoords + 1),a
	C$main.c$514$5_0$272	= .
	.globl	C$main.c$514$5_0$272
;main.c:514: selectedPieceIndex = i + 4;
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
	C$main.c$516$5_0$273	= .
	.globl	C$main.c$516$5_0$273
;main.c:516: selectedCoords = i;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_selectedCoords),a
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#_selectedCoords + 1),a
	C$main.c$517$5_0$273	= .
	.globl	C$main.c$517$5_0$273
;main.c:517: selectedPieceIndex = i + 16;
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
	C$main.c$519$4_0$271	= .
	.globl	C$main.c$519$4_0$271
;main.c:519: return true;
	ld	a, #0x01
	jr	00116$
00115$:
	C$main.c$493$2_0$269	= .
	.globl	C$main.c$493$2_0$269
;main.c:493: for (int i = 0; i < numPieces; i++) {
	inc	bc
	ldhl	sp,	#4
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jp	00114$
00112$:
	C$main.c$523$1_0$266	= .
	.globl	C$main.c$523$1_0$266
;main.c:523: selectedPieceIndex = -1;
	ld	hl, #_selectedPieceIndex
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$main.c$524$1_0$266	= .
	.globl	C$main.c$524$1_0$266
;main.c:524: return false;
	xor	a, a
00116$:
	C$main.c$525$1_0$266	= .
	.globl	C$main.c$525$1_0$266
;main.c:525: }
	add	sp, #14
	pop	hl
	pop	bc
	jp	(hl)
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$526$1_0$274	= .
	.globl	C$main.c$526$1_0$274
;main.c:526: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-6
	C$main.c$527$1_0$274	= .
	.globl	C$main.c$527$1_0$274
;main.c:527: font();
	call	_font
	C$main.c$528$1_0$274	= .
	.globl	C$main.c$528$1_0$274
;main.c:528: printTurn();
	call	_printTurn
	C$main.c$529$1_0$274	= .
	.globl	C$main.c$529$1_0$274
;main.c:529: printbkg();
	call	_printbkg
	C$main.c$530$1_0$274	= .
	.globl	C$main.c$530$1_0$274
;main.c:530: printSquare();
	call	_printSquare
	C$main.c$531$1_0$274	= .
	.globl	C$main.c$531$1_0$274
;main.c:531: printBlack();
	call	_printBlack
	C$main.c$532$1_0$274	= .
	.globl	C$main.c$532$1_0$274
;main.c:532: printWhite();
	call	_printWhite
	C$main.c$533$1_0$274	= .
	.globl	C$main.c$533$1_0$274
;main.c:533: SHOW_BKG;  
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	C$main.c$534$1_0$274	= .
	.globl	C$main.c$534$1_0$274
;main.c:534: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
	C$main.c$535$1_0$274	= .
	.globl	C$main.c$535$1_0$274
;main.c:535: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
	C$main.c$537$1_1$275	= .
	.globl	C$main.c$537$1_1$275
;main.c:537: while(1) {
00143$:
	C$main.c$538$2_1$276	= .
	.globl	C$main.c$538$2_1$276
;main.c:538: joypad_input = joypad();
	call	_joypad
	ld	hl, #_joypad_input
	ld	(hl), a
	C$main.c$540$2_1$276	= .
	.globl	C$main.c$540$2_1$276
;main.c:540: if (joypad_input != lastButtonState) {
	ld	a, (hl)
	ld	hl, #_lastButtonState
	sub	a, (hl)
	jr	Z, 00104$
	C$main.c$541$3_1$277	= .
	.globl	C$main.c$541$3_1$277
;main.c:541: debounceTimer = 0; // Reset the debounce timer
	xor	a, a
	ld	hl, #_debounceTimer
	ld	(hl+), a
	ld	(hl), a
	C$main.c$542$3_1$277	= .
	.globl	C$main.c$542$3_1$277
;main.c:542: lastButtonState = joypad_input;
	ld	a, (#_joypad_input)
	ld	(#_lastButtonState),a
	jr	00105$
00104$:
	C$main.c$543$2_1$276	= .
	.globl	C$main.c$543$2_1$276
;main.c:543: } else if (debounceTimer < DEBOUNCE_DELAY) {
	ld	hl, #_debounceTimer
	ld	a, (hl+)
	sub	a, #0x06
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00105$
	C$main.c$544$3_1$278	= .
	.globl	C$main.c$544$3_1$278
;main.c:544: debounceTimer += 100; // Increment the debounce timer based on the loop delay (100ms in this code)
	dec	hl
	ld	a, (hl)
	add	a, #0x64
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
	C$main.c$545$3_1$278	= .
	.globl	C$main.c$545$3_1$278
;main.c:545: continue; // Skip processing input until the debounce delay is reached
	jr	00143$
00105$:
	C$main.c$548$2_1$276	= .
	.globl	C$main.c$548$2_1$276
;main.c:548: dpad();
	call	_dpad
	C$main.c$549$2_1$276	= .
	.globl	C$main.c$549$2_1$276
;main.c:549: if (joypad_input & J_A) {
	ld	a, (#_joypad_input)
	bit	4, a
	jp	Z,00167$
	C$main.c$550$3_1$279	= .
	.globl	C$main.c$550$3_1$279
;main.c:550: if (pieceSelected == false) {
	ld	hl, #_pieceSelected
	bit	0, (hl)
	jp	NZ, 00167$
	C$main.c$551$4_1$280	= .
	.globl	C$main.c$551$4_1$280
;main.c:551: checkCollision(cursorx, cursory, currentPlayer);
	ld	hl, #_currentPlayer
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	hl, #_cursory
	ld	e, (hl)
	ld	a, (#_cursorx)
	call	_checkCollision
	C$main.c$553$1_1$274	= .
	.globl	C$main.c$553$1_1$274
;main.c:553: if (selectedPieceIndex >= 4 && selectedPieceIndex < 16){
	ld	hl, #_selectedPieceIndex
	ld	a, (hl+)
	sub	a, #0x10
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
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
	ld	a, #0x00
	rla
	ld	c, a
	C$main.c$552$4_1$280	= .
	.globl	C$main.c$552$4_1$280
;main.c:552: if (currentPlayer == BLACK_PLAYER) {
	ld	a, (#_currentPlayer)
	or	a, a
	jr	NZ, 00113$
	C$main.c$553$5_1$281	= .
	.globl	C$main.c$553$5_1$281
;main.c:553: if (selectedPieceIndex >= 4 && selectedPieceIndex < 16){
	ld	hl, #_selectedPieceIndex
	ld	a, (hl+)
	sub	a, #0x04
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
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
	jr	C, 00167$
	ld	a, c
	or	a, a
	jr	Z, 00167$
	C$main.c$554$6_1$282	= .
	.globl	C$main.c$554$6_1$282
;main.c:554: pieceSelected = true;
	ld	hl, #_pieceSelected
	ld	(hl), #0x01
	jr	00167$
00113$:
	C$main.c$556$4_1$280	= .
	.globl	C$main.c$556$4_1$280
;main.c:556: } else if (selectedPieceIndex >= 16 && selectedPieceIndex < 28) {
	bit	0, c
	jr	NZ, 00167$
	ld	hl, #_selectedPieceIndex
	ld	a, (hl+)
	sub	a, #0x1c
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00259$
	bit	7, d
	jr	NZ, 00260$
	cp	a, a
	jr	00260$
00259$:
	bit	7, d
	jr	Z, 00260$
	scf
00260$:
	jr	NC, 00167$
	C$main.c$557$5_1$283	= .
	.globl	C$main.c$557$5_1$283
;main.c:557: pieceSelected = true;
	ld	hl, #_pieceSelected
	ld	(hl), #0x01
	C$main.c$561$1_1$274	= .
	.globl	C$main.c$561$1_1$274
;main.c:561: while (pieceSelected == true) {
00167$:
00139$:
	ld	hl, #_pieceSelected
	bit	0, (hl)
	jp	Z, 00141$
	C$main.c$562$3_1$284	= .
	.globl	C$main.c$562$3_1$284
;main.c:562: delay(100);
	ld	de, #0x0064
	call	_delay
	C$main.c$563$3_1$284	= .
	.globl	C$main.c$563$3_1$284
;main.c:563: joypad_input = joypad(); // Update the input inside the loop
	call	_joypad
	ld	(#_joypad_input),a
	C$main.c$564$3_1$284	= .
	.globl	C$main.c$564$3_1$284
;main.c:564: dpad();
	call	_dpad
;main.c:565: move_sprite(selectedPieceIndex, cursorx, cursory);
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
	C$main.c$566$3_1$284	= .
	.globl	C$main.c$566$3_1$284
;main.c:566: if (joypad_input & J_A) {
	ld	a, (#_joypad_input)
	bit	4, a
	jp	Z,00136$
	C$main.c$568$4_1$285	= .
	.globl	C$main.c$568$4_1$285
;main.c:568: testMoves(currentPlayer, &validNonCaptureMoves, &validCaptureMoves);
	ldhl	sp,	#2
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	e, l
	ld	d, h
	push	bc
	ld	a, (#_currentPlayer)
	call	_testMoves
	C$main.c$569$4_1$285	= .
	.globl	C$main.c$569$4_1$285
;main.c:569: if (currentPlayer == BLACK_PLAYER){
	ld	a, (#_currentPlayer)
	or	a, a
	jr	NZ, 00120$
	C$main.c$570$5_1$286	= .
	.globl	C$main.c$570$5_1$286
;main.c:570: input = blackPieces;
	ldhl	sp,	#4
	ld	(hl), #<(_blackPieces)
	inc	hl
	ld	(hl), #>(_blackPieces)
	jr	00121$
00120$:
	C$main.c$572$5_1$287	= .
	.globl	C$main.c$572$5_1$287
;main.c:572: input = whitePieces;
	ldhl	sp,	#4
	ld	a, #<(_whitePieces)
	ld	(hl+), a
	ld	(hl), #>(_whitePieces)
00121$:
	C$main.c$574$4_1$285	= .
	.globl	C$main.c$574$4_1$285
;main.c:574: if (cursorx == input[selectedCoords].x && cursory == input[selectedCoords].y){
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
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e, a
	ld	a, (#_cursorx)
	sub	a, e
	jr	NZ, 00132$
	inc	bc
	ld	a, (bc)
	ld	c, a
	ld	a, (#_cursory)
	sub	a, c
	jr	NZ, 00132$
	C$main.c$575$5_1$288	= .
	.globl	C$main.c$575$5_1$288
;main.c:575: pieceSelected = false;
	ld	hl, #_pieceSelected
	ld	(hl), #0x00
	C$main.c$576$5_1$288	= .
	.globl	C$main.c$576$5_1$288
;main.c:576: printBlack();
	call	_printBlack
	C$main.c$577$5_1$288	= .
	.globl	C$main.c$577$5_1$288
;main.c:577: printWhite();
	call	_printWhite
	C$main.c$578$5_1$288	= .
	.globl	C$main.c$578$5_1$288
;main.c:578: break;
	jp	00141$
00132$:
	C$main.c$579$4_1$285	= .
	.globl	C$main.c$579$4_1$285
;main.c:579: } else if ((validCaptureMoves > 0) && (!isCaptureMove(cursorx, cursory, currentPlayer, selectedCoords))) {
	ldhl	sp,	#2
	xor	a, a
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00266$
	bit	7, d
	jr	NZ, 00267$
	cp	a, a
	jr	00267$
00266$:
	bit	7, d
	jr	Z, 00267$
	scf
00267$:
	jr	NC, 00128$
	ld	hl, #_currentPlayer
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_selectedCoords
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	push	bc
	ld	hl, #_cursory
	ld	e, (hl)
	ld	a, (#_cursorx)
	call	_isCaptureMove
	bit	0,a
	jr	NZ, 00128$
	C$main.c$580$5_1$289	= .
	.globl	C$main.c$580$5_1$289
;main.c:580: pieceSelected = false;
	ld	hl, #_pieceSelected
	ld	(hl), #0x00
	C$main.c$581$5_1$289	= .
	.globl	C$main.c$581$5_1$289
;main.c:581: printBlack();
	call	_printBlack
	C$main.c$582$5_1$289	= .
	.globl	C$main.c$582$5_1$289
;main.c:582: printWhite();
	call	_printWhite
	C$main.c$583$5_1$289	= .
	.globl	C$main.c$583$5_1$289
;main.c:583: break;
	jr	00141$
00128$:
	C$main.c$584$4_1$285	= .
	.globl	C$main.c$584$4_1$285
;main.c:584: } else if (isValidMove(cursorx, cursory, currentPlayer, selectedCoords)) {
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
	jr	Z, 00136$
	C$main.c$585$5_1$290	= .
	.globl	C$main.c$585$5_1$290
;main.c:585: modifyCoordinates(input, selectedCoords, cursorx, cursory);
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
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_modifyCoordinates
	C$main.c$586$5_1$290	= .
	.globl	C$main.c$586$5_1$290
;main.c:586: if (currentPlayer == BLACK_PLAYER) {
	ld	hl, #_currentPlayer
	ld	a, (hl)
	or	a, a
	jr	NZ, 00123$
	C$main.c$587$6_1$291	= .
	.globl	C$main.c$587$6_1$291
;main.c:587: currentPlayer = WHITE_PLAYER;
	ld	(hl), #0x01
	jr	00124$
00123$:
	C$main.c$589$6_1$292	= .
	.globl	C$main.c$589$6_1$292
;main.c:589: currentPlayer = BLACK_PLAYER;
	ld	hl, #_currentPlayer
	ld	(hl), #0x00
00124$:
	C$main.c$591$5_1$290	= .
	.globl	C$main.c$591$5_1$290
;main.c:591: printBlack();
	call	_printBlack
	C$main.c$592$5_1$290	= .
	.globl	C$main.c$592$5_1$290
;main.c:592: printWhite();
	call	_printWhite
	C$main.c$593$5_1$290	= .
	.globl	C$main.c$593$5_1$290
;main.c:593: printTurn();
	call	_printTurn
	C$main.c$594$5_1$290	= .
	.globl	C$main.c$594$5_1$290
;main.c:594: pieceSelected = false;
	ld	hl, #_pieceSelected
	ld	(hl), #0x00
	C$main.c$595$5_1$290	= .
	.globl	C$main.c$595$5_1$290
;main.c:595: break; // Exit the loop after a piece has been moved
	jr	00141$
00136$:
	C$main.c$598$3_1$284	= .
	.globl	C$main.c$598$3_1$284
;main.c:598: if (joypad_input & J_B) {
	ld	a, (#_joypad_input)
	bit	5, a
	jp	Z,00139$
	C$main.c$599$4_1$293	= .
	.globl	C$main.c$599$4_1$293
;main.c:599: pieceSelected = false;
	ld	hl, #_pieceSelected
	ld	(hl), #0x00
	C$main.c$600$4_1$293	= .
	.globl	C$main.c$600$4_1$293
;main.c:600: printBlack();
	call	_printBlack
	C$main.c$601$4_1$293	= .
	.globl	C$main.c$601$4_1$293
;main.c:601: printWhite();
	call	_printWhite
	C$main.c$602$2_1$276	= .
	.globl	C$main.c$602$2_1$276
;main.c:602: break;
00141$:
	C$main.c$605$2_1$276	= .
	.globl	C$main.c$605$2_1$276
;main.c:605: delay(100);
	ld	de, #0x0064
	call	_delay
	jp	00143$
	C$main.c$607$1_1$274	= .
	.globl	C$main.c$607$1_1$274
;main.c:607: }
	add	sp, #6
	C$main.c$607$1_1$274	= .
	.globl	C$main.c$607$1_1$274
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
