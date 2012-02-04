# $Id$
# Maintainer:  Jan Krnavek <wamba@centrum.cz>
pkgname=csindex
pkgver=19980713
pkgrel=1
pkgdesc="Czech index for Tex and LaTeX"
url="http://ftp.linux.cz/pub/localization/csindex/"
license=""
depends=(tetex)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(ftp://ftp.linux.cz/pub/localization/csindex/$pkgname-$pkgver.tar.gz)
md5sums=('654a2ffd8896514c71f5f67a94b891eb')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  install -c -s -m 0755 csindex $startdir/pkg/usr/bin
}