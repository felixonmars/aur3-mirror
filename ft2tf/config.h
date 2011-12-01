#define DPI		196
#define WIDTHDIFF	0
#define HEIGHTDIFF	0

/* glyphs are chosen from these fonts */
static struct font {
	char *path;
	int size;
} fonts[] = {
	{"/path/to/monof55.ttf", 12},
	{"/path/to/DejaVuSansMono.ttf", 10},
};

/* unicode glyph intervals to include */
static int chars[][2] = {
	{0x0001, 0x03ff},
	{0x0600, 0x06ff},
	{0x1d00, 0x2bff},
	{0x2c60, 0x2c7f},
	{0xfb00, 0xfdff},
	{0xfe20, 0xfe2f},
	{0xfe70, 0xfeff},
};
