#include <gb/gb.h>
#include <stdio.h>
#include <stdbool.h>
#include <types.h>
#include <stdlib.h>
#include <gbdk/font.h>
#include <time.h>

#define BLACK_PLAYER 0
#define WHITE_PLAYER 1
#define MAX_BLACK_PIECES 12
#define MAX_WHITE_PIECES 12
#define SQUARE_SIZE 16
#define SPRITE_TILE_BLACK 4
#define SPRITE_TILE_WHITE 16
#define DEBOUNCE_DELAY 100 // amount of time inbetween cursor moves (in milliseconds) when holding the dpad
UBYTE lastButtonState = 0; // Variable to store the previous button state
clock_t debounceClock = 0; // Variable to track the time since the last button press
UBYTE joypad_input;

int selectedPieceIndex = -1;
unsigned char cursorx = 28;
unsigned char cursory = 28;
unsigned char currentPlayer = BLACK_PLAYER;
int selectedCoords = 0;
bool pieceSelected = false;

unsigned char tile1[] = {
  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
};
unsigned char tile2[] = {
  0xFF,0x00,0xFF,0x00,0xFF,0x00,0xFF,0x00,
  0xFF,0x00,0xFF,0x00,0xFF,0x00,0xFF,0x00
};
unsigned char tile3[] = {
  0x00,0xFF,0x00,0xFF,0x00,0xFF,0x00,0xFF,
  0x00,0xFF,0x00,0xFF,0x00,0xFF,0x00,0xFF
};
unsigned char map[] = {
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 1, 1,
  1, 1, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 1, 1,
  1, 1, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 1, 1,
  1, 1, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 1, 1,
  1, 1, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 1, 1,
  1, 1, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 1, 1,
  1, 1, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 1, 1,
  1, 1, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 1, 1,
  1, 1, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 1, 1,
  1, 1, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 1, 1,
  1, 1, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 1, 1,
  1, 1, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 1, 1,
  1, 1, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 1, 1,
  1, 1, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 1, 1,
  1, 1, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 1, 1,
  1, 1, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 3, 3, 2, 2, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
};
unsigned char squareTL[] = {
  0xFF,0xFF,0xFF,0xFF,0xC0,0xC0,0xC0,0xC0,
  0xC0,0xC0,0xC0,0xC0,0xC0,0xC0,0xC0,0xC0
};
unsigned char squareTR[] = {
  0xFF,0xFF,0xFF,0xFF,0x03,0x03,0x03,0x03,
  0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03
};
unsigned char squareBL[] = {
  0xC0,0xC0,0xC0,0xC0,0xC0,0xC0,0xC0,0xC0,
  0xC0,0xC0,0xC0,0xC0,0xFF,0xFF,0xFF,0xFF
};
unsigned char squareBR[] = {
  0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,
  0x03,0x03,0x03,0x03,0xFF,0xFF,0xFF,0xFF
};
unsigned char black_piece[] = {
  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
};
unsigned char white_piece[] = {
  0xFF,0x00,0xFF,0x00,0xFF,0x00,0xFF,0x00,
  0xFF,0x00,0xFF,0x00,0xFF,0x00,0xFF,0x00
};
unsigned char currentPlayerBlackText[] = {
    0x00, 0x00, 0x50, 0x6C, 0x61, 0x79, 0x65, 0x72, 0x00, 0x42, 0x6C, 0x61, 0x63, 0x6B, 0x00, 0x00
};
unsigned char currentPlayerWhiteText[] = {
    0x00, 0x00, 0x50, 0x6C, 0x61, 0x79, 0x65, 0x72, 0x00, 0x57, 0x68, 0x69, 0x74, 0x65, 0x00, 0x00
};
unsigned char clearText[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};
unsigned char whiteWins[] = {
    0x00, 0x00, 0x00, 0x57, 0x68, 0x69, 0x74, 0x65, 0x00, 0x57, 0x69, 0x6E, 0x73, 0x00, 0x00, 0x00
};
unsigned char blackWins[] = {
    0x00, 0x00, 0x00, 0x42, 0x6C, 0x61, 0x63, 0x6B, 0x00, 0x57, 0x69, 0x6E, 0x73, 0x00, 0x00, 0x00
};
unsigned char blackKing[] = {
  0xFF,0xFF,0xDB,0xFF,0x66,0xFF,0x81,0xFF,
  0x81,0xFF,0xC3,0xFF,0xFF,0xFF,0xFF,0xFF
};
unsigned char whiteKing[] = {
  0xFF,0x00,0xDB,0x24,0x66,0x99,0x81,0x7E,
  0x81,0x7E,0xC3,0x3C,0xFF,0x00,0xFF,0x00
};

