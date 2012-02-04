# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ijb
pkgver=20
pkgrel=1
pkgdesc="The Internet Junkbuster Proxy (TM) blocks unwanted banner ads and protects your privacy from cookies and other threats"
arch=('i686' 'x86_64')
url="http://www.junkbuster.com/"
license=('GPL')
depends=('glibc')
source=(http://www.sourcefiles.org/System/Daemons/Proxy/ijb20.zip junkbuster-2.0.2-fixups.patch)

md5sums=('4a384a649bf7bda12e5c3f8e0b809d08' '5079c8506664725532460b5c6d0e8865')

build() {
  cd $startdir/src/$pkgname$pkgver
  patch -p1 < ../junkbuster-2.0.2-fixups.patch || return 1
  make || return 1
  install -D -m755 junkbuster $startdir/pkg/usr/bin/junkbuster
  install -D -m644 junkbuster.1 $startdir/pkg/usr/man/man1/junkbuster.1
}
