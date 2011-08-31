# Maintainer: ianux <ianux@free.fr>

pkgname=fortune-classe-americaine
pkgver=20110606
pkgrel=1
pkgdesc="Fortune cookies: La Classe americaine quotes"
arch=('i686' 'x86_64')
url="http://ianux.fr/abitbol"
license=('unknown')
depends=('fortune-mod')
source=(classe-americaine)
md5sums=('6079e17e302a87dc8c0fc827a37299c8')
sha1sums=('014123f2b792c04d71113f6accf48a1c4a91e50f')

build() {
  cd ${srcdir}
  strfile classe-americaine classe-americaine.dat
}

package() {
  install -d ${pkgdir}/usr/share/fortune
  install -m644 ${srcdir}/classe-americaine* ${pkgdir}/usr/share/fortune
}