unsigned char board [8][8] = {
    {0, 2, 0, 2, 0, 2, 0, 2},
    {2, 0, 2, 0, 2, 0, 2, 0},
    {0, 2, 0, 2, 0, 2, 0, 2},
    {0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0},
    {1, 0, 1, 0, 1, 0, 1, 0},
    {0, 1, 0, 1, 0, 1, 0, 1},
    {1, 0, 1, 0, 1, 0, 1, 0}
};

typedef struct {
    unsigned char x;
    unsigned char y;
    bool isKing; // Field to store whether the piece is a king or not
} Piece;

Piece blackPieces[MAX_BLACK_PIECES] = {
    {28, 140}, {60, 140}, {92, 140}, {124, 140},
    {44, 124}, {76, 124}, {108, 124}, {140, 124},
    {28, 108}, {60, 108}, {92, 108}, {124, 108}
};

Piece whitePieces[MAX_WHITE_PIECES] = {
    {44, 28}, {76, 28}, {108, 28}, {140, 28},
    {28, 44}, {60, 44}, {92, 44}, {124, 44},
    {44, 60}, {76, 60}, {108, 60}, {140, 60}
};

void font(void) {
    font_t min_font;
    font_init();
    min_font = font_load(font_ibm_fixed);
    font_set(min_font);
}

void printbkg(void) {
    set_bkg_data(1, 1, tile1);
    set_bkg_data(2, 1, tile2);
    set_bkg_data(3, 1, tile3);
    set_bkg_tiles(0, 0, 20, 18, map);
}

void moveCursor(void) {
      move_sprite(0, cursorx - 4, cursory - 4);
      move_sprite(1, cursorx + 4, cursory - 4);
      move_sprite(2, cursorx - 4, cursory + 4);
      move_sprite(3, cursorx + 4, cursory + 4);
}

void printCursor(void) {
    set_sprite_data(0, 1, squareTL);
    set_sprite_data(1, 1, squareTR);
    set_sprite_data(2, 1, squareBL);
    set_sprite_data(3, 1, squareBR);
    set_sprite_tile(0, 0);
    set_sprite_tile(1, 1);
    set_sprite_tile(2, 2);
    set_sprite_tile(3, 3);
    moveCursor();
}

void printBlack(void) {
    set_sprite_data(4, 12, black_piece);
    set_sprite_data(8, 12, blackKing);

    for (int i = 0; i < 12; i++){
        if (blackPieces[i].isKing) {
            set_sprite_tile(i + 4, 8); // Use the black king sprite tile
        } else {
            set_sprite_tile(i + 4, 4); // Use the black regular piece sprite tile
        }
        move_sprite(i + 4, blackPieces[i].x, blackPieces[i].y);
    }
}

void printWhite(void) {
    set_sprite_data(5, 12, white_piece);
    set_sprite_data(20, 12, whiteKing);

    for (int i = 0; i < 12; i++){
        if (whitePieces[i].isKing) {
            set_sprite_tile(i + 16, 20); // Use the white king sprite tile
        } else {
            set_sprite_tile(i + 16, 5); // Use the white regular piece sprite tile
        }
        move_sprite(i + 16, whitePieces[i].x, whitePieces[i].y);
    }
}

void promoteToKing(Piece* pieces, int numPieces, unsigned char player) {
    for (int i = 0; i < numPieces; i++) {
        if (pieces[i].y == 140 && player == WHITE_PLAYER) {
            pieces[i].isKing = true;
        } else if (pieces[i].y == 28 && player == BLACK_PLAYER) {
            pieces[i].isKing = true;
        }
    }
}

void dpad(void) {
    if (joypad_input & J_RIGHT) {
        cursorx = cursorx + SQUARE_SIZE;
    }
    if (joypad_input & J_LEFT) {
        cursorx = cursorx - SQUARE_SIZE;
    }
    if (joypad_input & J_UP) {
        cursory = cursory - SQUARE_SIZE;
    }
    if (joypad_input & J_DOWN) {
        cursory = cursory + SQUARE_SIZE;
    }
    moveCursor();
}

