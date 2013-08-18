# Developer: Esclapion (Patrice, Administrator Manjaro France, http://www.manjaro.fr)
# Maintainer: Vinzenz Vietzke <vinz at vinzv dot de>
# 
pkgname=instbrowser
pkgver=1.0
pkgrel=1
pkgdesc="A little GUI in Python Gtk which serves to choose the browsers to install/remove "
arch=('any')
url="http://forum.manjaro.org/index.php?topic=6240.0"
license=('unknown')
groups=('network')
depends=('python' 'pygtk')
optdepends=('gksu: to run instbrowser directly from menu')
source=($pkgname-$pkgver.tar.gz)
md5sums=('93f37f2165a7b2c9ff6b7b04e9fc8ffc')

package() {
  cd $srcdir
  install -Dm 0644 $srcdir/$pkgname-$pkgver/$pkgname.py $pkgdir/usr/bin/$pkgname.py
  install -Dm 0644 $srcdir/$pkgname-$pkgver/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  chmod +x $pkgdir/usr/bin/$pkgname.py
}
