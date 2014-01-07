# Contributor: Rasmus <rasmus at gmx us>

pkgname=flesh
pkgver=2.0
pkgrel=6
pkgdesc="application designed to quickly analyze a document and display
         the difficulty associated with comprehending it"
arch=('i686' 'x86_64')
url="http://flesh.sourceforge.net/"
depends=('java-runtime')
license=('GPL')
source=(http://downloads.sourceforge.net/flesh/Flesh-Linux.zip
	flesh.sh)
md5sums=('cc85bf525ce4652625ba041f81040dfb'
         'f6df6b6ac9722b140de2db555bcd44e5')

package() {
  install -Dm755 flesh.sh $pkgdir/usr/bin/flesh
  install -Dm644 $srcdir/Flesh.jar $pkgdir/usr/share/java/flesh.jar
}
