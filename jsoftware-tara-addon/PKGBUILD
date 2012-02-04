# Contributor: Lorenzo Tomei <tomeil@tiscali.it>

pkgname=jsoftware-tara-addon
pkgver=1.2.12
pkgrel=1
pkgdesc="xls file interface for J programming language"
arch=('any')
url="http://www.jsoftware.com"
license=('custom:jsoftware')
depends=('jsoftware')
source=(http://www.jsoftware.com/jal/j602/addons/tables_tara_${pkgver}_linux.tar.gz)
md5sums=('12a6e066055546d90216d1752a988d69')

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/lib/j/addons
  cp -a tables $startdir/pkg/usr/lib/j/addons/
}
