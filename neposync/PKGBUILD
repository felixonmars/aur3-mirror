# Contributor: Eric Pignet <eric at erixpage dot com>

pkgname=neposync
pkgver=0.6
pkgrel=1
pkgdesc="A tool to synchronize files metadata with Nepomuk or Amarok"
arch=(i686 x86_64)
license=('GPL')
url="http://wiki.github.com/ericpignet/neposync"
depends=('libkexiv2' 'qt>=4.3' libmysqlclient taglib openssl)
makedepends=('git')
source=(https://github.com/downloads/ericpignet/neposync/${pkgname}-${pkgver}.tar.gz)
md5sums=('1ade316f14a4f38169db74e036072b65')

build() {
 cd "$srcdir/$pkgname"
 qmake && make || return 1
 install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname || return 1
}
