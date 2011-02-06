# Contributor: Piotr Beling <qwak@w8.pl>

pkgname=gcjplugin
pkgver=4.3
pkgrel=1
pkgdesc="gcj (java) plugin for Netscape/Mozilla"
url="http://gcc.gnu.org"
license=("GPL")
depends=('gcc-gcj' 'mozilla-common')
source=()
md5sums=()
arch=('any')

build() {
    install -d $startdir/pkg/opt/mozilla/lib/plugins/
    ln -s /usr/lib/gcj-${pkgver}/libgcjwebplugin.so $startdir/pkg/opt/mozilla/lib/plugins/
}
