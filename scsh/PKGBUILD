# Contributor: juergen <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Chris Brannon <cmbrannon79 (@) gmail.com>
# maintainer: perlawk

pkgname=scsh
pkgver=0.6.7
pkgrel=4
pkgdesc="Scsh is an open-source Unix shell embedded within Scheme,is designed for writing real-life standalone Unix programs and shell scripts."
arch=('i686' 'x86_64')
depends=('glibc' 'bash')
conflicts=('scheme48')
install=$pkgname.install
source=("http://ftp.scsh.net/pub/scsh/0.6/scsh-0.6.7.tar.gz" "scsh.patch")
url="http://www.scsh.net/"
license=('BSD')

build() {
  cd "$srcdir"
  patch -p0 -i scsh.patch
  cd "$srcdir/$pkgname-$pkgver"
  CFLAGS=-m32 ./configure --prefix=/usr --mandir=/usr/share/man
  make -j4
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
  install -d -m755 "$pkgdir/usr/share/doc/"
  mv "$pkgdir/usr/lib/scsh/doc" "$pkgdir/usr/share/doc/scsh"
    install -D -m644 COPYING "$pkgdir/usr/share/licenses/scsh/COPYING"
}
md5sums=('69c88ca86a8aaaf0f87d253b99d339b5'
         '7e875f3c52ce8cd8665f1d0009bdd2e4')
