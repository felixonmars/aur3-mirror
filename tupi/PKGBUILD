#Maintainer
#Email
pkgname=tupi
pkgver=master
pkgrel=3.2
pkgdesc="A 2D animation tool for 8-100 years old kids."
url="http://www.maefloresta.com/"
license=("GPL3")
arch=('any')
depends=("qt4" "ffmpeg" "aspell" "zlib" "qtmobility")
makedepends=("ruby" "quazip")
source=("$pkgname"::'git://github.com/xtingray/tupi.git')
md5sums=('SKIP')

build() {
  cd "${srcdir}/tupi"
  export QT_SELECT=4 && ./configure --prefix=/usr/local/tupi
  make
}
  
package() {
  cd "${srcdir}/tupi"
  make DESTDIR=${pkgdir} install
}