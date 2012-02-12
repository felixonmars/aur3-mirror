# $Id$
# Maintainer: Ivo Nunes <netherblood@gmail.com>

pkgname=wine-laa
pkgbasename=wine
pkgver=1.4rc3
pkgrel=1

_pkgbasever=${pkgver/rc/-rc}

source=(http://ibiblio.org/pub/linux/system/emulators/$pkgbasename/$pkgbasename-$_pkgbasever.tar.bz2
        wine-laa.patch)
md5sums=('cbbf30fe43de9676abbb8ea88b1b5cde'
         '96373ba70e61cb6cbc88e0a4af0e25ba')

pkgdesc="A compatibility layer for running Windows programs. This version of Wine includes a patch to improve gaming performance."
url="http://www.winehq.com"
arch=(i686 x86_64)
license=(LGPL)

depends=(
  fontconfig      lib32-fontconfig
  mesa            lib32-mesa 
  libxcursor      lib32-libxcursor
  libxrandr       lib32-libxrandr
  libxdamage      lib32-libxdamage
  libxi           lib32-libxi
  gettext         lib32-gettext
  desktop-file-utils
)

makedepends=(autoconf ncurses bison perl fontforge flex prelink
  'gcc>=4.5.0-2'  'gcc-multilib>=4.5.0-2'
  giflib          lib32-giflib
  libxpm          lib32-libxpm
  libpng          lib32-libpng
  libxinerama     lib32-libxinerama
  libxcomposite   lib32-libxcomposite
  libxmu          lib32-libxmu
  libxxf86vm      lib32-libxxf86vm
  libxml2         lib32-libxml2
  libxslt         lib32-libxslt
  libldap         lib32-libldap
  lcms            lib32-lcms
  mpg123          lib32-mpg123
  openal          lib32-openal
  libcups         lib32-libcups
  v4l-utils       lib32-v4l-utils
  alsa-lib        lib32-alsa-lib
  oss
)
  
optdepends=(
  giflib          lib32-giflib
  libpng          lib32-libpng
  libldap         lib32-libldap
  lcms            lib32-lcms
  libxml2         lib32-libxml2
  mpg123          lib32-mpg123
  openal          lib32-openal
  libcups         lib32-libcups
  v4l-utils       lib32-v4l-utils
  libpulse        lib32-libpulse
  alsa-plugins    lib32-alsa-plugins
  alsa-lib        lib32-alsa-lib
  oss
)

if [[ $CARCH == i686 ]]; then
  # Strip lib32 etc. on i686
  depends=(${depends[@]/*32-*/})
  makedepends=(${makedepends[@]/*32-*/})
  makedepends=(${makedepends[@]/*-multilib*/})
  optdepends=(${optdepends[@]/*32-*/})
else
  provides=("bin32-wine=$pkgver" "wine-wow64=$pkgver")
  conflicts=('bin32-wine' 'wine-wow64')
  replaces=('bin32-wine')
fi

build() {
  cd "$srcdir"

  # Allow ccache to work
  mv $pkgbasename-$_pkgbasever $pkgbasename

  msg2 "Patching..."
  (
    cd $pkgbasename
    patch -p1 < ../../wine-laa.patch
  )

  # Get rid of old build dirs
  rm -rf $pkgbasename-{32,64}-build
  mkdir $pkgbasename-32-build

  # These additional CFLAGS solve FS#27662
  export CFLAGS="${CFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"
  export CXXFLAGS="${CFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"

  if [[ $CARCH == x86_64 ]]; then
    msg2 "Building Wine-64..."

    mkdir $pkgbasename-64-build
    cd "$srcdir/$pkgbasename-64-build"
    ../$pkgbasename/configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --libdir=/usr/lib \
      --with-x \
      --enable-win64

    make

    _wine32opts=(
      --libdir=/usr/lib32
      --with-wine64="$srcdir/$pkgbasename-64-build"
    )

    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  fi

  msg2 "Building Wine-32..."
  cd "$srcdir/$pkgbasename-32-build"
  ../$pkgbasename/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-x \
    "${_wine32opts[@]}"

  # These additional CFLAGS solve FS#27560
  make CFLAGS+="-mstackrealign" CXXFLAGS+="-mstackrealign"
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$pkgbasename-32-build"

  if [[ $CARCH == i686 ]]; then
    make prefix="$pkgdir/usr" install
  else
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib32" \
      dlldir="$pkgdir/usr/lib32/wine" install

    msg2 "Packaging Wine-64..."
    cd "$srcdir/$pkgbasename-64-build"
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib" \
      dlldir="$pkgdir/usr/lib/wine" install
  fi
}

# vim:set ts=8 sts=2 sw=2 et:
