# Author: Mikhail Shevyakov & Vasiliy Astanin & Max Brazhnikov 	makc@issp.ac.ru
# Maintainer: Konstantin  A. Kovalenko <k (dot) a (dot) kovalenko [at] gmail (dot) com>
pkgname=qtiplot-ru
pkgver=0.9.8.9
pkgrel=1
epoch=
pkgdesc="Russian translations for Qtiplot"
arch=('any')
url="http://soft.proindependent.com/translations.html"
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://soft.proindependent.com/translations/qtiplot_ru.qm)
noextract=()
md5sums=('64c3b0a3a3c8e3075b5f7bc388e1bcbc')
build() {
#   cd "$srcdir/$pkgname-$pkgver" 
  install -d -m755 "$pkgdir/usr/share/qtiplot/translations"
  install -m644 $srcdir/qtiplot_ru.qm $pkgdir/usr/share/qtiplot/translations
}