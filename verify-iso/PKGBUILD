# Maintainer: TDY <tdy@archlinux.info>

pkgname=verify-iso
pkgver=0.1
pkgrel=1
pkgdesc="A simple python script for verifying the contents of a burned CD"
arch=('i686' 'x86_64')
url="http://offog.org/code/misccode.html"
license=('MIT')
depends=('python2')
source=(http://offog.org/darcs/misccode/$pkgname
        http://offog.org/darcs/misccode/progress.py
        http://offog.org/darcs/misccode/NOTES)
md5sums=('fc30a8f9d9f2392a214c9a0b4c73ab18'
         '7c2a1267cf71c9f58d599eb1f711434e'
         'f1a4f370d7a9bfb025a38065631141fb')

package() {
  cd "$srcdir"
  sed '1,16 d' <NOTES >LICENSE
  install -Dm755 $pkgname "$pkgdir/usr/share/$pkgname/$pkgname"
  install -Dm644 progress.py "$pkgdir/usr/share/$pkgname/progress.py"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/bin"
  ln -sf /usr/share/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  sed -i '1s/python/&2/' "$pkgdir/usr/share/$pkgname/$pkgname"
}

# vim:set ts=2 sw=2 et:
