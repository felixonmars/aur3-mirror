# Credits: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: 
# Maintainer: Dominik Richter <dominik.richter@gmail.com>

pkgname=mac-robber
pkgver=1.02
pkgrel=2
epoch=
pkgdesc="Forensic tool that collects data from allocated files in a mounted file system. Useful together with sleuthkit."
arch=('i686' 'x86_64')
url="http://www.sleuthkit.org/mac-robber/index.php"
license=('GPL2')
optdepends=('sleuthkit: use mac-robber output with mactime')
provides=('mac-robber')
conflicts=('mac-robber')
replaces=('mac-robber')
options=()
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=() #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  #./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir/usr/bin
  install -Dm755 mac-robber $pkgdir/usr/bin/mac-robber 

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -Dm644 README $pkgdir/usr/share/licenses/$pkgname/README
}

# vim:set ts=2 sw=2 et:
md5sums=('6d6d99aa882a46b2bc5231d195fdb595')

