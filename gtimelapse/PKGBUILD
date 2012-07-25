# Contributor: Zuf <kontakt.zuf(at)gmail.com> https://github.com/zuf/aur-packages

pkgname=gtimelapse
pkgver=0.1
pkgrel=1
pkgdesc="An application for capturing images to generate timelapse videos, built on gPhoto2 and wxWidgets libraries."
url="http://sourceforge.net/projects/macrofusion/"
depends=('libgphoto2' 'wxgtk')
makedepends=()
conflicts=('gtimelapse')
arch=('i686' 'x86_64')
replaces=('gtimelapse')
backup=()
source=("http://downloads.sourceforge.net/project/${pkgname}/Relase/${pkgname}-${pkgver}.tar.gz")         
license=('GPL')
md5sums=('e24c6aaa2ab36e025727bae1c2be4ca6')

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr
  make
}

package(){
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}


