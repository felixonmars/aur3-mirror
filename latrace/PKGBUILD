# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: philomath <philomath868 AT gmail DOT com>
# Contributor: Sebastien Binet <binet@farnsworth>
pkgname=latrace
pkgver=0.5.11
pkgrel=2
pkgdesc="trace library calls and get their statistics in a manner similar to the strace utility (syscall tracing)"
arch=('i686' 'x86_64')
url="http://people.redhat.com/jolsa/latrace/index.shtml"
license=('GPL3')
depends=('glibc')
makedepends=('asciidoc')
source=(http://people.redhat.com/jolsa/latrace/dl/$pkgname-$pkgver.tar.bz2)
md5sums=('138457c7b9eaf3246eddb7856702cddf')

build() {
  cd $srcdir/$pkgname-$pkgver
  aclocal
  autoconf
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
