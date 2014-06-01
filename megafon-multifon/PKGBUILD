pkgname=megafon-multifon
pkgver=1.27.503
pkgrel=1
pkgdesc="Megafon multifon"
url="http://multifon.ru/"
license=('custom')
makedepends=('rpmextract')
depends=('qt4' 'nas' 'libpng12')
arch=('i686')
source=(http://multifon.ru/media/download/files/MultiFon-1.27.503-Linux.rpm)
md5sums=('6f7a2d414d91cea96c2653036cba60be')

build() {
  rpmextract.sh *.rpm
}

package() {
  cp -R ${srcdir}/{etc,usr} ${pkgdir}/
  ln -s ${pkgdir}/usr/local/bin/multifon ${pkgdir}/usr/bin/multifon 
}