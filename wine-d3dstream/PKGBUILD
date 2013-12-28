pkgname=wine-d3dstream
pkgver=1.7.4
pkgrel=1
_pkgname=wine
source=("http://prdownloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.bz2"
		"csmt-$_pkgname-$pkgver-0.2.patch"
		"steam.patch")
sha1sums=('f3ccfb7a6870311f2d85b1cbbcc1f87df409bb6a'
			'a1025f3c91753b6a64ba46e7f35bef8059bb729f'
			'0f17189eaa4ed35434fe0bb78917e39cbdb85f18')

pkgdesc="Wine with D3D command stream patches"
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
  freetype2       lib32-freetype2
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
)

optdepends=(
  giflib          lib32-giflib
  libpng          lib32-libpng
  libldap         lib32-libldap
  gnutls          lib32-gnutls
  lcms            lib32-lcms
  libxml2         lib32-libxml2
  mpg123          lib32-mpg123
openal            lib32-openal
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
  provides=("wine=$pkgver")
  conflicts=(wine)
else
  provides=("wine=$pkgver" "bin32-wine=$pkgver" "wine-wow64=$pkgver")
  conflicts=('wine' 'bin32-wine' 'wine-wow64')
  replaces=('wine' 'bin32-wine')
fi

prepare() {
  # Patching
  cd "$srcdir/$_pkgname-$pkgver"

  # up fps
  msg2 "Applying patch for fps improvements..."
  patch -p1 < "${srcdir}/csmt-$_pkgname-$pkgver-0.2.patch"
  msg2 "Applying Steam patch"
  patch -p1 < "${srcdir}/steam.patch"

}
build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./tools/make_requests
  cd "$srcdir"
  # Allow ccache to work
  mv $_pkgname-$pkgver $_pkgname
  # Get rid of old build dirs
  rm -rf $_pkgname-{32,64}-build
  mkdir $_pkgname-32-build
  # These additional CFLAGS solve FS#27662
  export CFLAGS="${CFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"
  export CXXFLAGS="${CFLAGS/-D_FORTIFY_SOURCE=2/} -D_FORTIFY_SOURCE=0"
  if [[ $CARCH == x86_64 ]]; then
        msg2 "Building Wine-64..."
        mkdir $_pkgname-64-build
        cd "$srcdir/$_pkgname-64-build"
        ../$_pkgname/configure \
          --prefix=/usr \
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
        --prefix=/usr \
        --sysconfdir=/etc \
        --with-x \
        "${_wine32opts[@]}"
  # These additional CFLAGS solve FS#27560
  make CFLAGS+="-mstackrealign" CXXFLAGS+="-mstackrealign"
}
package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$_pkgname-32-build"
  if [[ $CARCH == i686 ]]; then
        make prefix="$pkgdir/usr" install
  else
        make prefix="$pkgdir/usr" \
          libdir="$pkgdir/usr/lib32" \
          dlldir="$pkgdir/usr/lib32/wine" install
        msg2 "Packaging Wine-64..."
        cd "$srcdir/$_pkgname-64-build"
        make prefix="$pkgdir/usr" \
          libdir="$pkgdir/usr/lib" \
          dlldir="$pkgdir/usr/lib/wine" install
  fi
}
