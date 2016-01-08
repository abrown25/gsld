module gsl.message;
/* 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Gerard Jungman, Brian Gough
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

/*
* D interface file: gsl_message.h
* Author: Chibisi Chima-Okereke
*/

extern (C){

void gsl_message(const(char)* message, const(char)* file, int line, uint mask);

enum GSL_MESSAGE_MASK = 0xffffffffu; /* default all messages allowed */

extern __gshared uint gsl_message_mask;

enum GSL_MESSAGE_MASK_A = 1;
enum GSL_MESSAGE_MASK_B = 2;
enum GSL_MESSAGE_MASK_C = 4;
enum GSL_MESSAGE_MASK_D = 8;
enum GSL_MESSAGE_MASK_E = 16;
enum GSL_MESSAGE_MASK_F = 32;
enum GSL_MESSAGE_MASK_G = 64;
enum GSL_MESSAGE_MASK_H = 128;
}

