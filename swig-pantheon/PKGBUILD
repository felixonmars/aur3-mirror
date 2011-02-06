# Contributor: Team Pantheon <maintainer@team-pantheon.de>

pkgname=swig-pantheon
pkgver=1.3.31
pkgrel=3
pkgdesc="Connects C/C++ programs with scripting languages; patched by Pantheon"
url="http://www.swig.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('ruby')
conflicts=('swig')
provides=('swig')
source=('http://prdownloads.sourceforge.net/swig/swig-1.3.31.tar.gz')
md5sums=('4a0bae63e3713e89b26db7209b6a7e05')

build() {

  cd $srcdir/swig-$pkgver
  patch -Np1 -i ../../swig-1.3.31-ruby-rastullah-1.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  mkdir -p $pkgdir/usr/share/licenses/swig
  install -m 644 $srcdir/swig-$pkgver/LICENSE $pkgdir/usr/share/licenses/swig/LICENSE
  
}
# vim:syntax=sh
