# Contributor: Sergio Montesinos <sermonpe@yahoo.es>
pkgname=getcaledonia
pkgver=1.0
pkgrel=1
pkgdesc="Universal and beautiful installer for Caledonia art suite."
url="http://kde-apps.org/content/show.php/getCaledonia?content=148568"
arch=('i686' 'x86_64')
license="GPL"
depends=('kdebase-workspace')
makedepends=('qt')

source=(http://sourceforge.net/projects/getcaledonia/files/getCaledonia.tar.gz)
md5sums=(84909ebc32121c37e47c5426ad9a147b)

build() {
  cd "${srcdir}/getCaledonia"
  qmake PREFIX=/usr
  make
}
 
package() {
  cd "${srcdir}/getCaledonia"
  make INSTALL_ROOT="$pkgdir" install
}
 
