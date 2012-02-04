#ifndef _EXA_BASE_H_
#define _EXA_BASE_H_

#include <GL/gl.h>
#include <GL/glu.h>
#include <SDL/SDL.h>
#undef main

#define exaglSwapBuffers SDL_GL_SwapBuffers
#define exaglGetProcAddress SDL_GL_GetProcAddress
#define exaglSetAttribute SDL_GL_SetAttribute
#define exaglGetAttribute SDL_GL_GetAttribute

#define EKEY_UNKNOWN		 0
#define EKEY_FIRST		 0
#define EKEY_BACKSPACE		 8
#define EKEY_TAB		 9
#define EKEY_CLEAR		 12
#define EKEY_RETURN		 13
#define EKEY_PAUSE		 19
#define EKEY_ESCAPE		 27
#define EKEY_SPACE		 32
#define EKEY_EXCLAIM		 33
#define EKEY_QUOTEDBL		 34
#define EKEY_HASH		 35
#define EKEY_DOLLAR		 36
#define EKEY_AMPERSAND		 38
#define EKEY_QUOTE		 39
#define EKEY_LEFTPAREN		 40
#define EKEY_RIGHTPAREN		 41
#define EKEY_ASTERISK		 42
#define EKEY_PLUS		 43
#define EKEY_COMMA		 44
#define EKEY_MINUS		 45
#define EKEY_PERIOD		 46
#define EKEY_SLASH		 47
#define EKEY_0			 48
#define EKEY_1			 49
#define EKEY_2			 50
#define EKEY_3			 51
#define EKEY_4			 52
#define EKEY_5			 53
#define EKEY_6			 54
#define EKEY_7			 55
#define EKEY_8			 56
#define EKEY_9			 57
#define EKEY_COLON		 58
#define EKEY_SEMICOLON		 59
#define EKEY_LESS		 60
#define EKEY_EQUALS		 61
#define EKEY_GREATER		 62
#define EKEY_QUESTION		 63
#define EKEY_AT			 64
#define EKEY_LEFTBRACKET	 91
#define EKEY_BACKSLASH		 92
#define EKEY_RIGHTBRACKET	 93
#define EKEY_CARET		 94
#define EKEY_UNDERSCORE		 95
#define EKEY_BACKQUOTE		 96
#define EKEY_a			 97
#define EKEY_b			 98
#define EKEY_c			 99
#define EKEY_d			 100
#define EKEY_e			 101
#define EKEY_f			 102
#define EKEY_g			 103
#define EKEY_h			 104
#define EKEY_i			 105
#define EKEY_j			 106
#define EKEY_k			 107
#define EKEY_l			 108
#define EKEY_m			 109
#define EKEY_n			 110
#define EKEY_o			 111
#define EKEY_p			 112
#define EKEY_q			 113
#define EKEY_r			 114
#define EKEY_s			 115
#define EKEY_t			 116
#define EKEY_u			 117
#define EKEY_v			 118
#define EKEY_w			 119
#define EKEY_x			 120
#define EKEY_y			 121
#define EKEY_z			 122
#define EKEY_DELETE		 127
#define EKEY_WORLD_0		 160
#define EKEY_WORLD_1		 161
#define EKEY_WORLD_2		 162
#define EKEY_WORLD_3		 163
#define EKEY_WORLD_4		 164
#define EKEY_WORLD_5		 165
#define EKEY_WORLD_6		 166
#define EKEY_WORLD_7		 167
#define EKEY_WORLD_8		 168
#define EKEY_WORLD_9		 169
#define EKEY_WORLD_10		 170
#define EKEY_WORLD_11		 171
#define EKEY_WORLD_12		 172
#define EKEY_WORLD_13		 173
#define EKEY_WORLD_14		 174
#define EKEY_WORLD_15		 175
#define EKEY_WORLD_16		 176
#define EKEY_WORLD_17		 177
#define EKEY_WORLD_18		 178
#define EKEY_WORLD_19		 179
#define EKEY_WORLD_20		 180
#define EKEY_WORLD_21		 181
#define EKEY_WORLD_22		 182
#define EKEY_WORLD_23		 183
#define EKEY_WORLD_24		 184
#define EKEY_WORLD_25		 185
#define EKEY_WORLD_26		 186
#define EKEY_WORLD_27		 187
#define EKEY_WORLD_28		 188
#define EKEY_WORLD_29		 189
#define EKEY_WORLD_30		 190
#define EKEY_WORLD_31		 191
#define EKEY_WORLD_32		 192
#define EKEY_WORLD_33		 193
#define EKEY_WORLD_34		 194
#define EKEY_WORLD_35		 195
#define EKEY_WORLD_36		 196
#define EKEY_WORLD_37		 197
#define EKEY_WORLD_38		 198
#define EKEY_WORLD_39		 199
#define EKEY_WORLD_40		 200
#define EKEY_WORLD_41		 201
#define EKEY_WORLD_42		 202
#define EKEY_WORLD_43		 203
#define EKEY_WORLD_44		 204
#define EKEY_WORLD_45		 205
#define EKEY_WORLD_46		 206
#define EKEY_WORLD_47		 207
#define EKEY_WORLD_48		 208
#define EKEY_WORLD_49		 209
#define EKEY_WORLD_50		 210
#define EKEY_WORLD_51		 211
#define EKEY_WORLD_52		 212
#define EKEY_WORLD_53		 213
#define EKEY_WORLD_54		 214
#define EKEY_WORLD_55		 215
#define EKEY_WORLD_56		 216
#define EKEY_WORLD_57		 217
#define EKEY_WORLD_58		 218
#define EKEY_WORLD_59		 219
#define EKEY_WORLD_60		 220
#define EKEY_WORLD_61		 221
#define EKEY_WORLD_62		 222
#define EKEY_WORLD_63		 223
#define EKEY_WORLD_64		 224
#define EKEY_WORLD_65		 225
#define EKEY_WORLD_66		 226
#define EKEY_WORLD_67		 227
#define EKEY_WORLD_68		 228
#define EKEY_WORLD_69		 229
#define EKEY_WORLD_70		 230
#define EKEY_WORLD_71		 231
#define EKEY_WORLD_72		 232
#define EKEY_WORLD_73		 233
#define EKEY_WORLD_74		 234
#define EKEY_WORLD_75		 235
#define EKEY_WORLD_76		 236
#define EKEY_WORLD_77		 237
#define EKEY_WORLD_78		 238
#define EKEY_WORLD_79		 239
#define EKEY_WORLD_80		 240
#define EKEY_WORLD_81		 241
#define EKEY_WORLD_82		 242
#define EKEY_WORLD_83		 243
#define EKEY_WORLD_84		 244
#define EKEY_WORLD_85		 245
#define EKEY_WORLD_86		 246
#define EKEY_WORLD_87		 247
#define EKEY_WORLD_88		 248
#define EKEY_WORLD_89		 249
#define EKEY_WORLD_90		 250
#define EKEY_WORLD_91		 251
#define EKEY_WORLD_92		 252
#define EKEY_WORLD_93		 253
#define EKEY_WORLD_94		 254
#define EKEY_WORLD_95		 255
#define EKEY_KP0		 256
#define EKEY_KP1		 257
#define EKEY_KP2		 258
#define EKEY_KP3		 259
#define EKEY_KP4		 260
#define EKEY_KP5		 261
#define EKEY_KP6		 262
#define EKEY_KP7		 263
#define EKEY_KP8		 264
#define EKEY_KP9		 265
#define EKEY_KP_PERIOD		 266
#define EKEY_KP_DIVIDE		 267
#define EKEY_KP_MULTIPLY	 268
#define EKEY_KP_MINUS		 269
#define EKEY_KP_PLUS		 270
#define EKEY_KP_ENTER		 271
#define EKEY_KP_EQUALS		 272
#define EKEY_UP			 273
#define EKEY_DOWN		 274
#define EKEY_RIGHT		 275
#define EKEY_LEFT		 276
#define EKEY_INSERT		 277
#define EKEY_HOME		 278
#define EKEY_END		 279
#define EKEY_PAGEUP		 280
#define EKEY_PAGEDOWN		 281
#define EKEY_F1			 282
#define EKEY_F2			 283
#define EKEY_F3			 284
#define EKEY_F4			 285
#define EKEY_F5			 286
#define EKEY_F6			 287
#define EKEY_F7			 288
#define EKEY_F8			 289
#define EKEY_F9			 290
#define EKEY_F10		 291
#define EKEY_F11		 292
#define EKEY_F12		 293
#define EKEY_F13		 294
#define EKEY_F14		 295
#define EKEY_F15		 296
#define EKEY_NUMLOCK		 300
#define EKEY_CAPSLOCK		 301
#define EKEY_SCROLLOCK		 302
#define EKEY_RSHIFT		 303
#define EKEY_LSHIFT		 304
#define EKEY_RCTRL		 305
#define EKEY_LCTRL		 306
#define EKEY_RALT		 307
#define EKEY_LALT		 308
#define EKEY_RMETA		 309
#define EKEY_LMETA		 310
#define EKEY_LSUPER		 311
#define EKEY_RSUPER		 312
#define EKEY_MODE		 313
#define EKEY_COMPOSE		 314
#define EKEY_HELP		 315
#define EKEY_PRINT		 316
#define EKEY_SYSREQ		 317
#define EKEY_BREAK		 318
#define EKEY_MENU		 319
#define EKEY_POWER		 320
#define EKEY_EURO		 321
#define EKEY_UNDO		 322

