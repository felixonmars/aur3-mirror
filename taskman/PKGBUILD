# Maintainer: AureÌlien Martin <aurlienmartin@gmail.com>
pkgname=taskman
pkgver=0.1
pkgrel=1
pkgdesc="A simple task manager"
url="https://github.com/aurelien579/taskman"
arch=('any')
license=('GPL')
depends=('python2' 'gendesk' 'python2-pyqt5')
options=(!emptydirs)
source=("https://github.com/aurelien579/taskman/blob/master/distrib/$pkgname-$pkgver.tar.gz?raw=true")

package() {
  python2 $srcdir/setup.py install --root="$pkgdir/" --optimize=1
  gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" -f --exec="python2 /usr/lib/python2.7/site-packages/taskman.py"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"  
}

# vim:set ts=2 sw=2 et:

md5sums=('f3331d737529d9b4f7157da10b92ef98')
md5sums=('8b0ea86f0c94d9a7b8e4cb347885d09b')
