# Contributor: Niklas Schmuecker (IRC: nisc) <nschmuecker (gmail)>
pkgname=wordwarvi-cvs
pkgver=20081021
pkgrel=1
pkgdesc="Word War vi is your basic side-scrolling shoot 'em up '80s style arcade game"
arch=(i686 x86_64)
url="http://wordwarvi.sourceforge.net/"
license=('GPL')
provides=('wordwarvi')
conflicts=('wordwarvi')
depends=('gtk2' 'portaudio' 'jack-audio-connection-kit' 'libvorbis')
makedepends=('cvs')
source=(wordwarvi.desktop)
md5sums=('ab196fcac6ed542fd74b280e887bbf9b')
_cvsroot=":pserver:anonymous:@wordwarvi.cvs.sourceforge.net:/cvsroot/wordwarvi"
_cvsmod="wordwarvi"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  if [ -e "$srcdir"/$_cvsmod-build ]; then
    rm -rf "$srcdir"/$_cvsmod-build
  fi

  cp -r "$srcdir"/$_cvsmod "$srcdir"/$_cvsmod-build
  cd "$srcdir"/$_cvsmod-build

  make || return 1
  mkdir -p "$pkgdir/usr/share/applications"
  make PREFIX="$pkgdir/usr" install
  install -D -m644 $srcdir/wordwarvi.desktop $startdir/pkg/usr/share/applications/wordwarvi.desktop
}