bool isMoveWithinBoard(unsigned char x, unsigned char y) {
    return (x >= 20 && x <=148 && y >= 20 && y <= 148);
}

bool isValidMove(unsigned char cursorx, unsigned char cursory, unsigned char currentPlayer, int selectedCoords) {
    Piece* pieces;
    Piece* opponentPieces;
    int numPieces;
    int numOpponentPieces;
    // Set the correct piece array based on the current player
    if (currentPlayer == BLACK_PLAYER) {
        pieces = blackPieces;
        opponentPieces = whitePieces;
        numPieces = MAX_BLACK_PIECES;
        numOpponentPieces = MAX_WHITE_PIECES;
    } else {
        pieces = whitePieces;
        opponentPieces = blackPieces;
        numPieces = MAX_WHITE_PIECES;
        numOpponentPieces = MAX_BLACK_PIECES;
    }
    // Calculate the distance moved in x and y direction
    int dx = cursorx - pieces[selectedCoords].x;
    int dy = cursory - pieces[selectedCoords].y;
    // Check if the cursor is within the bounds of the board
    if (!(isMoveWithinBoard(cursorx, cursory))) {
        return false;
    }
    // Check if the selectedCoords is within the valid range of the array
    if (selectedCoords < 0 || selectedCoords >= numPieces) {
        return false;
    }
    // Check if the piece is moving diagonally
    if (abs(dx) != abs(dy)) {
        return false;
    }
    // Check if the piece is moving forward or backward based on the player's color
    if ((currentPlayer == BLACK_PLAYER && dy > 0 && !pieces[selectedCoords].isKing) ||
        (currentPlayer == WHITE_PLAYER && dy < 0 && !pieces[selectedCoords].isKing)) {
        return false;
    }
    // Check if the target position is empty
    for (int i = 0; i < numPieces; i++) {
        if (whitePieces[i].x == cursorx && whitePieces[i].y == cursory) {
            return false;
        }
        if (blackPieces[i].x == cursorx && blackPieces[i].y == cursory) {
            return false;
        }
    }
    if (abs(dx) > 2 * SQUARE_SIZE || abs(dy) > 2 * SQUARE_SIZE) {
        return false;
    }
    // Move is valid, return true
    return true;
}
// Function to check collision between cursor and pieces
bool checkCollision(unsigned char cursorx, unsigned char cursory, int currentPlayer) {
    int numPieces;
    Piece* pieces;
    // Set the correct piece array based on the current player
    if (currentPlayer == BLACK_PLAYER) {
        pieces = blackPieces;
        numPieces = 12;
    } else {
        pieces = whitePieces;
        numPieces = 12;
    }
    // Check collision for each piece
    for (int i = 0; i < numPieces; i++) {
        unsigned char pieceX = pieces[i].x;
        unsigned char pieceY = pieces[i].y;
        // Check for collision by comparing boundaries
        if (cursorx == (pieceX) &&
            cursory == (pieceY)) {
            if (currentPlayer == BLACK_PLAYER) {
                selectedCoords = i;
                selectedPieceIndex = i + 4;
            } else {
                selectedCoords = i;
                selectedPieceIndex = i + 16;
            }
            return true;
        }
    }
    // No collision with any piece
    selectedPieceIndex = -1;
    return false;
}

int getCaptureIndex(unsigned char capturedX, unsigned char capturedY, Piece* opponentPieces, int numOpponentPieces) {
    // Check collision for each piece
    for (int i = 0; i < numOpponentPieces; i++) {
        unsigned char pieceX = opponentPieces[i].x;
        unsigned char pieceY = opponentPieces[i].y;
        if (capturedX == pieceX && capturedY == pieceY) {
            // Captured piece found, return its index
            return i;
        }
    }
    // If no collision is found, return -1 to indicate no piece was captured
    return -1;
}