int exaSetParams (int x = 1024, int y = 768, int bpp = 32, int depthbits = 24, int stencilbits = 0, int accumbits = 0);
bool exaInit();
bool exaIsInit();
bool exaUpdate();
float exaGetElapsedTime();
float exaGetUptime();
void exaDelay (float secs);
void exaUSleep (unsigned long usec);
int exaGetKeyHits (int** keys);
bool exaIsKeyHit (int key);
int exaGetKeyDowns (int** keys);
bool exaIsKeyDown (int key);
int exaGetKeyTypes (int**keys);
bool exaIsKeyTyped (int key);
void exaKeyRepeat (float delay, float repeat);
int exaGetKBChars (char* charbuf);
char exaEKEY2char (int ekey,
		   bool shift = (exaIsKeyDown (EKEY_RSHIFT) ||
				 exaIsKeyDown (EKEY_LSHIFT) ),
		   bool capslock = exaIsKeyDown (EKEY_CAPSLOCK) );
bool exaIsPrintableEKEY (int ekey);
int exaGetMouseMove (int* x, int* y);
bool exaIsMouseButtonHit (unsigned char button);
bool exaIsMouseButtonDown (unsigned char button);
bool exaIsMouseWheelUp();
bool exaIsMouseWheelDown();
bool exaShutdown();
int exaIconifyWindow();
bool exaIsIconified();
int exaSetWindowCaption (const char* caption);
bool exaScreenshot (int*x, int*y, int*bytes, char**data, bool bgr = false);

#endif
