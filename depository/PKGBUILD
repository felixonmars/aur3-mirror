# Contributor & Author: Jakub Vitak <mainiak at gmail dot com>
# vim:set ts=2 sw=2 et:
pkgname=depository
pkgver=0.3
pkgrel=1
pkgdesc="very simple backup tool"
arch=('i686' 'x86_64')
url="http://code.koudynet.eu/p/depository"
license=('BSD')
groups=()
depends=('ruby')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
_base_url='http://code.koudynet.eu/p/depository/source/file/master'
source=("$_base_url/README" "$_base_url/depository.yaml" "$_base_url/sbt.rb" "$_base_url/depository.sh")
noextract=()

build() {
  mkdir -p $pkgdir/usr/{bin,share/$pkgname}
  cp $srcdir/README $pkgdir/usr/share/$pkgname/
  cp $srcdir/depository.yaml $pkgdir/usr/share/$pkgname/
  install -m755 $srcdir/sbt.rb $pkgdir/usr/bin/
  install -m755 $srcdir/depository.sh $pkgdir/usr/bin/
}

md5sums=('432280cffb52fb76f872e64599d5c762'
         '96bec429d755aec9dcef195839921c89'
         '1d2179186eec2bb97e467dd1fe3f25af'
         '9d78a1bf663252beb8f02bdc9ca26f2d')