bool hasValidCaptureMoves(unsigned char currentPlayer) {
    Piece* pieces = (currentPlayer == BLACK_PLAYER) ? blackPieces : whitePieces;
    Piece* opponentPieces = (currentPlayer == BLACK_PLAYER) ? whitePieces : blackPieces;
    int numPieces = (currentPlayer == BLACK_PLAYER) ? MAX_BLACK_PIECES : MAX_WHITE_PIECES;
    int numOpponentPieces = (currentPlayer == BLACK_PLAYER) ? MAX_WHITE_PIECES : MAX_BLACK_PIECES;
    for (int i = 0; i < numPieces; i++) {
        if (isValidMove(pieces[i].x - 2 * SQUARE_SIZE, pieces[i].y + 2 * SQUARE_SIZE, currentPlayer, i) && (getCaptureIndex((((pieces[i].x - 2 * SQUARE_SIZE) + (pieces[i].x)) / 2), (((pieces[i].y + 2 * SQUARE_SIZE) + (pieces[i].y)) / 2), opponentPieces, numOpponentPieces) != -1) ||
            isValidMove(pieces[i].x + 2 * SQUARE_SIZE, pieces[i].y + 2 * SQUARE_SIZE, currentPlayer, i) && (getCaptureIndex((((pieces[i].x + 2 * SQUARE_SIZE) + (pieces[i].x)) / 2), (((pieces[i].y + 2 * SQUARE_SIZE) + (pieces[i].y)) / 2), opponentPieces, numOpponentPieces) != -1) ||
            isValidMove(pieces[i].x - 2 * SQUARE_SIZE, pieces[i].y - 2 * SQUARE_SIZE, currentPlayer, i) && (getCaptureIndex((((pieces[i].x - 2 * SQUARE_SIZE) + (pieces[i].x)) / 2), (((pieces[i].y - 2 * SQUARE_SIZE) + (pieces[i].y)) / 2), opponentPieces, numOpponentPieces) != -1) ||
            isValidMove(pieces[i].x + 2 * SQUARE_SIZE, pieces[i].y - 2 * SQUARE_SIZE, currentPlayer, i) && (getCaptureIndex((((pieces[i].x + 2 * SQUARE_SIZE) + (pieces[i].x)) / 2), (((pieces[i].y - 2 * SQUARE_SIZE) + (pieces[i].y)) / 2), opponentPieces, numOpponentPieces) != -1)) {
            return true; // Found at least one valid capture move
        }
    }
    return false; // No valid capture moves found for any piece
}
bool hasValidNonCaptureMoves(unsigned char currentPlayer) {
    Piece* pieces = (currentPlayer == BLACK_PLAYER) ? blackPieces : whitePieces;
    int numPieces = (currentPlayer == BLACK_PLAYER) ? MAX_BLACK_PIECES : MAX_WHITE_PIECES;
    for (int i = 0; i < numPieces; i++) {
        if (isValidMove(pieces[i].x - SQUARE_SIZE, pieces[i].y - SQUARE_SIZE, currentPlayer, i) ||
            isValidMove(pieces[i].x + SQUARE_SIZE, pieces[i].y - SQUARE_SIZE, currentPlayer, i) ||
            isValidMove(pieces[i].x - SQUARE_SIZE, pieces[i].y + SQUARE_SIZE, currentPlayer, i) ||
            isValidMove(pieces[i].x + SQUARE_SIZE, pieces[i].y + SQUARE_SIZE, currentPlayer, i)) {
            return true; // Found at least one valid move
        }
    }
    return false; // No valid moves found for any piece
}

bool hasValidMoves(unsigned char currentPlayer) {
    bool hasValidNonCapture = hasValidNonCaptureMoves(currentPlayer);
    bool hasValidCapture = hasValidCaptureMoves(currentPlayer);
    if (hasValidNonCapture || hasValidCapture) {
        return true; // No valid moves
    }
    return false; // Has valid moves
}

void printTurn(void) {
    if (hasValidMoves(currentPlayer)){
        if (currentPlayer == BLACK_PLAYER){
            set_win_tiles(2, 0, 16, 1, currentPlayerBlackText);
        } else {
            set_win_tiles(2, 0, 16, 1, currentPlayerWhiteText);
        }
        move_win(7, 136);
    } else {
        set_win_tiles(2, 0, 16, 1, clearText);
        if (currentPlayer == BLACK_PLAYER){
            set_win_tiles(2, 8, 16, 1, whiteWins);
        } else {
            set_win_tiles(2, 8, 16, 1, blackWins);
        }
        move_win(7, 7);
    }
}

int milisecondsToClockCycles(int milliseconds) {
    return (milliseconds * CLOCKS_PER_SEC) / 1000;
}

