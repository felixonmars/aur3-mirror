
#include "exa-font.h"
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <wchar.h>
#include <freetype/config/ftheader.h>
#include <freetype/freetype.h>
#include <freetype/ftglyph.h>
#include <freetype/ftoutln.h>
#include <freetype/fttrigon.h>

#include <unistd.h>

void exaGLFont::load (const void*textureData, GLenum textureFormat, GLenum textureDataType, int texelWidth,
                      unsigned int textureWidth, unsigned int textureHeight,
                      unsigned int numGlyphs, exaGlyphParams *glyphParams)
{
	unsigned int i;
	float f;

	if (isLoaded) unload();

	charnum = numGlyphs;

	charlen = (float*) malloc (sizeof (float) * charnum);

	glGenTextures (1, &texture);
	ntexnames = 0;

	glBindTexture (GL_TEXTURE_2D, texture);
	glTexParameteri (GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri (GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri (GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
	glTexParameteri (GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
	glTexImage2D (GL_TEXTURE_2D, 0, texelWidth, textureWidth, textureHeight, 0, textureFormat, textureDataType, textureData);

	list = glGenLists (charnum);

	for (i = 0;i < charnum;i++) {
		charlen[i] =
		    f = (float) (fabs ( (glyphParams[i].x1) - (glyphParams[i].x2) )
		                 / fabs ( (glyphParams[i].y1) - (glyphParams[i].y2) ) );


		glNewList (list + i, GL_COMPILE);
		glBegin (GL_QUADS);
		glTexCoord2f ( (float) glyphParams[i].x1 / (float) textureWidth,
		               ( (float) glyphParams[i].y2 / (float) textureHeight) );
		glVertex2f (0, 0);
		glTexCoord2f ( (float) glyphParams[i].x2 / (float) textureWidth,
		               ( (float) glyphParams[i].y2 / (float) textureHeight) );
		glVertex2f (f, 0);
		glTexCoord2f ( (float) glyphParams[i].x2 / (float) textureWidth,
		               ( (float) glyphParams[i].y1 / (float) textureHeight) );
		glVertex2f (f, 1);
		glTexCoord2f ( (float) glyphParams[i].x1 / (float) textureWidth,
		               ( (float) glyphParams[i].y1 / (float) textureHeight) );
		glVertex2f (0, 1);
		glEnd();
		glTranslatef (f, 0, 0);
		glEndList();
	}
	isLoaded = true;
}

void exaGLFont::unload()
{
	if (!isLoaded) return;
	if (glIsTexture (texture) ) glDeleteTextures (1, &texture);
	if (ntexnames > 0) {
		free (texnames);
		ntexnames = 0;
	}
	glDeleteLists (list, charnum);
	isLoaded = false;
	charnum = 0;
}

static int _next_p2 (int a)
{
	register int r = 1;
	while ( (r < a) && (r != 0) ) r <<= 1;
	return r;
}


static void _makeglyph (int i, int charsizes[128][7], GLuint* texnames, int& maxtop, int&maxbottom, FT_Face face)
{
	int a, b;
	GLubyte* expanded_data;

	FT_Glyph glyph;
	FT_BitmapGlyph bmpglyph;
	FT_Load_Glyph (face, FT_Get_Char_Index (face, i), FT_LOAD_DEFAULT);
	FT_Get_Glyph (face->glyph, &glyph);
	FT_Glyph_To_Bitmap (&glyph, FT_RENDER_MODE_NORMAL, 0, 1);
	bmpglyph = (FT_BitmapGlyph) glyph;
	charsizes[i][0] = bmpglyph->bitmap.width;
	charsizes[i][1] = bmpglyph->bitmap.rows;
	charsizes[i][2] = _next_p2 (bmpglyph->bitmap.width);
	charsizes[i][3] = _next_p2 (bmpglyph->bitmap.rows);
	charsizes[i][4] = face->glyph->advance.x >> 6;
	charsizes[i][5] = bmpglyph->left;
	charsizes[i][6] = bmpglyph->top;

	if (charsizes[i][6] > maxtop) maxtop = charsizes[i][6];
	if ( (charsizes[i][6] - charsizes[i][1]) < maxbottom)
		maxbottom = charsizes[i][6] - charsizes[i][1];

	expanded_data = (GLubyte*) malloc (sizeof (GLubyte)
	                                   * charsizes[i][2] * charsizes[i][3] * 2);

	for (b = 0;b < charsizes[i][3];++b)
		for (a = 0;a < charsizes[i][2];++a)
			expanded_data[2* (b*charsizes[i][2] + a) ] =
			    expanded_data[2* (b*charsizes[i][2] + a) + 1] =
			        (a >= charsizes[i][0] ||
			         b >= charsizes[i][1]) ?
			        0 : (bmpglyph->bitmap.buffer[b*charsizes[i][0] + a]);

	glBindTexture (GL_TEXTURE_2D, texnames[i]);
	glTexParameteri (GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri (GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri (GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
	glTexParameteri (GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
	glTexImage2D (GL_TEXTURE_2D, 0, GL_RGBA,
	              charsizes[i][2], charsizes[i][3], 0,
	              GL_LUMINANCE_ALPHA, GL_UNSIGNED_BYTE, expanded_data);
	free (expanded_data);
}

bool exaGLFont::loadfromfreetype (const char* file, int resolution)
{
	if (isLoaded) unload();
	int i;
	FT_Library ftlib;
	if (FT_Init_FreeType (&ftlib) ) return false;
	FT_Face face;
	int charsizes[128][7];
	int maxtop = 0, maxbottom = 16777216;
	if (FT_New_Face (ftlib, file, 0, &face) ) {
		FT_Done_FreeType (ftlib);
		return false;
	}
	FT_Set_Char_Size (face, resolution << 6, resolution << 6, 72, 72);
	texture = 0;
	ntexnames = 128;
	texnames = (GLuint*) malloc (sizeof (GLuint) * ntexnames);
	charnum = ntexnames;
	charlen = (float*) malloc (sizeof (float) * charnum);
	list = glGenLists (charnum);
	glGenTextures (ntexnames, texnames);
	float x, y;

	for (i = 0;i < 128;++i)
		_makeglyph (i, charsizes, texnames, maxtop, maxbottom, face);

	float scale = 1.0f / (maxtop - maxbottom);

	for (i = 0;i < 128;++i) {
		glNewList (list + i, GL_COMPILE);
		glBindTexture (GL_TEXTURE_2D, texnames[i]);
		glTranslatef (charsizes[i][5]*scale, 0, 0);
		glPushMatrix();

		glTranslatef (0, scale* (charsizes[i][6] - (charsizes[i][1] + maxbottom) ), 0);

		x = charsizes[i][0] / (float) charsizes[i][2];
		y = charsizes[i][1] / (float) charsizes[i][3];
		glBegin (GL_QUADS);

		glTexCoord2f (0, 0);
		glVertex2f (0, charsizes[i][1]*scale);
		glTexCoord2f (0, y);
		glVertex2f (0, 0);
		glTexCoord2f (x, y);
		glVertex2f (charsizes[i][0]*scale, 0);
		glTexCoord2f (x, 0);
		glVertex2f (charsizes[i][0]*scale,
		            charsizes[i][1]*scale);

		glEnd();
		glPopMatrix();
		glTranslatef (charsizes[i][4]*scale, 0, 0);
		glEndList();
		charlen[i] = (charsizes[i][4] + charsizes[i][5]) * scale;
	}


	FT_Done_Face (face);
	FT_Done_FreeType (ftlib);
	texture = 0;
	isLoaded = true;
	return isLoaded;
}

void exaGLFont::write (const char* text)
{
	if (*text == 0) return;
	glPushAttrib (GL_LIST_BIT | GL_TEXTURE_BIT);
	glEnable (GL_TEXTURE_2D);
	if (texture) glBindTexture (GL_TEXTURE_2D, texture);
	glListBase (list);
	glCallLists (strlen (text), GL_UNSIGNED_BYTE, text);
	glPopAttrib();
}

void exaGLFont::write (const wchar_t *text)
{
	if (*text == 0) return;
	glPushAttrib (GL_LIST_BIT | GL_TEXTURE_BIT);
	glEnable (GL_TEXTURE_2D);
	if (texture) glBindTexture (GL_TEXTURE_2D, texture);
	glListBase (list);
	glCallLists (wcslen (text), GL_UNSIGNED_SHORT, text);
	glPopAttrib();
}


float exaGLFont::getcharlen (unsigned short ch)
{
	if (!isLoaded) return 0;
	if (ch > charnum) return 0;
	return charlen[ch];
}


float exaGLFont::getstrlen (const char *str, unsigned long int maxlen)
{
	if (!isLoaded) return 0;
	float t;
	unsigned long int i;
	for (t = 0, i = 0; (*str != 0) && (i < maxlen);str++, i++) if ( (unsigned char) *str < charnum) t += charlen[*str];
	return t;
}

float exaGLFont::getwstrlen (const wchar_t *str, unsigned long int maxlen)
{
	if (!isLoaded) return 0;
	float t;
	unsigned long int i;
	for (t = 0, i = 0; (*str != 0) && (i < maxlen);str++, i++) if ( (unsigned) (*str) < charnum) t += charlen[*str];
	return t;
}


void exaGLFont::writecolored (const char *str)
{
	if (!isLoaded) return;
	if (*str == 0) return;
	glPushAttrib (GL_LIST_BIT | GL_TEXTURE_BIT);
	glEnable (GL_TEXTURE_2D);
	if (texture) glBindTexture (GL_TEXTURE_2D, texture);
	float t[4];
	glGetFloatv (GL_CURRENT_COLOR, t);
	char *c = (char*) str;  //unconst
	while (*c != 0) {
		if (*c == '#') {
			if ( (* (c + 1) >= '0') && (* (c + 1) <= '8') ) {
				if ( (* (c + 2) >= '0') && (* (c + 2) <= '8') ) {
					if ( (* (c + 3) >= '0') && (* (c + 3) <= '8') ) {
						/*glColor3ub((*(c+1)=='8')?255:(*(c+1)-'0')*32,
							(*(c+2)=='8')?255:(*(c+2)-'0')*32,
							(*(c+3)=='8')?255:(*(c+3)-'0')*32);*/
						glColor4f ( (* (c + 1) - '0') / 8.0f,
						            (* (c + 2) - '0') / 8.0f,
						            (* (c + 3) - '0') / 8.0f,
						            t[3]);   //store older alpha value!!!!
						c += 4;
					} else {
						glCallList (list + '#');
						c++;
					}
				} else {
					glCallList (list + '#');
					c++;
				}
			} else {
				glCallList (list + '#');
				c++;
				if (*c == '#') c++;
			} //## makes #
		} else {
			glCallList (list + (*c) );
			c++;
		}
	}
	glPopAttrib();
}

float exaGLFont::getcoloredstrlen (const char *str, unsigned long int maxlen)
{
	if (!isLoaded) return 0;
	char*c = (char*) str;
	float t = 0;
	while ( (*c != 0) && ( (unsigned long int) (c - str) < maxlen) ) {
		if (*c == '#') {
			if ( (* (c + 1) >= '0') && (* (c + 1) <= '8') ) {
				if ( (* (c + 2) >= '0') && (* (c + 2) <= '8') ) {
					if ( (* (c + 3) >= '0') && (* (c + 3) <= '8') ) {
						c += 4;
					} else {
						t += charlen['#'];
						c++;
					}
				} else {
					t += charlen['#'];
					c++;
				}
			} else {
				t += charlen['#'];
				c++;
				if (*c == '#') c++;
			}
		} else {
			t += charlen[*c];
			c++;
		}
	}

	return t;
}

bool exaGLFont::loadfromfiles (const char *rawgreybitmap, const char *rawdescriptor, unsigned int nglyphs,
                               unsigned int bsizex, unsigned int bsizey)
{
	exaGlyphParams * gb;
	char * b;
	FILE * f;

	b = (char*) malloc (bsizex * bsizey * 2);
	gb = (exaGlyphParams*) malloc (nglyphs * sizeof (exaGlyphParams) );

	f = fopen (rawdescriptor, "rb");
	if (!f) {
		free (b);
		free (gb);
		return false;
	}
	fread (gb, sizeof (exaGlyphParams), nglyphs, f);
	fclose (f);

	f = fopen (rawgreybitmap, "rb");
	if (!f) {
		free (b);
		free (gb);
		return false;
	}
	fread (b, bsizex, bsizey, f);
	fclose (f);

	int i;
	for (i = (bsizex * bsizey) - 1;i >= 0;i--) b[i*2] = b[ (i*2) +1] = b[i];
	//add alpha...that's kinda cool for work with fonts;)

	load (b, GL_LUMINANCE_ALPHA, GL_UNSIGNED_BYTE, 2, bsizex, bsizey, nglyphs, gb);
	free (b);
	free (gb);
	return true;
}


