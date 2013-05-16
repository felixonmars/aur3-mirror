# Contributor: irgaly<irgaly@gmail.com>

pkgname=lha-autoconf-git
pkgver=20111126
pkgrel=2
_realname=lha
_realver=1.14i
pkgdesc='Autoconf version of lha compression and archive utility with utf-8 support'
arch=('i686' 'x86_64')
license=('custom')
provides=('lha=1.14i')
conflicts=('lha')
makedepends=('git')
url='http://lha.sourceforge.jp/'
source=('copyright'
        'configure.patch')

build() {
  git clone git://git.sourceforge.jp/gitroot/lha/lha.git || return 1
  cd lha

  patch < $srcdir/configure.patch || return 1

  autoreconf -is || return 1
  ./configure --enable-multibyte-filename=utf8 --prefix=/usr --mandir=/usr/share || return 1
  make || return 1
}

package() {
  cd lha
  make DESTDIR=$pkgdir install || return 1
  # install license
  install -Dm644 $srcdir/copyright $pkgdir/usr/share/licenses/$pkgname/copyright
}

md5sums=('a269181a01b7f3fe659f52033485db74'
         '7dc9193c7610021e944eb4d90fa90e80')
