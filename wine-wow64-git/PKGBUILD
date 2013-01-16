# $Id$
# Maintainer: Federico Cinelli <cinelli.federico@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_gitname=wine
pkgver=20120216
pkgrel=1

pkgname=$_gitname-wow64-git

_gitroot=git://source.winehq.org/git/wine.git

pkgdesc="A compatibility layer for running Windows programs (both 32-bit and 64-bit; from git)"
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
  gettext         lib32-gettext
  desktop-file-utils
)

makedepends=(git autoconf ncurses bison perl fontforge flex prelink
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
  lcms            lib32-lcms
  mpg123          lib32-mpg123
  openal          lib32-openal
  v4l-utils       lib32-v4l-utils
  alsa-lib        lib32-alsa-lib
  oss
)
  
optdepends=(
  giflib          lib32-giflib
  libpng          lib32-libpng
  libldap         lib32-libldap
  gnutls          lib32-gnutls
  lcms            lib32-lcms
  libxml2         lib32-libxml2
  mpg123          lib32-mpg123
  openal          lib32-openal
  v4l-utils       lib32-v4l-utils
  libpulse        lib32-libpulse
  alsa-plugins    lib32-alsa-plugins
  alsa-lib        lib32-alsa-lib
  oss             cups
)

if [[ $CARCH == i686 ]]; then
  # Strip lib32 etc. on i686
  depends=(${depends[@]/*32-*/})
  makedepends=(${makedepends[@]/*32-*/})
  makedepends=(${makedepends[@]/*-multilib*/})
  optdepends=(${optdepends[@]/*32-*/})
  provides=(wine)
  conflicts=(wine)
else
  provides=(wine bin32-wine wine-wow64)
  conflicts=(wine bin32-wine wine-wow64)
fi

build() {
  msg2 "Connecting to Git server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local file are updated"
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_gitname-{32,64}-build
  mkdir $_gitname-32-build

  # These additional CFLAGS solve FS#27662
  export CFLAGS="${CFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"
  export CXXFLAGS="${CFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"

  if [[ $CARCH == x86_64 ]]; then
    msg2 "Building Wine-64..."

    mkdir $_gitname-64-build
    cd "$srcdir/$_gitname-64-build"
    ../$_gitname/configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --libdir=/usr/lib \
      --with-x \
      --enable-win64

    make

    _wine32opts=(
      --libdir=/usr/lib32
      --with-wine64="$srcdir/$_gitname-64-build"
    )

    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  fi

  msg2 "Building Wine-32..."
  cd "$srcdir/$_gitname-32-build"
  ../$_gitname/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-x \
    "${_wine32opts[@]}"

  # These additional CFLAGS solve FS#27560
  make CFLAGS+="-mstackrealign" CXXFLAGS+="-mstackrealign"
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$_gitname-32-build"

  if [[ $CARCH == i686 ]]; then
    make prefix="$pkgdir/usr" install
  else
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib32" \
      dlldir="$pkgdir/usr/lib32/wine" install

    msg2 "Packaging Wine-64..."
    cd "$srcdir/$_gitname-64-build"
    make prefix="$pkgdir/usr" libdir="$pkgdir/usr/lib" dlldir="$pkgdir/usr/lib/wine" install
  fi
}

# vim:set ts=8 sts=2 sw=2 et:
