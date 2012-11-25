# Maintainer: Tetsumaki <http://goo.gl/YMBdA>

pkgname=abgx360gui
pkgver=1.0.2
pkgrel=2
pkgdesc="A GTK frontend for abgx360"
arch=('i686' 'x86_64')
license=('unknown')
url="http://abgx360.net/"
depends=('abgx360' 'wxgtk' 'xterm')
source=(http://dl.dropbox.com/u/59058148/${pkgname}-${pkgver}.tar.gz
        abgx360gui.desktop
        abgx360gui.png)
sha256sums=('949fdcb871d038b1c8aed658e3d3d0fe6c44c73fbea8defc46ce37b0abf91303
             89f54a9b9751248c82e252c4140c027d10b6b9752e1eb14c6d91e6d7524b12b5
             074bbc00f247042c6ad1c01a02a3f25178572732eae09309aa4078741b1c2aa3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -d ${pkgdir}/usr/share/{applications,pixmaps}
  install -m 644 ${startdir}/abgx360gui.desktop ${pkgdir}/usr/share/applications/
  install -m 644 ${startdir}/abgx360gui.png ${pkgdir}/usr/share/pixmaps/
}
