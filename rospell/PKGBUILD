# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Oin <mapleoin@nerdshack.com>

pkgname=rospell
pkgver=2009.00rc2
pkgrel=1
pkgdesc="A UTF-8 text editor for programmers and general use"
arch=('i686' 'x86_64')
url="http://rospell.sourceforge.net/"
license=('GPL2')
depends=('qt3' 'wget' 'ctags')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-${pkgver/r/-r}.tar.gz)
md5sums=('309bb5a333bd4f63b0070fd7fb0921a0')

build() {
  cd $srcdir/$pkgname-${pkgver/r/-r}
  # we need Qt3
  . /etc/profile.d/qt3.sh || return 1
  export PATH="$QTDIR/bin:$PATH"
  # configure, make and install
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install-strip || return 1
}
