# Maintainer : speps <speps at aur dot archlinux dot org>

_name=cpulimit
pkgname=limitcpu
pkgver=1.7
pkgrel=1
pkgdesc="A simple program that attempts to limit the CPU usage of a process, expressed in percentage."
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net/"
license=("GPL")
depends=('glibc')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$_name-$pkgver.tar.gz")
md5sums=('7440198b930ac77bcb13b4e24c72e06f')

build() {
  cd "$srcdir/$_name-$pkgver"

  # rename to limitcpu to not conflict
  # with cpulimit in [community]

  mv $_name.c $pkgname.c
  sed -i "s|$_name|$pkgname|g" Makefile
  zcat $_name.1.gz | sed "s|$_name|$pkgname|g" | gzip -9 > $pkgname.1.gz

  make
}
package() {
  cd "$srcdir/$_name-$pkgver"

  make PREFIX="$pkgdir/usr" install
}
