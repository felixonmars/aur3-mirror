# Maintainer: Jesus Alvarez <jeezusjr@gmail.com>
# Contributor: sxe <sxxe@gmx.de>
# Based on the wine package in the community repository

pkgname=wine-silverlight-git
pkgver=20121119
pkgrel=1
_pkgbasever=1.5
_gitroot="git://source.winehq.org/git/wine.git"
_gitname="wine"
pkgdesc="A compatibility layer for running Windows programs. Latest GIT version with the Silverlight fixes."
url="http://www.winehq.com"
arch=(i686 x86_64)
license='LGPL'
install='wine-silverlight-git.install'
source=("silverlight.patch")
md5sums=('600b9d49277b10df5894e5c71727d3b6')

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
  samba
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
  samba
)

if [[ $CARCH == i686 ]]; then
  # Strip lib32 etc. on i686
  depends=(${depends[@]/*32-*/})
  makedepends=(${makedepends[@]/*32-*/})
  makedepends=(${makedepends[@]/*-multilib*/})
  optdepends=(${optdepends[@]/*32-*/})
  provides=('wine=_pkgbasever' )
  conflicts=('wine')
else
  provides=('bin32-wine=_pkgbasever' 'wine-wow64=_pkgbasever' 'wine=_pkgbasever' )
  conflicts=('bin32-wine' 'wine-wow64' 'wine')
fi

build() {
  cd "$srcdir"

  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  mkdir $pkgname-32-build

  # These additional CFLAGS solve FS#27662
  export CFLAGS="${CFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"
  export CXXFLAGS="${CFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"

  msg "Connecting to GIT server...."

  if [ ! -d ${srcdir}/$pkgname ] ; then
    git clone $_gitroot $pkgname
  fi

  cd "$srcdir"/"$pkgname"

  # Apply patches to specific commit
  git reset --hard 78b08cdabdc1ef6123d7d21b8d7b84809fb2b8f0
  patch -Np1 < ../silverlight.patch

  cd "$srcdir"

  if [[ $CARCH == x86_64 ]]; then

    msg2 "Building Wine-64..."
    mkdir $pkgname-64-build
    cd "$srcdir/$pkgname-64-build"
    ../$pkgname/configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --libdir=/usr/lib \
      --with-x \
      --enable-win64
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
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-x \
    "${_wine32opts[@]}"

  # These additional CFLAGS solve FS#27560
  make CFLAGS+="-mstackrealign" CXXFLAGS+="-mstackrealign"
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$pkgname-32-build"

  if [[ $CARCH == i686 ]]; then
    make prefix="$pkgdir/usr" install
  else
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib32" \
      dlldir="$pkgdir/usr/lib32/wine" install

    msg2 "Packaging Wine-64..."
    cd "$srcdir/$pkgname-64-build"
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib" \
      dlldir="$pkgdir/usr/lib/wine" install
  fi
}
# vim:set ts=2 sw=2 et:
