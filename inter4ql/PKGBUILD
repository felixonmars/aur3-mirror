# Maintainer: perlawk

pkgname=inter4ql
pkgver=2.5
_pkgname="Inter4QL"
pkgrel=2
pkgdesc="4QL is a rule-based database query language with negation allowed in premisses and conclusions of rules."
url="http://www.4ql.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
source=("http://4ql.org/inter4ql/v2/$pkgname$pkgver.zip")

build() {
  src=$srcdir/"$_pkgname $pkgver"
  cd "$src"/src; make
  cd plugins; make
}

package() {
  src=$srcdir/"$_pkgname $pkgver"
  cd "$src"/src
  mkdir -p $pkgdir/usr/bin
  cp inter4ql plugins/lt plugins/contains $pkgdir/usr/bin
}
md5sums=('e6f0edfa19477af7a74f4cedfc92c9c6')
