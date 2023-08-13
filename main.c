#include <gb/gb.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <gbdk/font.h>

#define BLACK_PLAYER 0
#define WHITE_PLAYER 1
#define MAX_BLACK_PIECES 12
#define MAX_WHITE_PIECES 12
#define SQUARE_SIZE 16
#define SPRITE_TILE_BLACK 4
#define SPRITE_TILE_WHITE 16
#define DEBOUNCE_DELAY 6 // Adjust this value based on your requirements (in milliseconds)
UBYTE lastButtonState = 0; // Variable to store the previous button state
UINT16 debounceTimer = 0; // Variable to track the time since the last button press
int selectedPieceIndex = -1;

UINT8 cursorx = 32;
UINT8 cursory = 32;
UBYTE joypad_input;
UINT8 currentPlayer = BLACK_PLAYER;
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
unsigned char blackKing[] = {
  0xFF,0xFF,0xDB,0xFF,0x66,0xFF,0x81,0xFF,
  0x81,0xFF,0xC3,0xFF,0xFF,0xFF,0xFF,0xFF
};
unsigned char whiteKing[] = {
  0xFF,0x00,0xDB,0x24,0x66,0x99,0x81,0x7E,
  0x81,0x7E,0xC3,0x3C,0xFF,0x00,0xFF,0x00
};
void moveSquare() {
      move_sprite(0, cursorx - 8, cursory - 8);
      move_sprite(1, cursorx + 0, cursory - 8);
      move_sprite(2, cursorx - 8, cursory + 0);
      move_sprite(3, cursorx + 0, cursory + 0);
}
typedef struct {
    UINT8 x;
    UINT8 y;
    bool isKing; // Field to store whether the piece is a king or not
} Piece;
Piece blackPieces[MAX_BLACK_PIECES] = {
    {44, 28}, {76, 28}, {108, 28}, {140, 28},
    {28, 44}, {60, 44}, {92, 44}, {124, 44},
    {44, 60}, {76, 60}, {108, 60}, {140, 60}
};
Piece whitePieces[MAX_WHITE_PIECES] = {
    {28, 140}, {60, 140}, {92, 140}, {124, 140},
    {44, 124}, {76, 124}, {108, 124}, {140, 124},
    {28, 108}, {60, 108}, {92, 108}, {124, 108}
};
void promoteToKing(Piece* pieces, int numPieces, UINT8 player) {
    for (int i = 0; i < numPieces; i++) {
        if (pieces[i].y == 28 && player == WHITE_PLAYER) {
            pieces[i].isKing = true;
        } else if (pieces[i].y == 140 && player == BLACK_PLAYER) {
            pieces[i].isKing = true;
        }
    }
}
void dpad() {
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
    moveSquare();
}
void font() {
    font_t min_font;
    font_init();
    min_font = font_load(font_ibm_fixed);
    font_set(min_font);
}
void printTurn() {
    if (currentPlayer == BLACK_PLAYER){
        set_win_tiles(2, 0, 16, 1, currentPlayerBlackText);
    } else {
        set_win_tiles(2, 0, 16, 1, currentPlayerWhiteText);
    }
    move_win(7, 136);
}
void printbkg() {
    set_bkg_data(1, 1, tile1);
    set_bkg_data(2, 1, tile2);
    set_bkg_data(3, 1, tile3);
    set_bkg_tiles(0, 0, 20, 18, map);
}
void printSquare() {
    set_sprite_data(0, 1, squareTL);
    set_sprite_data(1, 1, squareTR);
    set_sprite_data(2, 1, squareBL);
    set_sprite_data(3, 1, squareBR);
    set_sprite_tile(0, 0);
    set_sprite_tile(1, 1);
    set_sprite_tile(2, 2);
    set_sprite_tile(3, 3);
    moveSquare();
}
void printBlack() {
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
void printWhite() {
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
bool isMoveWithinBoard(UINT8 x, UINT8 y) {
    return (x >= 20 && x <=148 && y >= 20 && y <= 148);
}
int getCaptureIndex(UINT8 capturedX, UINT8 capturedY, Piece* opponentPieces, int numOpponentPieces) {
    // Check collision for each piece
    for (int i = 0; i < numOpponentPieces; i++) {
        UINT8 pieceX = opponentPieces[i].x;
        UINT8 pieceY = opponentPieces[i].y;
        if (capturedX == pieceX && capturedY == pieceY) {
            // Captured piece found, return its index
            return i;
        }
    }
    // If no collision is found, return -1 to indicate no piece was captured
    return -1;
}
// Function to check if a move is valid
bool isValidMove(UINT8 cursorx, UINT8 cursory, UINT8 currentPlayer, int selectedCoords) {
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
    if ((currentPlayer == BLACK_PLAYER && dy < 0 && !pieces[selectedCoords].isKing) ||
        (currentPlayer == WHITE_PLAYER && dy > 0 && !pieces[selectedCoords].isKing)) {
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
bool checkCollision(UINT8 cursorx, UINT8 cursory, int currentPlayer) {
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
        UINT8 pieceX = pieces[i].x;
        UINT8 pieceY = pieces[i].y;
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
bool hasValidCaptureMoves(UINT8 currentPlayer) {
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
bool hasValidNonCaptureMoves(Piece* pieces, int numPieces, UINT8 currentPlayer) {
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
void main() {
    font();
    printTurn();
    printbkg();
    printSquare();
    printBlack();
    printWhite();
    SHOW_BKG;  
    SHOW_SPRITES;
    SHOW_WIN;
    while(1) {
        joypad_input = joypad();
            // Debounce the button input
        if (joypad_input != lastButtonState) {
            debounceTimer = 0; // Reset the debounce timer
            lastButtonState = joypad_input;
        } else if (debounceTimer < DEBOUNCE_DELAY) {
            debounceTimer += 100; // Increment the debounce timer based on the loop delay (100ms in this code)
            continue; // Skip processing input until the debounce delay is reached
        }
        dpad();
        if (joypad_input & J_A) {
            if (pieceSelected == false) {
                checkCollision(cursorx - 4, cursory - 4, currentPlayer);
                if (currentPlayer == BLACK_PLAYER) {
                    if (selectedPieceIndex >= 4 && selectedPieceIndex < 16){
                        pieceSelected = true;
                    }
                } else if (selectedPieceIndex >= 16 && selectedPieceIndex < 28) {
                    pieceSelected = true;
                }
            }
        }
        while (pieceSelected == true) {
            delay(100);
            joypad_input = joypad(); // Update the input inside the loop
            dpad();
            move_sprite(selectedPieceIndex, cursorx - 4, cursory - 4);
            if (joypad_input & J_A) {
                Piece* pieces = (currentPlayer == BLACK_PLAYER) ? blackPieces : whitePieces;
                Piece* opponentPieces = (currentPlayer == BLACK_PLAYER) ? whitePieces : blackPieces;
                int numPieces = (currentPlayer == BLACK_PLAYER) ? MAX_BLACK_PIECES : MAX_WHITE_PIECES;
                int numOpponentPieces = (currentPlayer == BLACK_PLAYER) ? MAX_WHITE_PIECES : MAX_BLACK_PIECES;

                // Calculate the distance moved in x and y direction
                int dx = (cursorx - 4) - pieces[selectedCoords].x;
                int dy = (cursory - 4) - pieces[selectedCoords].y;
                if (cursorx - 4 == pieces[selectedCoords].x && cursory - 4 == pieces[selectedCoords].y) {
                    //Do nothing
                } else if (isValidMove(cursorx - 4, cursory - 4, currentPlayer, selectedCoords)) {
                    if (hasValidCaptureMoves(currentPlayer)) {
                        if (abs(dx) == 2 * SQUARE_SIZE || abs(dy) == 2 * SQUARE_SIZE) {
                            int capturedIndex = getCaptureIndex(((cursorx - 4) - (dx/2)), ((cursory - 4) - (dy/2)), opponentPieces, numOpponentPieces);
                            if (capturedIndex != -1) {
                                opponentPieces[capturedIndex].x = 0;
                                opponentPieces[capturedIndex].y = 0;
                                pieces[selectedCoords].x = cursorx - 4; 
                                pieces[selectedCoords].y = cursory - 4;
                                promoteToKing(pieces, numPieces, currentPlayer);
                                printBlack();
                                printWhite();
                                if (hasValidCaptureMoves(currentPlayer)) {
                                    // continue the loop
                                } else {
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
                    } else if (abs(dx) == 1 * SQUARE_SIZE || abs(dy) == 1 * SQUARE_SIZE) {
                        pieces[selectedCoords].x = cursorx - 4; 
                        pieces[selectedCoords].y = cursory - 4;
                        promoteToKing(pieces, numPieces, currentPlayer);
                        if (currentPlayer == BLACK_PLAYER) {
                            currentPlayer = WHITE_PLAYER;
                        } else {
                            currentPlayer = BLACK_PLAYER;
                        }
                        printBlack();
                        printWhite();
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
    delay(100);
    }
}