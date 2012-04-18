# Maintainer: Joachim Fasting <joachim.fasting@gmail.com>
pkgname=pudb
pkgver=2012.1
pkgrel=1
pkgdesc="A full-screen, console-based Python debugger"
url="http://pypi.python.org/pypi/pudb"
arch=('any')
changelog=ChangeLog
license=('custom: MIT')
depends=('python2' 'python2-urwid' 'python2-pygments')
source=("http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz" "LICENSE")
md5sums=('0e139a4b8d87976c2c19ca82939cad34'
         'caa5ae5fc3a066c03f6099adf09b14a1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"
  install -D -m644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ft=sh ts=2 sw=2 et :
