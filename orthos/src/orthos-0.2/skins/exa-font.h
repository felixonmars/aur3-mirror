#ifndef _EXA_FONT_H_
#define _EXA_FONT_H_

#include <stdio.h>
#include <GL/gl.h>
#include <GL/glu.h>


typedef struct
{
	int x1, y1, x2, y2;   //UNSIGNED INT KILLS!!
}
exaGlyphParams;

class exaGLFont
{
	GLuint texture;
	GLuint *texnames;
	int ntexnames;
	GLuint list;
	unsigned int charnum;
	float* charlen;
	bool isLoaded;
public:
	float getcoloredstrlen (const char* str, unsigned long int maxlen = 0xFFFFFFFF);
	float getstrlen (const char* str, unsigned long int maxlen = 0xFFFFFFFF);
	float getwstrlen (const wchar_t *str, unsigned long int maxlen = 0xFFFFFFFF);
	float getcharlen (unsigned short ch);
	exaGLFont()
	{
		isLoaded = false;
		charnum = 0;
	}
	~exaGLFont()
	{
		if (isLoaded) unload();
	}
	void load (const void*textureData, GLenum textureFormat, GLenum textureDataType, int texelWidth,
	           unsigned int textureHeight, unsigned int textureWidth,
	           unsigned int numGlyphs, exaGlyphParams *glyphParams);
	void unload();
	void write (const char*text);
	void writecolored (const char* str);
	void write (const wchar_t *text);
	bool loadfromfiles (const char *rawgreybitmap, const char *rawdescriptor, unsigned int nglyphs,
	                    unsigned int bsizex, unsigned int bsizey);
	bool loadfromfreetype (const char* fontfile, int resolution = 32);
};

#endif
