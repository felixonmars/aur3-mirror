# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=scopy
pkgver=1.1.2
pkgrel=1
pkgdesc="The italian card game scopa"
arch=('any')
url="http://marcoscarpetta.github.io/scopy/"
license=('GPL3')
groups=()
depends=('python2-gobject' 'clutter-gtk')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="scopy.install"
source=(https://github.com/marcoscarpetta/$pkgname/archive/v$pkgver.tar.gz)
noextract=()
md5sums=('4af09346fd6647c99888fba2115d3c4e')

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  { 
   echo "#!/bin/bash"
   echo "cd /usr/share/scopy/src"
   echo "env python2 scopy.py"
  } > "$pkgdir/usr/bin/scopy" 
}
