pkgname=xrdesktop
pkgver=1.1
pkgrel=1
pkgdesc="Xrdesktop is a GTK-Perl frontend for rdesktop that allows saving and editing of session configurations. Its aim is to support all the command-line options of rdesktop in an easy-to-use GUI."
url="http://xrdesktop.linux0wnsyou.com/"
license="GPL"
depends=('perl' 'gtk-perl')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://xrdesktop.linux0wnsyou.com/$pkgname-$pkgver.tar.gz)
md5sums=('5800f372ee803b5fa28b55518de05e5b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/usr/sbin/
  cp xrdesktop $startdir/pkg/usr/sbin/
}
