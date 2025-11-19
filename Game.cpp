#include "Game.h"
#include <random>

// Define static members
bitboard Game::zobrist_pieces[2][SIZE1];
bitboard Game::zobrist_turn;
bool Game::zobrist_initialized = false;

void Game::init_zobrist() {
    if (zobrist_initialized) return;
    
    // Use Mersenne Twister with fixed seed for reproducibility
    std::mt19937_64 rng(0x123456789ABCDEFULL);
    std::uniform_int_distribution<uint64_t> dist;
    
    // Initialize random values for each player/square combination
    for (int player = 0; player < 2; player++) {
        for (int square = 0; square < SIZE1; square++) {
            if (SIZE1 <= 64) {
                zobrist_pieces[player][square] = dist(rng);
            } else {
                // For 128-bit bitboards, combine two 64-bit values
                bitboard low = dist(rng);
                bitboard high = dist(rng);
                zobrist_pieces[player][square] = (static_cast<uint64_t>(high) << 32) << 32 | low;
            }
        }
    }
    
    // Initialize turn value
    if (SIZE1 <= 64) {
        zobrist_turn = dist(rng);
    } else {
        bitboard low = dist(rng);
        bitboard high = dist(rng);
        zobrist_turn = (static_cast<uint64_t>(high) << 32) << 32 | low;
    }
    
    zobrist_initialized = true;
}