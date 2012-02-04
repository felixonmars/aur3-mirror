# Maintainer: spbogie <spbogie@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine-pulse
_pkgbasename=wine
pkgver=1.3.24
pkgrel=2

_pkgbasever=${pkgver/rc/-rc}

source=(http://ibiblio.org/pub/linux/system/emulators/$_pkgbasename/$_pkgbasename-$_pkgbasever.tar.bz2
        http://art.ified.ca/downloads/winepulse/winepulse-0.40.patch
        http://art.ified.ca/downloads/winepulse/winepulse-configure.ac-1.3.22.patch
        http://art.ified.ca/downloads/winepulse/winepulse-winecfg-1.3.11.patch)
md5sums=('c9850862748bde7994bd757574e8974e'
         '613963175c1e60fd40dba7956396c500'
         'bc2d01c6f08e615d48482ac5dbff6e23'
         '2015ce195cc55273d3470a6cc95bec8c')

pkgdesc="A compatibility layer for running Windows programs (With PulseAudio support from http://art.ified.ca/?page_id=40)"
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
  libxxf86dga     lib32-libxxf86dga
  alsa-lib        lib32-alsa-lib
  desktop-file-utils
  pulseaudio      lib32-pulseaudio
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
  jack            lib32-jack
  libcups         lib32-libcups
  gnutls          lib32-gnutls
  v4l-utils       lib32-v4l-utils
)
  
optdepends=(
  giflib          lib32-giflib
  libpng          lib32-libpng
  libldap         lib32-libldap
  lcms            lib32-lcms
  libxml2         lib32-libxml2
  mpg123          lib32-mpg123
  openal          lib32-openal
  jack            lib32-jack
  libcups         lib32-libcups
  gnutls          lib32-gnutls
  v4l-utils       lib32-v4l-utils
)

if [[ $CARCH == i686 ]]; then
  # Strip lib32 etc. on i686
  depends=(${depends[@]/*32-*/})
  makedepends=(${makedepends[@]/*32-*/})
  makedepends=(${makedepends[@]/*-multilib*/})
  optdepends=(${optdepends[@]/*32-*/})
  provides=("wine=$pkgver")
  conflicts=('wine')
else
  provides=("wine=$pkgver" "bin32-wine=$pkgver" "wine-wow64=$pkgver")
  conflicts=('wine' 'bin32-wine' 'wine-wow64')
  replaces=('bin32-wine')
fi

build() {
  cd "$srcdir"

  # Allow ccache to work
  mv $_pkgbasename-$_pkgbasever $_pkgbasename

  msg2 "Patching..."
  (
    cd $_pkgbasename
    patch -Np1 < $srcdir/winepulse-0.40.patch
    patch -Np1 < $srcdir/winepulse-configure.ac-1.3.22.patch
    patch -Np1 < $srcdir/winepulse-winecfg-1.3.11.patch
    autoreconf
  )

  # Get rid of old build dirs
  rm -rf $_pkgbasename-{32,64}-build
  mkdir $_pkgbasename-32-build

  if [[ $CARCH == x86_64 ]]; then
    msg2 "Building Wine-64..."

    mkdir $_pkgbasename-64-build
    cd "$srcdir/$_pkgbasename-64-build"
    ../$_pkgbasename/configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --libdir=/usr/lib \
      --with-x \
      --enable-win64

    make

    _wine32opts=(
      --libdir=/usr/lib32
      --with-wine64="$srcdir/$_pkgbasename-64-build"
    )

    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  fi

  msg2 "Building Wine-32..."
  cd "$srcdir/$_pkgbasename-32-build"
  ../$_pkgbasename/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-x \
    "${_wine32opts[@]}"

  make
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$_pkgbasename-32-build"

  if [[ $CARCH == i686 ]]; then
    make prefix="$pkgdir/usr" install
  else
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib32" \
      dlldir="$pkgdir/usr/lib32/wine" install

    msg2 "Packaging Wine-64..."
    cd "$srcdir/$_pkgbasename-64-build"
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib" \
      dlldir="$pkgdir/usr/lib/wine" install
  fi
}

# vim:set ts=8 sts=2 sw=2 et:
