# Maintainer: danyf90 <daniele.formichelli@gmail.com>

_themename=perspective
_Themename=Perspective
pkgname=xcursor-$_themename
pkgver=1.0
pkgrel=2
pkgdesc="Plasma Next theme X.org server cursors"
arch=('any')
url="http://packages.debian.org/unstable/x11/oxygencursors"
license=('GPL')
source=("http://kde-look.org/CONTENT/content-files/164507-$_Themename.tar.gz")
sha512sums=('b7c86c64083f6dc31151045b86d7701e85a954164dab7413bc62ecd3e9fd487b144ea2236976df2613b64ec706e73beab8ca513bbab5ec3a177b2cc0379047b4')

package() {
  cd $srcdir/$_Themename

  install -d $pkgdir/usr/share/icons/$_Themename
  cp -r cursors $pkgdir/usr/share/icons/$_Themename/

}