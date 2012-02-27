# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=tux_aqfh
pkgver=1.0.14
pkgrel=1
pkgdesc="'Tux the Penguin: A Quest for Herring' is a 3D search/explore game"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tuxaqfh/"
license=('GPL')
depends=('freeglut')
makedepends=('plib')
source=("http://downloads.sourceforge.net/tuxaqfh/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('b18cb70ac64d2e6f1d1612cc74a2d411'
         '5e1a469c60e71b7c2a31fcba4d18ef5e'
         '98b8fdb480005f873d20335c848173af')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Add a missing lib
  sed -i "s_-lplibul_-lplibul -lplibjs_" configure

  # Fix installation paths
  sed -i "s_datadir/games_datadir_" configure
  sed -i "s_(datadir)/@PACKAGE@_(datadir)/doc/@PACKAGE@/html_" doc/Makefile.in
  sed -i "s_(prefix)/games_(prefix)/bin_" src/Makefile.in
  sed -i "s_(datadir)/games_(datadir)_" \
    {data,fonts,images,models,mods,penguin,slamcode,wavs}/Makefile.in

  # Fix game speed
  sed -i "222iusleep(35000);" src/tux.cxx

  # Compile
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  make DESTDIR="${pkgdir}" install

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  install -m644 AUTHORS CHANGES README "${pkgdir}/usr/share/doc/${pkgname}"
}
