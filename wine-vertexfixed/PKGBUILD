# Maintainer: Allen Choong <allencch at hotmail dot com>

pkgname=wine-vertexfixed
pkgver=1.2.3
pkgrel=2

source=(http://ibiblio.org/pub/linux/system/emulators/wine/wine-${pkgver}.tar.bz2 vertex_blend_sw-1.1.44.diff::http://bugs.winehq.org/attachment.cgi?id=28205)
md5sums=('a18ca677d1e01d1596d6692a8f3997e5'
         'cd5b4d626a11162504c5a76e7f7649d1')

pkgdesc="Wine patched with vertex blend"
url="http://www.winehq.com"
arch=(i686 x86_64)
license=(LGPL)
url="http://www.winehq.com"
arch=(i686 x86_64)
options=(staticlibs)
license=(LGPL)

_depends=(
  fontconfig      lib32-fontconfig
  libxcursor      lib32-libxcursor
  libxrandr       lib32-libxrandr
  libxdamage      lib32-libxdamage
  libxi           lib32-libxi
  gettext         lib32-gettext
  freetype2       lib32-freetype2
  glu             lib32-glu
  libsm           lib32-libsm
  gcc-libs        lib32-gcc-libs
  desktop-file-utils
)

makedepends=(autoconf ncurses bison perl fontforge flex prelink
  'gcc>=4.5.0-2'  'gcc-multilib>=4.5.0-2'
  giflib          lib32-giflib
  libpng          lib32-libpng
  gnutls          lib32-gnutls
  libxinerama     lib32-libxinerama
  libxcomposite   lib32-libxcomposite
  libxmu          lib32-libxmu
  libxxf86vm      lib32-libxxf86vm
  libxml2         lib32-libxml2
  libldap         lib32-libldap
  lcms2           lib32-lcms2
  mpg123          lib32-mpg123
  openal          lib32-openal
  v4l-utils       lib32-v4l-utils
  alsa-lib        lib32-alsa-lib
  libxcomposite   lib32-libxcomposite
  mesa            lib32-mesa
  mesa-libgl      lib32-mesa-libgl
  libcl           lib32-libcl
  samba
  opencl-headers
)
  
optdepends=(
  giflib          lib32-giflib
  libpng          lib32-libpng
  libldap         lib32-libldap
  gnutls          lib32-gnutls
  lcms2           lib32-lcms2
  libxml2         lib32-libxml2
  mpg123          lib32-mpg123
  openal          lib32-openal
  v4l-utils       lib32-v4l-utils
  libpulse        lib32-libpulse
  alsa-plugins    lib32-alsa-plugins
  alsa-lib        lib32-alsa-lib
  libjpeg-turbo   lib32-libjpeg-turbo
  libxcomposite   lib32-libxcomposite
  libxinerama     lib32-libxinerama
  ncurses         lib32-ncurses
  libcl           lib32-libcl
  cups
  samba           dosbox
)

if [[ $CARCH == i686 ]]; then
  # Strip lib32 etc. on i686
  _depends=(${_depends[@]/*32-*/})
  makedepends=(${makedepends[@]/*32-*/} ${_depends[@]})
  makedepends=(${makedepends[@]/*-multilib*/})
  optdepends=(${optdepends[@]/*32-*/})
else
  makedepends=(${makedepends[@]} ${_depends[@]})
  provides=("bin32-wine=$pkgver" "wine-wow64=$pkgver")
  conflicts=('bin32-wine' 'wine-wow64')
  replaces=('bin32-wine')
fi

build() {
  cd "${srcdir}/wine-${pkgver}"
  mkdir -p freetype2
  ln -s /usr/include/freetype2 freetype2/freetype
  patch -p1 < ../vertex_blend_sw-1.1.44.diff
  
  cd "$srcdir"

  # Allow ccache to work
  mv wine-${pkgver} $pkgname

  # ncurses fix
  sed -i 's|libncurses|libncursesw|g' "$srcdir/$pkgname/configure"
  sed -i 's|lncurses|lncursesw|g' "$srcdir/$pkgname/configure"
  
  sed -i -e 's|lookahead = YYLEX;|lookahead = yylex();|g' "$srcdir/$pkgname/tools/wrc/parser.y"
  sed -i -e '147i%lex-param { parser_ctx_t *ctx }' -e '147i%parse-param { parser_ctx_t *ctx }' -e 's|%pure_parser|%pure-parser|' -e 's|parser_error(const char \*str)|parser_error(parser_ctx_t *ctx, const char *str)|' -e 's|parser_error(const char\*);|parser_error(parser_ctx_t*,const char*);|' "$srcdir/$pkgname/dlls/jscript/parser.y"
  sed -i -e '113i%lex-param { COND_input *info }' -e '113i%parse-param { COND_input *info }' -e 's|cond_error(const char \*str)|cond_error( COND_input *info, const char *str )|g' -e '48d' -e '68istatic int cond_error( COND_input *info, const char *str);' "$srcdir/$pkgname/dlls/msi/cond.y"
  sed -i -e '40d' -e '59istatic int sql_error( SQL_input *info, const char *str);' -e 's|sql_error( const char \*str )|sql_error( SQL_input *info, const char *str )|' -e '80i%lex-param { SQL_input *info }' -e '80i%parse-param { SQL_input *info }' -e '44,55d' "$srcdir/$pkgname/dlls/msi/sql.y"
  sed -i -e "90itypedef struct\n{\nMSIDATABASE *db;\nLPCWSTR command;\nDWORD n,len;\nUINT r;\nMSIVIEW **view;\nstruct list *mem;\n} SQL_input;" "$srcdir/$pkgname/dlls/msi/query.h"
  

  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  mkdir $pkgname-32-build

  # These additional CPPFLAGS solve FS#27662 and FS#34195
  export CPPFLAGS="${CPPFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0 -I${srcdir}/${pkgname}/freetype2 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/harfbuzz"
  
  if [[ $CARCH == x86_64 ]]; then
    msg2 "Building Wine-64..."

    mkdir $pkgname-64-build
    cd "$srcdir/$pkgname-64-build"
    ../$pkgname/configure \
      --prefix=/opt \
      --libdir=/opt/lib \
      --with-x \
      --enable-win64
    # Gstreamer was disabled for FS#33655

    make

    _wine32opts=(
      --libdir=/usr/lib32
      --with-wine64="$srcdir/$pkgname-64-build"
    )

    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  fi

  msg2 "Building Wine-32..."
  cd "$srcdir/$pkgname-32-build"
  ../$pkgname/configure \
    --prefix=/opt \
    --with-x \
    "${_wine32opts[@]}"

  # These additional flags solve FS#23277
  make CFLAGS+="-mstackrealign -mincoming-stack-boundary=2" CXXFLAGS+="-mstackrealign -mincoming-stack-boundary=2" prefix="${pkgdir}/opt/wine-vertexfixed"
}

package() {
  depends=(${_depends[@]})

  msg2 "Packaging Wine-32..."
  cd "$srcdir/$pkgname-32-build"

  make prefix="$pkgdir/opt/wine-vertexfixed" install
}

