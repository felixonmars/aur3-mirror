# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: lang2 <wenzhi.liang_at_gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=vixn
pkgver=0.9.2
pkgrel=1
pkgdesc="vi implemented in python"
depends=('pygtk' 'pygtksourceview2' 'python2-xdg' 'hicolor-icon-theme')
optdepends=('python2-dbus')
arch=('any')
license=('GPL')
url="http://www.vixn.org"
source=(http://download.tuxfamily.org/$pkgname/$pkgname-$pkgver.tar.bz2
	'vixn-python2.patch')
md5sums=('e5198ee46e4283ff77143ef899439fad'
         '2b804bb9c7524d2ea6c5ac6fe73e9598')
install=vixn.install

package() {
  install -d $pkgdir/usr/doc
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < "$srcdir/vixn-python2.patch"
  (cd docs/html && rm menus.txt && ln -s ../../config/menus menus.txt)
  ./install.sh $pkgdir/usr
  sed -i s+Exec=/usr/local/bin/vixn+Exec=vixn+ org.vixn.service 
  install -Dm644 org.vixn.service $pkgdir/usr/share/dbus-1/services
  cd $pkgdir/usr/bin
  ln -s ../lib/vixn/vixn.py $pkgname
  ln -s ../lib/vixn/vixgrep .
  rmdir $pkgdir/usr/doc
}