void main(void) {
    font();
    printTurn();
    printbkg();
    printCursor();
    printBlack();
    printWhite();
    SHOW_BKG;  
    SHOW_SPRITES;
    SHOW_WIN;
    clock_t debounceClock = clock(); // Initialize the debounce clock with the current time
    while(1) {
        joypad_input = joypad();
        if (joypad_input != lastButtonState) { // Debounce the button input
            debounceClock = clock(); // Reset the debounce clock
            lastButtonState = joypad_input;
        } else if (clock() - debounceClock >= milisecondsToClockCycles(DEBOUNCE_DELAY)) {
            debounceClock = clock(); // Reset the debounce clock
        } else {
            continue; // Skip processing input until the debounce delay is reached
        }

        dpad();

        if (joypad_input & J_A) {
            pieceSelected = checkCollision(cursorx, cursory, currentPlayer);
        }

        while (pieceSelected == true) {
            joypad_input = joypad();
            if (joypad_input != lastButtonState) { // Debounce the button input
                debounceClock = clock(); // Reset the debounce clock
                lastButtonState = joypad_input;
            } else if (clock() - debounceClock >= milisecondsToClockCycles(DEBOUNCE_DELAY)) {
                debounceClock = clock(); // Reset the debounce clock
            } else {
                continue; // Skip processing input until the debounce delay is reached
            }

            dpad();

            move_sprite(selectedPieceIndex, cursorx, cursory);
            
            if (joypad_input & J_A) {
                Piece* pieces = (currentPlayer == BLACK_PLAYER) ? blackPieces : whitePieces;                
                if (cursorx == pieces[selectedCoords].x && cursory == pieces[selectedCoords].y) {
                    //Do nothing
                } else if (isValidMove(cursorx, cursory, currentPlayer, selectedCoords)) {
                    int numPieces = (currentPlayer == BLACK_PLAYER) ? MAX_BLACK_PIECES : MAX_WHITE_PIECES;
                    if (hasValidCaptureMoves(currentPlayer)) {
                        // Calculate the distance moved in x and y direction
                        int dx = cursorx - pieces[selectedCoords].x;
                        int dy = cursory- pieces[selectedCoords].y;
                        if (abs(dx) == 2 * SQUARE_SIZE || abs(dy) == 2 * SQUARE_SIZE) {
                            Piece* opponentPieces = (currentPlayer == BLACK_PLAYER) ? whitePieces : blackPieces;
                            int capturedIndex = getCaptureIndex((cursorx - (dx/2)), (cursory - (dy/2)), opponentPieces, (currentPlayer == BLACK_PLAYER) ? MAX_WHITE_PIECES : MAX_BLACK_PIECES);
                            if (capturedIndex != -1) {
                                opponentPieces[capturedIndex].x = 0;
                                opponentPieces[capturedIndex].y = 0;
                                pieces[selectedCoords].x = cursorx; 
                                pieces[selectedCoords].y = cursory;
                                promoteToKing(pieces, numPieces, currentPlayer);
                                printBlack();
                                printWhite();
                                if (!hasValidCaptureMoves(currentPlayer)) {
                                    if (currentPlayer == BLACK_PLAYER) {
                                        currentPlayer = WHITE_PLAYER;
                                    } else {
                                        currentPlayer = BLACK_PLAYER;
                                    }
                                    printTurn();
                                    pieceSelected = false;
                                    break; // Exit the loop after a piece has been moved
                                }
                            }
                        }
                    } else if (abs(cursorx - pieces[selectedCoords].x) == 1 * SQUARE_SIZE || abs(cursory - pieces[selectedCoords].y) == 1 * SQUARE_SIZE) {
                        pieces[selectedCoords].x = cursorx; 
                        pieces[selectedCoords].y = cursory;
                        promoteToKing(pieces, numPieces, currentPlayer);
                        printBlack();
                        printWhite();
                        if (currentPlayer == BLACK_PLAYER) {
                            currentPlayer = WHITE_PLAYER;
                        } else {
                            currentPlayer = BLACK_PLAYER;
                        }
                        printTurn();
                        pieceSelected = false;
                        break; // Exit the loop after a piece has been moved
                    }
                }
            }
            if (joypad_input & J_B) {
                pieceSelected = false;
                printBlack();
                printWhite();
                break;
            }
        }
    }
}