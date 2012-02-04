# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=termkit-pygtk
pkgver=1
pkgrel=1
pkgdesc="A PyGTK client for TermKit"
arch=('any')
url="https://github.com/lucassmagal/TermKitLinux/"
license=('custom')
depends=('termkit-git' 'pywebkitgtk')
source=('termkit-pygtk')
md5sums=('d2070d0500b9f781fe791965c00365ae')


build() {
 mkdir -p $pkgdir/usr/bin
 printf "#!/bin/sh
python2 /usr/lib/TermKit/termkit-pygtk" >> $pkgdir/usr/bin/pg-termkit
 chmod +x $pkgdir/usr/bin/pg-termkit
}

package() {
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  mkdir -p $pkgdir/usr/lib/TermKit
  install -m755 $srcdir/termkit-pygtk $pkgdir/usr/lib/TermKit
  cp /usr/share/licenses/TermKit/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
