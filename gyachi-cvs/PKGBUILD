# Maintainer: TDY <tdy@gmx.com>

pkgname=gyachi-cvs
pkgver=20090726
pkgrel=1
pkgdesc="An improved fork of the GyachE Yahoo! client"
arch=('i686' 'x86_64')
url="http://gyachi.sourceforge.net/"
license=('GPL')
depends=('jasper' 'libgtkhtml' 'libmcrypt' 'libnotify' 'libv4l' 'gpgme'
         'gtkspell' 'pulseaudio')
makedepends=('cvs' 'pkgconfig>=0.9.0')
provides=('gyachi')
conflicts=('gyachi')
options=('!libtool')

_cvsroot=:pserver:anonymous:@gyachi.cvs.sourceforge.net:/cvsroot/gyachi
_cvsmod=gyachi

build() {
  cd "$srcdir"

  if [[ -d $_cvsmod/CVS ]]; then
    cd $_cvsmod && cvs -z3 update -d && cd ..
  else
    cvs -z3 -d$_cvsroot co -D $pkgver -f $_cvsmod
  fi

  rm -rf $_cvsmod-build
  cp -r $_cvsmod $_cvsmod-build
  cd $_cvsmod-build

  ./autogen.sh || return 1
  ./configure --prefix=/usr --libexecdir=/usr/lib \
      --disable-rpath \
      --disable-wine \
      --disable-gtktest \
      --disable-glibtest \
      --with-x
  make || return 1
  make DESTDIR="$pkgdir" install
}
