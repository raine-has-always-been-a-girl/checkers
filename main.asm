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
	.globl _hasValidNonCaptureMoves
	.globl _hasValidCaptureMoves
	.globl _checkCollision
	.globl _isValidMove
	.globl _getCaptureIndex
	.globl _isMoveWithinBoard
	.globl _printWhite
	.globl _printBlack
	.globl _printSquare
	.globl _printbkg
	.globl _printTurn
	.globl _font
	.globl _dpad
	.globl _promoteToKing
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
;main.c:97: move_sprite(0, cursorx - 8, cursory - 8);
	ld	a, (#_cursory)
	add	a, #0xf8
	ld	b, a
	ld	a, (#_cursorx)
	add	a, #0xf8
	ld	c, a
;c:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:98: move_sprite(1, cursorx + 0, cursory - 8);
	ld	a, (#_cursory)
	add	a, #0xf8
	ld	b, a
	ld	hl, #_cursorx
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:99: move_sprite(2, cursorx - 8, cursory + 0);
	ld	hl, #_cursory
	ld	b, (hl)
	ld	a, (#_cursorx)
	add	a, #0xf8
	ld	c, a
;c:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:100: move_sprite(3, cursorx + 0, cursory + 0);
	ld	hl, #_cursory
	ld	b, (hl)
	ld	hl, #_cursorx
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;c:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$main.c$100$3_0$125	= .
	.globl	C$main.c$100$3_0$125
;main.c:100: move_sprite(3, cursorx + 0, cursory + 0);
	C$main.c$101$3_0$125	= .
	.globl	C$main.c$101$3_0$125
;main.c:101: }
	C$main.c$101$3_0$125	= .
	.globl	C$main.c$101$3_0$125
	XG$moveSquare$0$0	= .
	.globl	XG$moveSquare$0$0
	ret
	G$promoteToKing$0$0	= .
	.globl	G$promoteToKing$0$0
	C$main.c$117$3_0$140	= .
	.globl	C$main.c$117$3_0$140
;main.c:117: void promoteToKing(Piece* pieces, int numPieces, UINT8 player) {
;	---------------------------------
; Function promoteToKing
; ---------------------------------
_promoteToKing::
	add	sp, #-8
	ldhl	sp,	#6
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#4
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$main.c$118$3_0$141	= .
	.globl	C$main.c$118$3_0$141
;main.c:118: for (int i = 0; i < numPieces; i++) {
	ldhl	sp,	#10
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00146$
	xor	a, a
00146$:
	ldhl	sp,	#2
	ld	(hl), a
	ld	bc, #0x0000
00110$:
	ldhl	sp,	#4
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00147$
	bit	7, d
	jr	NZ, 00148$
	cp	a, a
	jr	00148$
00147$:
	bit	7, d
	jr	Z, 00148$
	scf
00148$:
	jr	NC, 00112$
	C$main.c$119$2_0$140	= .
	.globl	C$main.c$119$2_0$140
;main.c:119: if (pieces[i].y == 28 && player == WHITE_PLAYER) {
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
;	spillPairReg hl
;	spillPairReg hl
	ld	e,l
	ld	d,h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	C$main.c$120$2_0$140	= .
	.globl	C$main.c$120$2_0$140
;main.c:120: pieces[i].isKing = true;
	inc	de
	inc	de
	C$main.c$119$3_0$141	= .
	.globl	C$main.c$119$3_0$141
;main.c:119: if (pieces[i].y == 28 && player == WHITE_PLAYER) {
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x1c
	jr	NZ, 00105$
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
	C$main.c$120$4_0$142	= .
	.globl	C$main.c$120$4_0$142
;main.c:120: pieces[i].isKing = true;
	ld	a, #0x01
	ld	(de), a
	jr	00111$
00105$:
	C$main.c$121$3_0$141	= .
	.globl	C$main.c$121$3_0$141
;main.c:121: } else if (pieces[i].y == 140 && player == BLACK_PLAYER) {
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x8c
	jr	NZ, 00111$
	ldhl	sp,	#10
	ld	a, (hl)
	or	a, a
	jr	NZ, 00111$
	C$main.c$122$4_0$143	= .
	.globl	C$main.c$122$4_0$143
;main.c:122: pieces[i].isKing = true;
	ld	a, #0x01
	ld	(de), a
00111$:
	C$main.c$118$2_0$140	= .
	.globl	C$main.c$118$2_0$140
;main.c:118: for (int i = 0; i < numPieces; i++) {
	inc	bc
	jr	00110$
00112$:
	C$main.c$125$2_0$140	= .
	.globl	C$main.c$125$2_0$140
;main.c:125: }
	add	sp, #8
	pop	hl
	inc	sp
	jp	(hl)
	G$dpad$0$0	= .
	.globl	G$dpad$0$0
	C$main.c$126$2_0$144	= .
	.globl	C$main.c$126$2_0$144
;main.c:126: void dpad() {
;	---------------------------------
; Function dpad
; ---------------------------------
_dpad::
	C$main.c$127$1_0$144	= .
	.globl	C$main.c$127$1_0$144
;main.c:127: if (joypad_input & J_RIGHT) {
	ld	hl, #_joypad_input
	ld	c, (hl)
	bit	0, c
	jr	Z, 00102$
	C$main.c$128$2_0$145	= .
	.globl	C$main.c$128$2_0$145
;main.c:128: cursorx = cursorx + SQUARE_SIZE;
	ld	hl, #_cursorx
	ld	a, (hl)
	add	a, #0x10
	ld	(hl), a
00102$:
	C$main.c$130$1_0$144	= .
	.globl	C$main.c$130$1_0$144
;main.c:130: if (joypad_input & J_LEFT) {
	bit	1, c
	jr	Z, 00104$
	C$main.c$131$2_0$146	= .
	.globl	C$main.c$131$2_0$146
;main.c:131: cursorx = cursorx - SQUARE_SIZE;
	ld	hl, #_cursorx
	ld	a, (hl)
	add	a, #0xf0
	ld	(hl), a
00104$:
	C$main.c$133$1_0$144	= .
	.globl	C$main.c$133$1_0$144
;main.c:133: if (joypad_input & J_UP) {
	bit	2, c
	jr	Z, 00106$
	C$main.c$134$2_0$147	= .
	.globl	C$main.c$134$2_0$147
;main.c:134: cursory = cursory - SQUARE_SIZE;
	ld	hl, #_cursory
	ld	a, (hl)
	add	a, #0xf0
	ld	(hl), a
00106$:
	C$main.c$136$1_0$144	= .
	.globl	C$main.c$136$1_0$144
;main.c:136: if (joypad_input & J_DOWN) {
	bit	3, c
	jp	Z,_moveSquare
	C$main.c$137$2_0$148	= .
	.globl	C$main.c$137$2_0$148
;main.c:137: cursory = cursory + SQUARE_SIZE;
	ld	hl, #_cursory
	ld	a, (hl)
	add	a, #0x10
	ld	(hl), a
	C$main.c$139$1_0$144	= .
	.globl	C$main.c$139$1_0$144
;main.c:139: moveSquare();
	C$main.c$140$1_0$144	= .
	.globl	C$main.c$140$1_0$144
;main.c:140: }
	C$main.c$140$1_0$144	= .
	.globl	C$main.c$140$1_0$144
	XG$dpad$0$0	= .
	.globl	XG$dpad$0$0
	jp	_moveSquare
	G$font$0$0	= .
	.globl	G$font$0$0
	C$main.c$141$1_0$149	= .
	.globl	C$main.c$141$1_0$149
;main.c:141: void font() {
;	---------------------------------
; Function font
; ---------------------------------
_font::
	C$main.c$143$1_0$149	= .
	.globl	C$main.c$143$1_0$149
;main.c:143: font_init();
	call	_font_init
	C$main.c$144$1_0$149	= .
	.globl	C$main.c$144$1_0$149
;main.c:144: min_font = font_load(font_ibm_fixed);
	ld	de, #_font_ibm_fixed
	push	de
	call	_font_load
	pop	hl
	C$main.c$145$1_0$149	= .
	.globl	C$main.c$145$1_0$149
;main.c:145: font_set(min_font);
	push	de
	call	_font_set
	pop	hl
	C$main.c$146$1_0$149	= .
	.globl	C$main.c$146$1_0$149
;main.c:146: }
	C$main.c$146$1_0$149	= .
	.globl	C$main.c$146$1_0$149
	XG$font$0$0	= .
	.globl	XG$font$0$0
	ret
	G$printTurn$0$0	= .
	.globl	G$printTurn$0$0
	C$main.c$147$1_0$150	= .
	.globl	C$main.c$147$1_0$150
;main.c:147: void printTurn() {
;	---------------------------------
; Function printTurn
; ---------------------------------
_printTurn::
	C$main.c$148$1_0$150	= .
	.globl	C$main.c$148$1_0$150
;main.c:148: if (currentPlayer == BLACK_PLAYER){
	ld	a, (#_currentPlayer)
	or	a, a
	jr	NZ, 00102$
	C$main.c$149$2_0$151	= .
	.globl	C$main.c$149$2_0$151
;main.c:149: set_win_tiles(2, 0, 16, 1, currentPlayerBlackText);
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
	C$main.c$151$2_0$152	= .
	.globl	C$main.c$151$2_0$152
;main.c:151: set_win_tiles(2, 0, 16, 1, currentPlayerWhiteText);
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
	C$main.c$153$3_0$150	= .
	.globl	C$main.c$153$3_0$150
;main.c:153: move_win(7, 136);
	C$main.c$154$3_0$150	= .
	.globl	C$main.c$154$3_0$150
;main.c:154: }
	C$main.c$154$3_0$150	= .
	.globl	C$main.c$154$3_0$150
	XG$printTurn$0$0	= .
	.globl	XG$printTurn$0$0
	ret
	G$printbkg$0$0	= .
	.globl	G$printbkg$0$0
	C$main.c$155$3_0$156	= .
	.globl	C$main.c$155$3_0$156
;main.c:155: void printbkg() {
;	---------------------------------
; Function printbkg
; ---------------------------------
_printbkg::
	C$main.c$156$1_0$156	= .
	.globl	C$main.c$156$1_0$156
;main.c:156: set_bkg_data(1, 1, tile1);
	ld	de, #_tile1
	push	de
	ld	hl, #0x101
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$main.c$157$1_0$156	= .
	.globl	C$main.c$157$1_0$156
;main.c:157: set_bkg_data(2, 1, tile2);
	ld	de, #_tile2
	push	de
	ld	hl, #0x102
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$main.c$158$1_0$156	= .
	.globl	C$main.c$158$1_0$156
;main.c:158: set_bkg_data(3, 1, tile3);
	ld	de, #_tile3
	push	de
	ld	hl, #0x103
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$main.c$159$1_0$156	= .
	.globl	C$main.c$159$1_0$156
;main.c:159: set_bkg_tiles(0, 0, 20, 18, map);
	ld	de, #_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
	C$main.c$160$1_0$156	= .
	.globl	C$main.c$160$1_0$156
;main.c:160: }
	C$main.c$160$1_0$156	= .
	.globl	C$main.c$160$1_0$156
	XG$printbkg$0$0	= .
	.globl	XG$printbkg$0$0
	ret
	G$printSquare$0$0	= .
	.globl	G$printSquare$0$0
	C$main.c$161$1_0$157	= .
	.globl	C$main.c$161$1_0$157
;main.c:161: void printSquare() {
;	---------------------------------
; Function printSquare
; ---------------------------------
_printSquare::
	C$main.c$162$1_0$157	= .
	.globl	C$main.c$162$1_0$157
;main.c:162: set_sprite_data(0, 1, squareTL);
	ld	de, #_squareTL
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_data
	add	sp, #4
	C$main.c$163$1_0$157	= .
	.globl	C$main.c$163$1_0$157
;main.c:163: set_sprite_data(1, 1, squareTR);
	ld	de, #_squareTR
	push	de
	ld	hl, #0x101
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$164$1_0$157	= .
	.globl	C$main.c$164$1_0$157
;main.c:164: set_sprite_data(2, 1, squareBL);
	ld	de, #_squareBL
	push	de
	ld	hl, #0x102
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$165$1_0$157	= .
	.globl	C$main.c$165$1_0$157
;main.c:165: set_sprite_data(3, 1, squareBR);
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
	C$main.c$170$1_0$157	= .
	.globl	C$main.c$170$1_0$157
;main.c:170: moveSquare();
	C$main.c$171$1_0$157	= .
	.globl	C$main.c$171$1_0$157
;main.c:171: }
	C$main.c$171$1_0$157	= .
	.globl	C$main.c$171$1_0$157
	XG$printSquare$0$0	= .
	.globl	XG$printSquare$0$0
	jp	_moveSquare
	G$printBlack$0$0	= .
	.globl	G$printBlack$0$0
	C$main.c$172$1_0$170	= .
	.globl	C$main.c$172$1_0$170
;main.c:172: void printBlack() {
;	---------------------------------
; Function printBlack
; ---------------------------------
_printBlack::
	add	sp, #-6
	C$main.c$173$1_0$170	= .
	.globl	C$main.c$173$1_0$170
;main.c:173: set_sprite_data(4, 12, black_piece);
	ld	de, #_black_piece
	push	de
	ld	hl, #0xc04
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$174$1_0$170	= .
	.globl	C$main.c$174$1_0$170
;main.c:174: set_sprite_data(8, 12, blackKing);
	ld	de, #_blackKing
	push	de
	ld	hl, #0xc08
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$176$3_0$172	= .
	.globl	C$main.c$176$3_0$172
;main.c:176: for (int i = 0; i < 12; i++){
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
	C$main.c$177$3_0$172	= .
	.globl	C$main.c$177$3_0$172
;main.c:177: if (blackPieces[i].isKing) {
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
	C$main.c$178$2_0$170	= .
	.globl	C$main.c$178$2_0$170
;main.c:178: set_sprite_tile(i + 4, 8); // Use the black king sprite tile
	ldhl	sp,	#4
	ld	a, (hl-)
	add	a, #0x04
	C$main.c$177$3_0$172	= .
	.globl	C$main.c$177$3_0$172
;main.c:177: if (blackPieces[i].isKing) {
	ld	(hl-), a
	bit	0, (hl)
	jr	Z, 00102$
;main.c:178: set_sprite_tile(i + 4, 8); // Use the black king sprite tile
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
	C$main.c$178$3_0$172	= .
	.globl	C$main.c$178$3_0$172
;main.c:178: set_sprite_tile(i + 4, 8); // Use the black king sprite tile
	jr	00103$
00102$:
;main.c:180: set_sprite_tile(i + 4, 4); // Use the black regular piece sprite tile
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
	C$main.c$180$3_0$172	= .
	.globl	C$main.c$180$3_0$172
;main.c:180: set_sprite_tile(i + 4, 4); // Use the black regular piece sprite tile
00103$:
;main.c:182: move_sprite(i + 4, blackPieces[i].x, blackPieces[i].y);
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
	C$main.c$176$2_0$171	= .
	.globl	C$main.c$176$2_0$171
;main.c:176: for (int i = 0; i < 12; i++){
	ldhl	sp,	#4
	inc	(hl)
	jp	NZ,00109$
	inc	hl
	inc	(hl)
	jp	00109$
00111$:
	C$main.c$184$2_0$170	= .
	.globl	C$main.c$184$2_0$170
;main.c:184: }
	add	sp, #6
	C$main.c$184$2_0$170	= .
	.globl	C$main.c$184$2_0$170
	XG$printBlack$0$0	= .
	.globl	XG$printBlack$0$0
	ret
	G$printWhite$0$0	= .
	.globl	G$printWhite$0$0
	C$main.c$185$2_0$184	= .
	.globl	C$main.c$185$2_0$184
;main.c:185: void printWhite() {
;	---------------------------------
; Function printWhite
; ---------------------------------
_printWhite::
	add	sp, #-6
	C$main.c$186$1_0$184	= .
	.globl	C$main.c$186$1_0$184
;main.c:186: set_sprite_data(5, 12, white_piece);
	ld	de, #_white_piece
	push	de
	ld	hl, #0xc05
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$187$1_0$184	= .
	.globl	C$main.c$187$1_0$184
;main.c:187: set_sprite_data(20, 12, whiteKing);
	ld	de, #_whiteKing
	push	de
	ld	hl, #0xc14
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$189$3_0$186	= .
	.globl	C$main.c$189$3_0$186
;main.c:189: for (int i = 0; i < 12; i++){
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
	C$main.c$190$3_0$186	= .
	.globl	C$main.c$190$3_0$186
;main.c:190: if (whitePieces[i].isKing) {
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
	C$main.c$191$2_0$184	= .
	.globl	C$main.c$191$2_0$184
;main.c:191: set_sprite_tile(i + 16, 20); // Use the white king sprite tile
	ldhl	sp,	#4
	ld	a, (hl-)
	add	a, #0x10
	C$main.c$190$3_0$186	= .
	.globl	C$main.c$190$3_0$186
;main.c:190: if (whitePieces[i].isKing) {
	ld	(hl-), a
	bit	0, (hl)
	jr	Z, 00102$
;main.c:191: set_sprite_tile(i + 16, 20); // Use the white king sprite tile
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
	C$main.c$191$3_0$186	= .
	.globl	C$main.c$191$3_0$186
;main.c:191: set_sprite_tile(i + 16, 20); // Use the white king sprite tile
	jr	00103$
00102$:
;main.c:193: set_sprite_tile(i + 16, 5); // Use the white regular piece sprite tile
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
	C$main.c$193$3_0$186	= .
	.globl	C$main.c$193$3_0$186
;main.c:193: set_sprite_tile(i + 16, 5); // Use the white regular piece sprite tile
00103$:
;main.c:195: move_sprite(i + 16, whitePieces[i].x, whitePieces[i].y);
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
	C$main.c$189$2_0$185	= .
	.globl	C$main.c$189$2_0$185
;main.c:189: for (int i = 0; i < 12; i++){
	ldhl	sp,	#4
	inc	(hl)
	jp	NZ,00109$
	inc	hl
	inc	(hl)
	jp	00109$
00111$:
	C$main.c$197$2_0$184	= .
	.globl	C$main.c$197$2_0$184
;main.c:197: }
	add	sp, #6
	C$main.c$197$2_0$184	= .
	.globl	C$main.c$197$2_0$184
	XG$printWhite$0$0	= .
	.globl	XG$printWhite$0$0
	ret
	G$isMoveWithinBoard$0$0	= .
	.globl	G$isMoveWithinBoard$0$0
	C$main.c$198$2_0$199	= .
	.globl	C$main.c$198$2_0$199
;main.c:198: bool isMoveWithinBoard(UINT8 x, UINT8 y) {
;	---------------------------------
; Function isMoveWithinBoard
; ---------------------------------
_isMoveWithinBoard::
	C$main.c$199$1_0$199	= .
	.globl	C$main.c$199$1_0$199
;main.c:199: return (x >= 20 && x <=148 && y >= 20 && y <= 148);
	ld	c, a
	sub	a, #0x14
	jr	C, 00103$
	ld	a, #0x94
	sub	a, c
	jr	C, 00103$
	ld	a, e
	sub	a, #0x14
	jr	C, 00103$
	ld	a, #0x94
	sub	a, e
	jr	NC, 00104$
00103$:
	xor	a, a
	ret
00104$:
	ld	a, #0x01
	C$main.c$200$1_0$199	= .
	.globl	C$main.c$200$1_0$199
;main.c:200: }
	C$main.c$200$1_0$199	= .
	.globl	C$main.c$200$1_0$199
	XG$isMoveWithinBoard$0$0	= .
	.globl	XG$isMoveWithinBoard$0$0
	ret
	G$getCaptureIndex$0$0	= .
	.globl	G$getCaptureIndex$0$0
	C$main.c$201$1_0$201	= .
	.globl	C$main.c$201$1_0$201
;main.c:201: int getCaptureIndex(UINT8 capturedX, UINT8 capturedY, Piece* opponentPieces, int numOpponentPieces) {
;	---------------------------------
; Function getCaptureIndex
; ---------------------------------
_getCaptureIndex::
	add	sp, #-7
	ldhl	sp,	#6
	ld	(hl-), a
	ld	(hl), e
	C$main.c$203$3_0$202	= .
	.globl	C$main.c$203$3_0$202
;main.c:203: for (int i = 0; i < numOpponentPieces; i++) {
	xor	a, a
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), a
	ld	bc, #0x0000
00106$:
	ldhl	sp,	#11
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00130$
	bit	7, d
	jr	NZ, 00131$
	cp	a, a
	jr	00131$
00130$:
	bit	7, d
	jr	Z, 00131$
	scf
00131$:
	jr	NC, 00104$
	C$main.c$204$3_0$203	= .
	.globl	C$main.c$204$3_0$203
;main.c:204: UINT8 pieceX = opponentPieces[i].x;
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#4
	C$main.c$205$3_0$203	= .
	.globl	C$main.c$205$3_0$203
;main.c:205: UINT8 pieceY = opponentPieces[i].y;
	C$main.c$206$3_0$203	= .
	.globl	C$main.c$206$3_0$203
;main.c:206: if (capturedX == pieceX && capturedY == pieceY) {
	ld	(hl+), a
	inc	hl
	inc	de
	ld	a, (de)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	jr	NZ, 00107$
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00107$
	C$main.c$208$4_0$204	= .
	.globl	C$main.c$208$4_0$204
;main.c:208: return i;
	ldhl	sp,	#2
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	jr	00108$
00107$:
	C$main.c$203$2_0$202	= .
	.globl	C$main.c$203$2_0$202
;main.c:203: for (int i = 0; i < numOpponentPieces; i++) {
	inc	bc
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00106$
00104$:
	C$main.c$212$1_0$201	= .
	.globl	C$main.c$212$1_0$201
;main.c:212: return -1;
	ld	bc, #0xffff
00108$:
	C$main.c$213$1_0$201	= .
	.globl	C$main.c$213$1_0$201
;main.c:213: }
	add	sp, #7
	pop	hl
	add	sp, #4
	jp	(hl)
	G$isValidMove$0$0	= .
	.globl	G$isValidMove$0$0
	C$main.c$215$1_0$206	= .
	.globl	C$main.c$215$1_0$206
;main.c:215: bool isValidMove(UINT8 cursorx, UINT8 cursory, UINT8 currentPlayer, int selectedCoords) {
;	---------------------------------
; Function isValidMove
; ---------------------------------
_isValidMove::
	add	sp, #-11
	ldhl	sp,	#10
	ld	(hl-), a
	ld	(hl), e
	C$main.c$221$1_0$206	= .
	.globl	C$main.c$221$1_0$206
;main.c:221: if (currentPlayer == BLACK_PLAYER) {
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
	C$main.c$222$2_0$207	= .
	.globl	C$main.c$222$2_0$207
;main.c:222: pieces = blackPieces;
	ld	bc, #_blackPieces+0
	C$main.c$224$2_0$207	= .
	.globl	C$main.c$224$2_0$207
;main.c:224: numPieces = MAX_BLACK_PIECES;
	ldhl	sp,	#0
	ld	a, #0x0c
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	C$main.c$225$1_0$206	= .
	.globl	C$main.c$225$1_0$206
;main.c:225: numOpponentPieces = MAX_WHITE_PIECES;
	jr	00103$
00102$:
	C$main.c$227$2_0$208	= .
	.globl	C$main.c$227$2_0$208
;main.c:227: pieces = whitePieces;
	ld	bc, #_whitePieces
	C$main.c$229$2_0$208	= .
	.globl	C$main.c$229$2_0$208
;main.c:229: numPieces = MAX_WHITE_PIECES;
	ldhl	sp,	#0
	ld	a, #0x0c
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	C$main.c$230$1_0$206	= .
	.globl	C$main.c$230$1_0$206
;main.c:230: numOpponentPieces = MAX_BLACK_PIECES;
00103$:
	C$main.c$233$1_1$209	= .
	.globl	C$main.c$233$1_1$209
;main.c:233: int dx = cursorx - pieces[selectedCoords].x;
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl+), a
	ld	(hl), #0x00
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
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	(hl), e
	inc	hl
	ld	(hl), a
	C$main.c$234$1_1$209	= .
	.globl	C$main.c$234$1_1$209
;main.c:234: int dy = cursory - pieces[selectedCoords].y;
	ldhl	sp,	#9
	ld	a, (hl-)
	dec	hl
	ld	c, a
	ld	b, #0x00
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#4
	ld	(hl), c
	inc	hl
	ld	(hl), a
	C$main.c$236$1_1$209	= .
	.globl	C$main.c$236$1_1$209
;main.c:236: if (!(isMoveWithinBoard(cursorx, cursory))) {
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl)
	call	_isMoveWithinBoard
	ld	c, a
	bit	0, c
	jr	NZ, 00105$
	C$main.c$237$2_1$210	= .
	.globl	C$main.c$237$2_1$210
;main.c:237: return false;
	xor	a, a
	jp	00131$
00105$:
	C$main.c$240$1_1$209	= .
	.globl	C$main.c$240$1_1$209
;main.c:240: if (selectedCoords < 0 || selectedCoords >= numPieces) {
	ldhl	sp,	#15
	bit	7, (hl)
	jr	NZ, 00106$
	ldhl	sp,	#14
	ld	e, l
	ld	d, h
	ldhl	sp,	#0
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
	jr	Z, 00208$
	bit	7, d
	jr	NZ, 00209$
	cp	a, a
	jr	00209$
00208$:
	bit	7, d
	jr	Z, 00209$
	scf
00209$:
	jr	C, 00107$
00106$:
	C$main.c$241$2_1$211	= .
	.globl	C$main.c$241$2_1$211
;main.c:241: return false;
	xor	a, a
	jp	00131$
00107$:
	C$main.c$244$1_1$209	= .
	.globl	C$main.c$244$1_1$209
;main.c:244: if (abs(dx) != abs(dy)) {
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_abs
	pop	hl
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_abs
	pop	hl
	pop	bc
	ld	a, e
	sub	a, c
	jr	NZ, 00210$
	ld	a, d
	sub	a, b
	jr	Z, 00110$
00210$:
	C$main.c$245$2_1$212	= .
	.globl	C$main.c$245$2_1$212
;main.c:245: return false;
	xor	a, a
	jp	00131$
00110$:
	C$main.c$248$1_1$206	= .
	.globl	C$main.c$248$1_1$206
;main.c:248: if ((currentPlayer == BLACK_PLAYER && dy < 0 && !pieces[selectedCoords].isKing) ||
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	NZ, 00117$
	ldhl	sp,	#5
	bit	7, (hl)
	jr	Z, 00117$
	ld	a, (bc)
	ld	e, a
	bit	0, e
	jr	Z, 00111$
00117$:
	C$main.c$249$1_1$209	= .
	.globl	C$main.c$249$1_1$209
;main.c:249: (currentPlayer == WHITE_PLAYER && dy > 0 && !pieces[selectedCoords].isKing)) {
	ldhl	sp,	#13
	ld	a, (hl)
	dec	a
	jr	NZ, 00146$
	ldhl	sp,	#4
	xor	a, a
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00213$
	bit	7, d
	jr	NZ, 00214$
	cp	a, a
	jr	00214$
00213$:
	bit	7, d
	jr	Z, 00214$
	scf
00214$:
	jr	NC, 00146$
	ld	a, (bc)
	ld	c, a
	bit	0, c
	jr	NZ, 00146$
00111$:
	C$main.c$250$2_1$213	= .
	.globl	C$main.c$250$2_1$213
;main.c:250: return false;
	xor	a, a
	jp	00131$
	C$main.c$253$1_1$206	= .
	.globl	C$main.c$253$1_1$206
;main.c:253: for (int i = 0; i < numPieces; i++) {
00146$:
	ld	bc, #0x0000
00129$:
	ldhl	sp,	#0
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00215$
	bit	7, d
	jr	NZ, 00216$
	cp	a, a
	jr	00216$
00215$:
	bit	7, d
	jr	Z, 00216$
	scf
00216$:
	jr	NC, 00124$
	C$main.c$254$1_1$206	= .
	.globl	C$main.c$254$1_1$206
;main.c:254: if (whitePieces[i].x == cursorx && whitePieces[i].y == cursory) {
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
	ld	(hl), a
	ld	de, #_whitePieces
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	jr	NZ, 00119$
	inc	de
	ld	a, (de)
	ld	e, a
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00119$
	C$main.c$255$4_1$216	= .
	.globl	C$main.c$255$4_1$216
;main.c:255: return false;
	xor	a, a
	jr	00131$
00119$:
	C$main.c$257$1_1$206	= .
	.globl	C$main.c$257$1_1$206
;main.c:257: if (blackPieces[i].x == cursorx && blackPieces[i].y == cursory) {
	ld	de, #_blackPieces
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	jr	NZ, 00130$
	inc	de
	ld	a, (de)
	ld	e, a
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00130$
	C$main.c$258$4_1$217	= .
	.globl	C$main.c$258$4_1$217
;main.c:258: return false;
	xor	a, a
	jr	00131$
00130$:
	C$main.c$253$2_1$214	= .
	.globl	C$main.c$253$2_1$214
;main.c:253: for (int i = 0; i < numPieces; i++) {
	inc	bc
	jr	00129$
00124$:
	C$main.c$261$1_1$209	= .
	.globl	C$main.c$261$1_1$209
;main.c:261: if (abs(dx) > 2 * SQUARE_SIZE || abs(dy) > 2 * SQUARE_SIZE) {
	ldhl	sp,	#2
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
	jr	Z, 00225$
	bit	7, d
	jr	NZ, 00226$
	cp	a, a
	jr	00226$
00225$:
	bit	7, d
	jr	Z, 00226$
	scf
00226$:
	jr	C, 00125$
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
	jr	Z, 00227$
	bit	7, d
	jr	NZ, 00228$
	cp	a, a
	jr	00228$
00227$:
	bit	7, d
	jr	Z, 00228$
	scf
00228$:
	jr	NC, 00126$
00125$:
	C$main.c$262$2_1$218	= .
	.globl	C$main.c$262$2_1$218
;main.c:262: return false;
	xor	a, a
	jr	00131$
00126$:
	C$main.c$265$1_1$209	= .
	.globl	C$main.c$265$1_1$209
;main.c:265: return true;
	ld	a, #0x01
00131$:
	C$main.c$266$1_1$206	= .
	.globl	C$main.c$266$1_1$206
;main.c:266: }
	add	sp, #11
	pop	hl
	add	sp, #3
	jp	(hl)
	G$checkCollision$0$0	= .
	.globl	G$checkCollision$0$0
	C$main.c$268$1_1$220	= .
	.globl	C$main.c$268$1_1$220
;main.c:268: bool checkCollision(UINT8 cursorx, UINT8 cursory, int currentPlayer) {
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	add	sp, #-11
	ldhl	sp,	#10
	ld	(hl-), a
	ld	(hl), e
	C$main.c$272$1_0$220	= .
	.globl	C$main.c$272$1_0$220
;main.c:272: if (currentPlayer == BLACK_PLAYER) {
	ldhl	sp,	#14
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00102$
	C$main.c$273$2_0$221	= .
	.globl	C$main.c$273$2_0$221
;main.c:273: pieces = blackPieces;
	ldhl	sp,	#2
	ld	a, #<(_blackPieces)
	ld	(hl+), a
	C$main.c$274$2_0$221	= .
	.globl	C$main.c$274$2_0$221
;main.c:274: numPieces = 12;
	ld	a, #>(_blackPieces)
	ld	(hl+), a
	ld	a, #0x0c
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jr	00103$
00102$:
	C$main.c$276$2_0$222	= .
	.globl	C$main.c$276$2_0$222
;main.c:276: pieces = whitePieces;
	ldhl	sp,	#2
	ld	a, #<(_whitePieces)
	ld	(hl+), a
	C$main.c$277$2_0$222	= .
	.globl	C$main.c$277$2_0$222
;main.c:277: numPieces = 12;
	ld	a, #>(_whitePieces)
	ld	(hl+), a
	ld	a, #0x0c
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00103$:
	C$main.c$280$3_0$223	= .
	.globl	C$main.c$280$3_0$223
;main.c:280: for (int i = 0; i < numPieces; i++) {
	xor	a, a
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), a
	ld	bc, #0x0000
00112$:
	ldhl	sp,	#4
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00146$
	bit	7, d
	jr	NZ, 00147$
	cp	a, a
	jr	00147$
00146$:
	bit	7, d
	jr	Z, 00147$
	scf
00147$:
	jr	NC, 00110$
	C$main.c$281$3_0$224	= .
	.globl	C$main.c$281$3_0$224
;main.c:281: UINT8 pieceX = pieces[i].x;
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#8
	C$main.c$282$3_0$224	= .
	.globl	C$main.c$282$3_0$224
;main.c:282: UINT8 pieceY = pieces[i].y;
	C$main.c$284$3_0$224	= .
	.globl	C$main.c$284$3_0$224
;main.c:284: if (cursorx == (pieceX) &&
	ld	(hl+), a
	inc	hl
	inc	de
	ld	a, (de)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	jr	NZ, 00113$
	C$main.c$285$3_0$224	= .
	.globl	C$main.c$285$3_0$224
;main.c:285: cursory == (pieceY)) {
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00113$
	C$main.c$286$4_0$225	= .
	.globl	C$main.c$286$4_0$225
;main.c:286: if (currentPlayer == BLACK_PLAYER) {
	ldhl	sp,	#14
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00105$
	C$main.c$287$5_0$226	= .
	.globl	C$main.c$287$5_0$226
;main.c:287: selectedCoords = i;
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(#_selectedCoords),a
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(#_selectedCoords + 1),a
	C$main.c$288$5_0$226	= .
	.globl	C$main.c$288$5_0$226
;main.c:288: selectedPieceIndex = i + 4;
	ldhl	sp,#6
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
	C$main.c$290$5_0$227	= .
	.globl	C$main.c$290$5_0$227
;main.c:290: selectedCoords = i;
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(#_selectedCoords),a
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(#_selectedCoords + 1),a
	C$main.c$291$5_0$227	= .
	.globl	C$main.c$291$5_0$227
;main.c:291: selectedPieceIndex = i + 16;
	ldhl	sp,#6
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
	C$main.c$293$4_0$225	= .
	.globl	C$main.c$293$4_0$225
;main.c:293: return true;
	ld	a, #0x01
	jr	00114$
00113$:
	C$main.c$280$2_0$223	= .
	.globl	C$main.c$280$2_0$223
;main.c:280: for (int i = 0; i < numPieces; i++) {
	inc	bc
	ldhl	sp,	#6
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jp	00112$
00110$:
	C$main.c$297$1_0$220	= .
	.globl	C$main.c$297$1_0$220
;main.c:297: selectedPieceIndex = -1;
	ld	hl, #_selectedPieceIndex
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	C$main.c$298$1_0$220	= .
	.globl	C$main.c$298$1_0$220
;main.c:298: return false;
	xor	a, a
00114$:
	C$main.c$299$1_0$220	= .
	.globl	C$main.c$299$1_0$220
;main.c:299: }
	add	sp, #11
	pop	hl
	pop	bc
	jp	(hl)
	G$hasValidCaptureMoves$0$0	= .
	.globl	G$hasValidCaptureMoves$0$0
	C$main.c$300$1_0$229	= .
	.globl	C$main.c$300$1_0$229
;main.c:300: bool hasValidCaptureMoves(UINT8 currentPlayer) {
;	---------------------------------
; Function hasValidCaptureMoves
; ---------------------------------
_hasValidCaptureMoves::
	add	sp, #-14
	ldhl	sp,	#11
	C$main.c$301$1_0$229	= .
	.globl	C$main.c$301$1_0$229
;main.c:301: Piece* pieces = (currentPlayer == BLACK_PLAYER) ? blackPieces : whitePieces;
	ld	(hl), a
	or	a, a
	jr	NZ, 00116$
	ld	bc, #_blackPieces+0
	jr	00117$
00116$:
	ld	bc, #_whitePieces+0
00117$:
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$main.c$302$1_0$229	= .
	.globl	C$main.c$302$1_0$229
;main.c:302: Piece* opponentPieces = (currentPlayer == BLACK_PLAYER) ? whitePieces : blackPieces;
	ldhl	sp,	#11
	ld	a, (hl)
	or	a, a
	jr	NZ, 00118$
	ld	bc, #_whitePieces+0
	jr	00119$
00118$:
	ld	bc, #_blackPieces+0
00119$:
	ldhl	sp,	#4
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$main.c$306$1_0$229	= .
	.globl	C$main.c$306$1_0$229
;main.c:306: for (int i = 0; i < numPieces; i++) {
	xor	a, a
	ldhl	sp,	#12
	ld	(hl+), a
	ld	(hl), a
00112$:
	ldhl	sp,	#12
	ld	a, (hl+)
	sub	a, #0x0c
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	ld	e, a
	bit	7, e
	jr	Z, 00208$
	bit	7, d
	jr	NZ, 00209$
	cp	a, a
	jr	00209$
00208$:
	bit	7, d
	jr	Z, 00209$
	scf
00209$:
	jp	NC, 00110$
	C$main.c$307$1_0$229	= .
	.globl	C$main.c$307$1_0$229
;main.c:307: if (isValidMove(pieces[i].x - 2 * SQUARE_SIZE, pieces[i].y + 2 * SQUARE_SIZE, currentPlayer, i) && (getCaptureIndex((((pieces[i].x - 2 * SQUARE_SIZE) + (pieces[i].x)) / 2), (((pieces[i].y + 2 * SQUARE_SIZE) + (pieces[i].y)) / 2), opponentPieces, numOpponentPieces) != -1) ||
	ldhl	sp,#12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
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
	ld	a, (de)
	add	a, #0x20
	ld	b, a
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	add	a, #0xe0
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, b
	ld	a, c
	call	_isValidMove
	bit	0,a
	jr	Z, 00105$
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ld	hl, #0x0020
	add	hl, bc
	add	hl, bc
;	spillPairReg hl
;	spillPairReg hl
	ld	c,l
	ld	b,h
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00120$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
00120$:
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	ldhl	sp,	#8
	ld	a, c
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ld	a, c
	add	a, #0xe0
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
;	spillPairReg hl
;	spillPairReg hl
	ld	c,l
	ld	b,h
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00121$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
00121$:
	ld	c, l
	sra	h
	rr	c
	ld	de, #0x000c
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#12
	ld	e, (hl)
	ld	a, c
	call	_getCaptureIndex
	ld	a, c
	and	a, b
	inc	a
	jp	NZ,00101$
00105$:
	C$main.c$308$3_0$231	= .
	.globl	C$main.c$308$3_0$231
;main.c:308: isValidMove(pieces[i].x + 2 * SQUARE_SIZE, pieces[i].y + 2 * SQUARE_SIZE, currentPlayer, i) && (getCaptureIndex((((pieces[i].x + 2 * SQUARE_SIZE) + (pieces[i].x)) / 2), (((pieces[i].y + 2 * SQUARE_SIZE) + (pieces[i].y)) / 2), opponentPieces, numOpponentPieces) != -1) ||
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x20
	ld	b, a
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	add	a, #0x20
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, b
	ld	a, c
	call	_isValidMove
	bit	0,a
	jr	Z, 00107$
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ld	hl, #0x0020
	add	hl, bc
	add	hl, bc
;	spillPairReg hl
;	spillPairReg hl
	ld	c,l
	ld	b,h
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00122$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
00122$:
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	ldhl	sp,	#8
	ld	a, c
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ld	hl, #0x0020
	add	hl, bc
	add	hl, bc
;	spillPairReg hl
;	spillPairReg hl
	ld	c,l
	ld	b,h
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00123$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
00123$:
	ld	c, l
	sra	h
	rr	c
	ld	de, #0x000c
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#12
	ld	e, (hl)
	ld	a, c
	call	_getCaptureIndex
	ld	a, c
	and	a, b
	inc	a
	jp	NZ,00101$
00107$:
	C$main.c$309$3_0$231	= .
	.globl	C$main.c$309$3_0$231
;main.c:309: isValidMove(pieces[i].x - 2 * SQUARE_SIZE, pieces[i].y - 2 * SQUARE_SIZE, currentPlayer, i) && (getCaptureIndex((((pieces[i].x - 2 * SQUARE_SIZE) + (pieces[i].x)) / 2), (((pieces[i].y - 2 * SQUARE_SIZE) + (pieces[i].y)) / 2), opponentPieces, numOpponentPieces) != -1) ||
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xe0
	ld	b, a
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	add	a, #0xe0
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, b
	ld	a, c
	call	_isValidMove
	bit	0,a
	jr	Z, 00109$
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ld	a, c
	add	a, #0xe0
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
;	spillPairReg hl
;	spillPairReg hl
	ld	c,l
	ld	b,h
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00124$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
00124$:
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	ldhl	sp,	#8
	ld	a, c
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ld	a, c
	add	a, #0xe0
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	b, h
	bit	7, h
	jr	Z, 00125$
	inc	hl
	ld	c, l
	ld	b, h
00125$:
	sra	b
	rr	c
	ld	de, #0x000c
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#12
	ld	e, (hl)
	ld	a, c
	call	_getCaptureIndex
	ld	a, c
	and	a, b
	inc	a
	jp	NZ,00101$
00109$:
	C$main.c$310$3_0$231	= .
	.globl	C$main.c$310$3_0$231
;main.c:310: isValidMove(pieces[i].x + 2 * SQUARE_SIZE, pieces[i].y - 2 * SQUARE_SIZE, currentPlayer, i) && (getCaptureIndex((((pieces[i].x + 2 * SQUARE_SIZE) + (pieces[i].x)) / 2), (((pieces[i].y - 2 * SQUARE_SIZE) + (pieces[i].y)) / 2), opponentPieces, numOpponentPieces) != -1)) {
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xe0
	ld	c, a
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	add	a, #0x20
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, c
	ld	a, b
	call	_isValidMove
	bit	0,a
	jp	Z, 00113$
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ld	a, c
	add	a, #0xe0
	ld	e, a
	ld	a, b
	adc	a, #0xff
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#1
	bit	7, (hl)
	jr	Z, 00126$
	pop	de
	push	de
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
00126$:
	ldhl	sp,#7
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	dec	hl
	ld	b, a
	sra	b
	rr	c
	ld	(hl), c
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ld	hl, #0x0020
	add	hl, bc
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	dec	hl
	bit	7, (hl)
	jr	Z, 00127$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), a
00127$:
	ldhl	sp,#9
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	ld	de, #0x000c
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	push	de
	ld	e, (hl)
	ld	a, c
	call	_getCaptureIndex
	ld	a, c
	and	a, b
	inc	a
	jr	Z, 00113$
00101$:
	C$main.c$311$4_0$232	= .
	.globl	C$main.c$311$4_0$232
;main.c:311: return true; // Found at least one valid capture move
	ld	a, #0x01
	jr	00114$
00113$:
	C$main.c$306$2_0$230	= .
	.globl	C$main.c$306$2_0$230
;main.c:306: for (int i = 0; i < numPieces; i++) {
	ldhl	sp,	#12
	inc	(hl)
	jp	NZ,00112$
	inc	hl
	inc	(hl)
	jp	00112$
00110$:
	C$main.c$314$1_0$229	= .
	.globl	C$main.c$314$1_0$229
;main.c:314: return false; // No valid capture moves found for any piece
	xor	a, a
00114$:
	C$main.c$315$1_0$229	= .
	.globl	C$main.c$315$1_0$229
;main.c:315: }
	add	sp, #14
	C$main.c$315$1_0$229	= .
	.globl	C$main.c$315$1_0$229
	XG$hasValidCaptureMoves$0$0	= .
	.globl	XG$hasValidCaptureMoves$0$0
	ret
	G$hasValidNonCaptureMoves$0$0	= .
	.globl	G$hasValidNonCaptureMoves$0$0
	C$main.c$316$1_0$234	= .
	.globl	C$main.c$316$1_0$234
;main.c:316: bool hasValidNonCaptureMoves(Piece* pieces, int numPieces, UINT8 currentPlayer) {
;	---------------------------------
; Function hasValidNonCaptureMoves
; ---------------------------------
_hasValidNonCaptureMoves::
	add	sp, #-9
	ldhl	sp,	#7
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#5
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$main.c$317$1_0$234	= .
	.globl	C$main.c$317$1_0$234
;main.c:317: for (int i = 0; i < numPieces; i++) {
	ld	bc, #0x0000
00108$:
	ldhl	sp,	#5
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00137$
	bit	7, d
	jr	NZ, 00138$
	cp	a, a
	jr	00138$
00137$:
	bit	7, d
	jr	Z, 00138$
	scf
00138$:
	jp	NC, 00106$
	C$main.c$318$3_0$236	= .
	.globl	C$main.c$318$3_0$236
;main.c:318: if (isValidMove(pieces[i].x - SQUARE_SIZE, pieces[i].y - SQUARE_SIZE, currentPlayer, i) ||
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
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
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	add	a, #0xf0
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0xf0
	ld	d, a
	push	bc
	push	bc
	ldhl	sp,	#15
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	e, (hl)
	ld	a, d
	call	_isValidMove
	ld	e, a
	pop	bc
	bit	0, e
	jr	NZ, 00101$
	C$main.c$319$3_0$236	= .
	.globl	C$main.c$319$3_0$236
;main.c:319: isValidMove(pieces[i].x + SQUARE_SIZE, pieces[i].y - SQUARE_SIZE, currentPlayer, i) ||
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	add	a, #0xf0
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x10
	ld	d, a
	push	bc
	push	bc
	ldhl	sp,	#15
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	e, (hl)
	ld	a, d
	call	_isValidMove
	ld	e, a
	pop	bc
	bit	0, e
	jr	NZ, 00101$
	C$main.c$320$3_0$236	= .
	.globl	C$main.c$320$3_0$236
;main.c:320: isValidMove(pieces[i].x - SQUARE_SIZE, pieces[i].y + SQUARE_SIZE, currentPlayer, i) ||
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	add	a, #0x10
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0xf0
	ld	d, a
	push	bc
	push	bc
	ldhl	sp,	#15
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	e, (hl)
	ld	a, d
	call	_isValidMove
	ld	e, a
	pop	bc
	bit	0, e
	jr	NZ, 00101$
	C$main.c$321$3_0$236	= .
	.globl	C$main.c$321$3_0$236
;main.c:321: isValidMove(pieces[i].x + SQUARE_SIZE, pieces[i].y + SQUARE_SIZE, currentPlayer, i)) {
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	add	a, #0x10
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x10
	ld	d, a
	push	bc
	push	bc
	ldhl	sp,	#15
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	e, (hl)
	ld	a, d
	call	_isValidMove
	ld	e, a
	pop	bc
	bit	0, e
	jr	Z, 00109$
00101$:
	C$main.c$322$4_0$237	= .
	.globl	C$main.c$322$4_0$237
;main.c:322: return true; // Found at least one valid move
	ld	a, #0x01
	jr	00110$
00109$:
	C$main.c$317$2_0$235	= .
	.globl	C$main.c$317$2_0$235
;main.c:317: for (int i = 0; i < numPieces; i++) {
	inc	bc
	jp	00108$
00106$:
	C$main.c$325$1_0$234	= .
	.globl	C$main.c$325$1_0$234
;main.c:325: return false; // No valid moves found for any piece
	xor	a, a
00110$:
	C$main.c$326$1_0$234	= .
	.globl	C$main.c$326$1_0$234
;main.c:326: }
	add	sp, #9
	pop	hl
	inc	sp
	jp	(hl)
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$327$1_0$238	= .
	.globl	C$main.c$327$1_0$238
;main.c:327: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-16
	C$main.c$328$1_0$238	= .
	.globl	C$main.c$328$1_0$238
;main.c:328: font();
	call	_font
	C$main.c$329$1_0$238	= .
	.globl	C$main.c$329$1_0$238
;main.c:329: printTurn();
	call	_printTurn
	C$main.c$330$1_0$238	= .
	.globl	C$main.c$330$1_0$238
;main.c:330: printbkg();
	call	_printbkg
	C$main.c$331$1_0$238	= .
	.globl	C$main.c$331$1_0$238
;main.c:331: printSquare();
	call	_printSquare
	C$main.c$332$1_0$238	= .
	.globl	C$main.c$332$1_0$238
;main.c:332: printBlack();
	call	_printBlack
	C$main.c$333$1_0$238	= .
	.globl	C$main.c$333$1_0$238
;main.c:333: printWhite();
	call	_printWhite
	C$main.c$334$1_0$238	= .
	.globl	C$main.c$334$1_0$238
;main.c:334: SHOW_BKG;  
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	C$main.c$335$1_0$238	= .
	.globl	C$main.c$335$1_0$238
;main.c:335: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
	C$main.c$336$1_0$238	= .
	.globl	C$main.c$336$1_0$238
;main.c:336: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
	C$main.c$337$1_0$238	= .
	.globl	C$main.c$337$1_0$238
;main.c:337: while(1) {
00153$:
	C$main.c$338$2_0$239	= .
	.globl	C$main.c$338$2_0$239
;main.c:338: joypad_input = joypad();
	call	_joypad
	ld	hl, #_joypad_input
	ld	(hl), a
	C$main.c$340$2_0$239	= .
	.globl	C$main.c$340$2_0$239
;main.c:340: if (joypad_input != lastButtonState) {
	ld	a, (hl)
	ld	hl, #_lastButtonState
	sub	a, (hl)
	jr	Z, 00104$
	C$main.c$341$3_0$240	= .
	.globl	C$main.c$341$3_0$240
;main.c:341: debounceTimer = 0; // Reset the debounce timer
	xor	a, a
	ld	hl, #_debounceTimer
	ld	(hl+), a
	ld	(hl), a
	C$main.c$342$3_0$240	= .
	.globl	C$main.c$342$3_0$240
;main.c:342: lastButtonState = joypad_input;
	ld	a, (#_joypad_input)
	ld	(#_lastButtonState),a
	jr	00105$
00104$:
	C$main.c$343$2_0$239	= .
	.globl	C$main.c$343$2_0$239
;main.c:343: } else if (debounceTimer < DEBOUNCE_DELAY) {
	ld	hl, #_debounceTimer
	ld	a, (hl+)
	sub	a, #0x06
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00105$
	C$main.c$344$3_0$241	= .
	.globl	C$main.c$344$3_0$241
;main.c:344: debounceTimer += 100; // Increment the debounce timer based on the loop delay (100ms in this code)
	dec	hl
	ld	a, (hl)
	add	a, #0x64
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
	C$main.c$345$3_0$241	= .
	.globl	C$main.c$345$3_0$241
;main.c:345: continue; // Skip processing input until the debounce delay is reached
	jr	00153$
00105$:
	C$main.c$347$2_0$239	= .
	.globl	C$main.c$347$2_0$239
;main.c:347: dpad();
	call	_dpad
	C$main.c$348$2_0$239	= .
	.globl	C$main.c$348$2_0$239
;main.c:348: if (joypad_input & J_A) {
	ld	a, (#_joypad_input)
	bit	4, a
	jp	Z,00189$
	C$main.c$349$3_0$242	= .
	.globl	C$main.c$349$3_0$242
;main.c:349: if (pieceSelected == false) {
	ld	hl, #_pieceSelected
	bit	0, (hl)
	jp	NZ, 00189$
	C$main.c$350$4_0$243	= .
	.globl	C$main.c$350$4_0$243
;main.c:350: checkCollision(cursorx - 4, cursory - 4, currentPlayer);
	ld	hl, #_currentPlayer
	ld	c, (hl)
	ld	b, #0x00
	ld	a, (#_cursory)
	add	a, #0xfc
	ld	e, a
	ld	a, (#_cursorx)
	add	a, #0xfc
	ld	d, a
	push	bc
	ld	a, d
	call	_checkCollision
	C$main.c$352$1_0$238	= .
	.globl	C$main.c$352$1_0$238
;main.c:352: if (selectedPieceIndex >= 4 && selectedPieceIndex < 16){
	ld	hl, #_selectedPieceIndex
	ld	a, (hl+)
	sub	a, #0x10
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00301$
	bit	7, d
	jr	NZ, 00302$
	cp	a, a
	jr	00302$
00301$:
	bit	7, d
	jr	Z, 00302$
	scf
00302$:
	ld	a, #0x00
	rla
	ld	c, a
	C$main.c$351$4_0$243	= .
	.globl	C$main.c$351$4_0$243
;main.c:351: if (currentPlayer == BLACK_PLAYER) {
	ld	a, (#_currentPlayer)
	or	a, a
	jr	NZ, 00113$
	C$main.c$352$5_0$244	= .
	.globl	C$main.c$352$5_0$244
;main.c:352: if (selectedPieceIndex >= 4 && selectedPieceIndex < 16){
	ld	hl, #_selectedPieceIndex
	ld	a, (hl+)
	sub	a, #0x04
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00303$
	bit	7, d
	jr	NZ, 00304$
	cp	a, a
	jr	00304$
00303$:
	bit	7, d
	jr	Z, 00304$
	scf
00304$:
	jr	C, 00189$
	ld	a, c
	or	a, a
	jr	Z, 00189$
	C$main.c$353$6_0$245	= .
	.globl	C$main.c$353$6_0$245
;main.c:353: pieceSelected = true;
	ld	hl, #_pieceSelected
	ld	(hl), #0x01
	jr	00189$
00113$:
	C$main.c$355$4_0$243	= .
	.globl	C$main.c$355$4_0$243
;main.c:355: } else if (selectedPieceIndex >= 16 && selectedPieceIndex < 28) {
	bit	0, c
	jr	NZ, 00189$
	ld	hl, #_selectedPieceIndex
	ld	a, (hl+)
	sub	a, #0x1c
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00305$
	bit	7, d
	jr	NZ, 00306$
	cp	a, a
	jr	00306$
00305$:
	bit	7, d
	jr	Z, 00306$
	scf
00306$:
	jr	NC, 00189$
	C$main.c$356$5_0$246	= .
	.globl	C$main.c$356$5_0$246
;main.c:356: pieceSelected = true;
	ld	hl, #_pieceSelected
	ld	(hl), #0x01
	C$main.c$360$1_0$238	= .
	.globl	C$main.c$360$1_0$238
;main.c:360: while (pieceSelected == true) {
00189$:
00149$:
	ld	hl, #_pieceSelected
	bit	0, (hl)
	jp	Z, 00151$
	C$main.c$361$3_0$247	= .
	.globl	C$main.c$361$3_0$247
;main.c:361: delay(100);
	ld	de, #0x0064
	call	_delay
	C$main.c$362$3_0$247	= .
	.globl	C$main.c$362$3_0$247
;main.c:362: joypad_input = joypad(); // Update the input inside the loop
	call	_joypad
	ld	(#_joypad_input),a
	C$main.c$363$3_0$247	= .
	.globl	C$main.c$363$3_0$247
;main.c:363: dpad();
	call	_dpad
;main.c:364: move_sprite(selectedPieceIndex, cursorx - 4, cursory - 4);
	ld	a, (#_cursory)
	add	a, #0xfc
	ldhl	sp,	#12
	ld	(hl), a
	ld	a, (#_cursorx)
	ldhl	sp,	#15
	ld	(hl), a
	ld	a, (hl-)
	dec	hl
	add	a, #0xfc
	ld	(hl), a
	ld	a, (#_selectedPieceIndex)
	ldhl	sp,	#15
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
	ld	a, #0x02
00307$:
	ldhl	sp,	#10
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00307$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
;c:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#12
	ld	a, (hl+)
	inc	hl
	ld	(de), a
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	dec	hl
	ld	b, a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	C$main.c$365$3_0$247	= .
	.globl	C$main.c$365$3_0$247
;main.c:365: if (joypad_input & J_A) {
	ld	a, (#_joypad_input)
	bit	4, a
	jp	Z,00146$
	C$main.c$366$4_0$248	= .
	.globl	C$main.c$366$4_0$248
;main.c:366: Piece* pieces = (currentPlayer == BLACK_PLAYER) ? blackPieces : whitePieces;
	ld	a, (#_currentPlayer)
	or	a, a
	jr	NZ, 00158$
	ldhl	sp,	#14
	ld	(hl), #<(_blackPieces)
	inc	hl
	ld	(hl), #>(_blackPieces)
	jr	00159$
00158$:
	ldhl	sp,	#14
	ld	a, #<(_whitePieces)
	ld	(hl+), a
	ld	(hl), #>(_whitePieces)
00159$:
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	C$main.c$367$4_0$248	= .
	.globl	C$main.c$367$4_0$248
;main.c:367: Piece* opponentPieces = (currentPlayer == BLACK_PLAYER) ? whitePieces : blackPieces;
	ld	a, (#_currentPlayer)
	or	a, a
	jr	NZ, 00160$
	ldhl	sp,	#14
	ld	a, #<(_whitePieces)
	ld	(hl+), a
	ld	(hl), #>(_whitePieces)
	jr	00161$
00160$:
	ldhl	sp,	#14
	ld	(hl), #<(_blackPieces)
	inc	hl
	ld	(hl), #>(_blackPieces)
00161$:
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	C$main.c$372$4_0$248	= .
	.globl	C$main.c$372$4_0$248
;main.c:372: int dx = (cursorx - 4) - pieces[selectedCoords].x;
	ld	a, (#_cursorx)
	ldhl	sp,	#14
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	(hl), e
	ld	hl, #_selectedCoords
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl), a
	pop	de
	push	de
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
	C$main.c$373$4_0$248	= .
	.globl	C$main.c$373$4_0$248
;main.c:373: int dy = (cursory - 4) - pieces[selectedCoords].y;
	ld	a, (#_cursory)
	ldhl	sp,	#14
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
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
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	(hl), e
	C$main.c$374$4_0$248	= .
	.globl	C$main.c$374$4_0$248
;main.c:374: if (cursorx - 4 == pieces[selectedCoords].x && cursory - 4 == pieces[selectedCoords].y) {
	ldhl	sp,	#4
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	NZ, 00142$
	dec	hl
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	NZ, 00142$
	ldhl	sp,	#10
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	NZ, 00311$
	dec	hl
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jp	Z,00146$
00311$:
00142$:
	C$main.c$376$4_0$248	= .
	.globl	C$main.c$376$4_0$248
;main.c:376: } else if (isValidMove(cursorx - 4, cursory - 4, currentPlayer, selectedCoords)) {
	ld	a, (#_cursory)
	add	a, #0xfc
	ld	e, a
	ld	a, (#_cursorx)
	add	a, #0xfc
	ld	c, a
	ld	hl, #_selectedCoords
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_selectedCoords + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	a, (#_currentPlayer)
	push	af
	inc	sp
	ld	a, c
	call	_isValidMove
	bit	0,a
	jp	Z, 00146$
	C$main.c$377$5_0$250	= .
	.globl	C$main.c$377$5_0$250
;main.c:377: if (hasValidCaptureMoves(currentPlayer)) {
	ld	a, (#_currentPlayer)
	call	_hasValidCaptureMoves
	bit	0,a
	jp	Z, 00137$
	C$main.c$378$6_0$251	= .
	.globl	C$main.c$378$6_0$251
;main.c:378: if (abs(dx) == 2 * SQUARE_SIZE || abs(dy) == 2 * SQUARE_SIZE) {
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_abs
	pop	hl
	ld	a, e
	sub	a, #0x20
	or	a, d
	jr	Z, 00127$
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_abs
	pop	hl
	ld	a, e
	sub	a, #0x20
	or	a, d
	jp	NZ,00146$
00127$:
	C$main.c$379$7_0$252	= .
	.globl	C$main.c$379$7_0$252
;main.c:379: int capturedIndex = getCaptureIndex(((cursorx - 4) - (dx/2)), ((cursory - 4) - (dy/2)), opponentPieces, numOpponentPieces);
	ld	a, (#_cursory)
	add	a, #0xfc
	ldhl	sp,	#13
	ld	(hl+), a
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl), a
	ldhl	sp,	#15
	bit	7, (hl)
	jr	Z, 00162$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl), a
00162$:
	ldhl	sp,#11
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	sra	b
	rr	c
	ld	a, (hl-)
	sub	a, c
	ld	(hl), a
	ld	a, (#_cursorx)
	add	a, #0xfc
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#15
	ld	(hl), a
	ldhl	sp,	#9
	bit	7, (hl)
	jr	Z, 00163$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl), a
00163$:
	ldhl	sp,	#15
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl+)
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	ld	(hl), a
	ld	de, #0x000c
	push	de
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#16
	ld	e, (hl)
	ldhl	sp,	#19
	ld	a, (hl)
	call	_getCaptureIndex
	C$main.c$380$7_0$252	= .
	.globl	C$main.c$380$7_0$252
;main.c:380: if (capturedIndex != -1) {
	ld	a, c
	and	a, b
	inc	a
	jp	Z,00146$
	C$main.c$381$8_0$253	= .
	.globl	C$main.c$381$8_0$253
;main.c:381: opponentPieces[capturedIndex].x = 0;
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	C$main.c$382$8_0$253	= .
	.globl	C$main.c$382$8_0$253
;main.c:382: opponentPieces[capturedIndex].y = 0;
	inc	bc
	xor	a, a
	ld	(bc), a
	C$main.c$383$8_0$253	= .
	.globl	C$main.c$383$8_0$253
;main.c:383: pieces[selectedCoords].x = cursorx - 4; 
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
	ld	a, (#_cursorx)
	add	a, #0xfc
	ld	(bc), a
	C$main.c$384$8_0$253	= .
	.globl	C$main.c$384$8_0$253
;main.c:384: pieces[selectedCoords].y = cursory - 4;
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
	inc	hl
	ld	c, l
	ld	b, h
	ld	a, (#_cursory)
	add	a, #0xfc
	ld	(bc), a
	C$main.c$385$8_0$253	= .
	.globl	C$main.c$385$8_0$253
;main.c:385: promoteToKing(pieces, numPieces, currentPlayer);
	ld	a, (#_currentPlayer)
	push	af
	inc	sp
	ld	bc, #0x000c
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_promoteToKing
	C$main.c$386$8_0$253	= .
	.globl	C$main.c$386$8_0$253
;main.c:386: printBlack();
	call	_printBlack
	C$main.c$387$8_0$253	= .
	.globl	C$main.c$387$8_0$253
;main.c:387: printWhite();
	call	_printWhite
	C$main.c$388$8_0$253	= .
	.globl	C$main.c$388$8_0$253
;main.c:388: if (hasValidCaptureMoves(currentPlayer)) {
	ld	a, (#_currentPlayer)
	call	_hasValidCaptureMoves
	bit	0,a
	jp	NZ, 00146$
	C$main.c$391$9_0$255	= .
	.globl	C$main.c$391$9_0$255
;main.c:391: if (currentPlayer == BLACK_PLAYER) {
	ld	hl, #_currentPlayer
	ld	a, (hl)
	or	a, a
	jr	NZ, 00120$
	C$main.c$392$10_0$256	= .
	.globl	C$main.c$392$10_0$256
;main.c:392: currentPlayer = WHITE_PLAYER;
	ld	(hl), #0x01
	jr	00121$
00120$:
	C$main.c$394$10_0$257	= .
	.globl	C$main.c$394$10_0$257
;main.c:394: currentPlayer = BLACK_PLAYER;
	ld	hl, #_currentPlayer
	ld	(hl), #0x00
00121$:
	C$main.c$396$9_0$255	= .
	.globl	C$main.c$396$9_0$255
;main.c:396: printTurn();
	call	_printTurn
	C$main.c$397$9_0$255	= .
	.globl	C$main.c$397$9_0$255
;main.c:397: pieceSelected = false;
	ld	hl, #_pieceSelected
	ld	(hl), #0x00
	C$main.c$398$9_0$255	= .
	.globl	C$main.c$398$9_0$255
;main.c:398: break; // Exit the loop after a piece has been moved
	jp	00151$
00137$:
	C$main.c$402$5_0$250	= .
	.globl	C$main.c$402$5_0$250
;main.c:402: } else if (abs(dx) == 1 * SQUARE_SIZE || abs(dy) == 1 * SQUARE_SIZE) {
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_abs
	pop	hl
	ld	a, e
	sub	a, #0x10
	or	a, d
	jr	Z, 00133$
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_abs
	pop	hl
	ld	a, e
	sub	a, #0x10
	or	a, d
	jp	NZ,00146$
00133$:
	C$main.c$403$6_0$258	= .
	.globl	C$main.c$403$6_0$258
;main.c:403: pieces[selectedCoords].x = cursorx - 4; 
	ld	hl, #_selectedCoords
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl), a
	ld	a, (#_cursorx)
	ldhl	sp,	#15
	ld	(hl), a
	ld	a, (hl-)
	add	a, #0xfc
	ld	c, a
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
	C$main.c$404$6_0$258	= .
	.globl	C$main.c$404$6_0$258
;main.c:404: pieces[selectedCoords].y = cursory - 4;
	ld	hl, #_selectedCoords
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
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
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl), a
	ld	a, (#_cursory)
	ldhl	sp,	#15
	ld	(hl), a
	ld	a, (hl-)
	add	a, #0xfc
	ld	c, a
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
	C$main.c$405$6_0$258	= .
	.globl	C$main.c$405$6_0$258
;main.c:405: promoteToKing(pieces, numPieces, currentPlayer);
	ld	a, (#_currentPlayer)
	push	af
	inc	sp
	ld	bc, #0x000c
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_promoteToKing
	C$main.c$406$6_0$258	= .
	.globl	C$main.c$406$6_0$258
;main.c:406: if (currentPlayer == BLACK_PLAYER) {
	ld	hl, #_currentPlayer
	ld	a, (hl)
	or	a, a
	jr	NZ, 00131$
	C$main.c$407$7_0$259	= .
	.globl	C$main.c$407$7_0$259
;main.c:407: currentPlayer = WHITE_PLAYER;
	ld	(hl), #0x01
	jr	00132$
00131$:
	C$main.c$409$7_0$260	= .
	.globl	C$main.c$409$7_0$260
;main.c:409: currentPlayer = BLACK_PLAYER;
	ld	hl, #_currentPlayer
	ld	(hl), #0x00
00132$:
	C$main.c$411$6_0$258	= .
	.globl	C$main.c$411$6_0$258
;main.c:411: printBlack();
	call	_printBlack
	C$main.c$412$6_0$258	= .
	.globl	C$main.c$412$6_0$258
;main.c:412: printWhite();
	call	_printWhite
	C$main.c$413$6_0$258	= .
	.globl	C$main.c$413$6_0$258
;main.c:413: printTurn();
	call	_printTurn
	C$main.c$414$6_0$258	= .
	.globl	C$main.c$414$6_0$258
;main.c:414: pieceSelected = false;
	ld	hl, #_pieceSelected
	ld	(hl), #0x00
	C$main.c$415$6_0$258	= .
	.globl	C$main.c$415$6_0$258
;main.c:415: break; // Exit the loop after a piece has been moved
	jr	00151$
00146$:
	C$main.c$419$3_0$247	= .
	.globl	C$main.c$419$3_0$247
;main.c:419: if (joypad_input & J_B) {
	ld	a, (#_joypad_input)
	bit	5, a
	jp	Z,00149$
	C$main.c$420$4_0$261	= .
	.globl	C$main.c$420$4_0$261
;main.c:420: pieceSelected = false;
	ld	hl, #_pieceSelected
	ld	(hl), #0x00
	C$main.c$421$4_0$261	= .
	.globl	C$main.c$421$4_0$261
;main.c:421: printBlack();
	call	_printBlack
	C$main.c$422$4_0$261	= .
	.globl	C$main.c$422$4_0$261
;main.c:422: printWhite();
	call	_printWhite
	C$main.c$423$2_0$239	= .
	.globl	C$main.c$423$2_0$239
;main.c:423: break;
00151$:
	C$main.c$426$2_0$239	= .
	.globl	C$main.c$426$2_0$239
;main.c:426: delay(100);
	ld	de, #0x0064
	call	_delay
	jp	00153$
	C$main.c$428$1_0$238	= .
	.globl	C$main.c$428$1_0$238
;main.c:428: }
	add	sp, #16
	C$main.c$428$1_0$238	= .
	.globl	C$main.c$428$1_0$238
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
	.db #0x20	; 32
Fmain$__xinit_cursory$0_0$0 == .
__xinit__cursory:
	.db #0x20	; 32
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
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
Fmain$__xinit_squareTR$0_0$0 == .
__xinit__squareTR:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
Fmain$__xinit_squareBL$0_0$0 == .
__xinit__squareBL:
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
Fmain$__xinit_squareBR$0_0$0 == .
__xinit__squareBR:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
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
