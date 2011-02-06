# Contributor: Stefan Husmann <stefan-husmann.t-online.de>

pkgname=pgcedit
pkgver=8.7beta12
pkgrel=5
pkgdesc="The Swiss Army knife of DVD editing"
url="http://download.videohelp.com/r0lZ/pgcedit/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('tcl>=8.4' 'tk>=8.4' 'wine')
makedepends=('imagemagick')
optdepends=('pgcedit-plugins: For more features')
source=("http://download.videohelp.com/r0lZ/${pkgname}/PgcEdit_source_${pkgver}.zip" \
        'pgcedit.sh' 'pgcedit.desktop' 'PgcEdit.xpm')
md5sums=('236ca736b1dae32335520ee303e14735' '94ec158ea37d7db691623332a856bb43'\
         '11a95dc1180757b9e919613068945b3e' '31d1476f1b14189f7f7fd84363b70f87')
sha1sums=('7fab407f9e4ff127bbcf9e3fa29c0fa1bb484ef9' \
          '022e0731f9c8004b35bbdc7bd4e85cae8741198e' \
          'e6d3b6709e004574248acd3b3e769dc9dcaa1e2b' \
          '51668d47455498c0a6b03f111750a4e4f65c67c3')

build() {
  cd ${srcdir}

  # Create Directories
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/${pkgname}/lib
  install -d ${pkgdir}/usr/share/$pkgname/icons

  # Install Application
  install -D -m755 PgcEdit.tcl ${pkgdir}/usr/share/${pkgname}/PgcEdit.tcl
  install -D -m755 PgcEdit_main.tcl ${pkgdir}/usr/share/${pkgname}/PgcEdit_main.tcl
  install -D -m644 bin/binversion.tcl ${pkgdir}/usr/share/${pkgname}/bin/binversion.tcl
  install -D -m755 ${srcdir}/bin/PgcEditPreview.exe ${pkgdir}/usr/share/${pkgname}/bin/PgcEditPreview.exe
  cp -R lib/* ${pkgdir}/usr/share/${pkgname}/lib
  install -D -m755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}/${pkgname}.sh

  # Install Icons and .desktop
  install -D -m644 ${srcdir}/PgcEdit.xpm ${pkgdir}/usr/share/${pkgname}/icons/PgcEdit.xpm
  install -D -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  # Install License
  install -D -m644 COPYING.txt ${pkgdir}/usr/share/${pkgname}/COPYING.txt
}
