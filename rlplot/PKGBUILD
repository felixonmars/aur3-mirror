# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: <oslik@mail.ru>

pkgname=rlplot
pkgver=1.5
pkgrel=2
pkgdesc="A scientific plotting program to produce high quality graphs from data"
arch=('i686' 'x86_64')
url="http://rlplot.sourceforge.net/"
license=('GPL')
depends=('qt')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}_${pkgver}.tar.gz"
        "${pkgname}.patch"
        "${pkgname}.desktop")
md5sums=('9e92a4a463ae7373ac737b76e08d8ab7'
         'cae029d91caddf1238d86dd1621dc9c1'
         '9eb6a822737ba8f671523b892004bc16')

build() {
  cd "${srcdir}/${pkgname}"

  # Extract icons
  bsdtar -xf RLPlot-Icons.zip

  patch -Np1 -i ../${pkgname}.patch
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install binaries
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 rlplot exprlp "${pkgdir}/usr/bin"

  # Install a desktop entry
  install -Dm644 RLPlot-Icons/rlplot-icon_128x128.png \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install a man page
  install -Dm644 ${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
