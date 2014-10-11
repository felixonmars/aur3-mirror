# Maintainer: Antonio Rojas < nqn1976 @ gmail.com >

pkgname=texmaths
pkgver=0.41
pkgrel=1
pkgdesc="A LaTeX equation editor for LibreOffice"
arch=('any')
url="http://roland65.free.fr/texmaths/"
license=('GPL2')
depends=('libreoffice-draw' 'texlive-core')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgver/TexMaths-$pkgver.oxt")
md5sums=('7d00b8443d61348a14511bf82f28ff25')

package() {
  install -d -m755 $pkgdir/usr/lib/libreoffice/share/extensions/$pkgname

  cp -r * $pkgdir/usr/lib/libreoffice/share/extensions/$pkgname
  rm $pkgdir/usr/lib/libreoffice/share/extensions/$pkgname/*.oxt
}
