# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: eric <eric@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=lexter
pkgver=1.0.3
pkgrel=3
pkgdesc="A Tetris-like word puzzle game for text terminals"
arch=('i686' 'x86_64')
url="http://www.kyne.com.au/~mark/software/lexter.php"
license=('GPL')
depends=('ncurses')
install="${pkgname}.install"
source=("http://www.kyne.com.au/~mark/software/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('ee8c63711ded7166759218948f5fdcf0'
         'e21c30fc61f1cf53b074656146c77634'
         '9050926b0af0705e429a6244ead5ad1e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --localstatedir=/var/lib/${pkgname}
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  make DESTDIR="${pkgdir}" install
  install -m775 -g games -d "${pkgdir}/var/lib/${pkgname}"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS NEWS README "${pkgdir}/usr/share/doc/${pkgname}"
}
