# Contributor: oldbay <old_bay@mail.ru>

pkgname=wine-opt
_pkgname=wine
pkgver=1.2.3
pkgrel=1

_pkgbasever=${pkgver/rc/-rc}

source=(http://ibiblio.org/pub/linux/system/emulators/$_pkgname/$_pkgname-$_pkgbasever.tar.bz2)
md5sums=('a18ca677d1e01d1596d6692a8f3997e5')

pkgdesc="A compatibility layer for running Windows programs"
url="http://www.winehq.com"
arch=(i686 x86_64)
license=(LGPL)
install=wine.install

depends=(
  fontconfig      lib32-fontconfig
  mesa            lib32-mesa 
  libxcursor      lib32-libxcursor
  libxrandr       lib32-libxrandr
  libxdamage      lib32-libxdamage
  libxi           lib32-libxi
  alsa-lib        lib32-alsa-lib
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
  gnutls          lib32-gnutls
  v4l-utils       lib32-v4l-utils
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
  gnutls          lib32-gnutls
  v4l-utils       lib32-v4l-utils
  libpulse        lib32-libpulse
  alsa-plugins    lib32-alsa-plugins
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
  mv $_pkgname-$_pkgbasever $_pkgname

  # Get rid of old build dirs
  rm -rf $_pkgname-{32,64}-build
  mkdir $_pkgname-32-build

  if [[ $CARCH == x86_64 ]]; then
    msg2 "Building Wine-64..."

    mkdir $_pkgname-64-build
    cd "$srcdir/$_pkgname-64-build"
    ../$_pkgname/configure \
      --prefix=/opt/wine-1.2.3/usr \
      --sysconfdir=/etc \
      --libdir=/usr/lib \
      --with-x \
      --enable-win64

    make

    _wine32opts=(
      --libdir=/usr/lib32
      --with-wine64="$srcdir/$_pkgname-64-build"
    )

    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  fi

  msg2 "Building Wine-32..."
  cd "$srcdir/$_pkgname-32-build"
  ../$_pkgname/configure \
    --prefix=/opt/wine-1.2.3/usr \
    --sysconfdir=/etc \
    --with-x \
    "${_wine32opts[@]}"

  make
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$_pkgname-32-build"

  if [[ $CARCH == i686 ]]; then
    make prefix="$pkgdir/opt/wine-1.2.3/usr" install
  else
    make prefix="$pkgdir/opt/wine-1.2.3/usr" \
      libdir="$pkgdir/opt/wine-1.2.3/usr/lib32" \
      dlldir="$pkgdir/opt/wine-1.2.3/usr/lib32/wine" install

    msg2 "Packaging Wine-64..."
    cd "$srcdir/$_pkgname-64-build"
    make prefix="$pkgdir/opt/wine-1.2.3/usr" \
      libdir="$pkgdir/opt/wine-1.2.3/usr/lib" \
      dlldir="$pkgdir/opt/wine-1.2.3/usr/lib/wine" install
  fi
}

# vim:set ts=8 sts=2 sw=2 et:
md5sums=('a18ca677d1e01d1596d6692a8f3997e5')
