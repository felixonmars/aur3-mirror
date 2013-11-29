# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=scopy-git
pkgver=1.0.r16.g4ce348b
pkgrel=1
pkgdesc="The italian card game scopa"
arch=('any')
url="http://scopy.sourceforge.net/"
license=('GPL3')
groups=()
depends=('python2-gobject' 'clutter-gtk')
makedepends=('git')
provides=('scopy')
conflicts=('scopy')
install="scopy.install"
source=("$pkgname"::'git://github.com/marcoscarpetta/scopy.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/$pkgname
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  { 
   echo "#!/bin/bash"
   echo "cd /usr/share/scopy/src"
   echo "env python2 scopy.py"
  } > "$pkgdir/usr/bin/scopy" 
}
