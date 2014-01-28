# Maintainer: Tony Sokhon <tonyskn@gmail.com>
# Contributor: Ebubekir KARUL <ebubekirkarul@yandex.com>
# Contributor: Gaurish Sharma <contact@gaurishsharma.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Katrina L. Halliwell <rambaldi.kat.47@gmail.com>

pkgname=lighttable-git
pkgver=20140127
pkgrel=1
pkgdesc="New interactive IDE that lets you modify running programs and embed anything from websites to games."
url="http://www.lighttable.com/"
license=('GPLv3')
conflicts=('lighttable')
depends=(nss libx11 libxrandr libpng gconf)
makedepends=(leiningen git)
options=(!strip)
arch=('i686' 'x86_64')

source=(lighttable lighttable.desktop lighttable.png git://github.com/LightTable/LightTable)
md5sums=('e772b3547fdc3a6e32f81e7303422fd1'
         '04a62702b59810a36bca7623bf9e932c'
         'f8c055be2f047ff4aaffdd028f62f027'
         'SKIP')

build() {
  cd LightTable
  bash ./linux_deps.sh
}

package() {
  install -D -m755 lighttable "$pkgdir/usr/bin/lighttable"

  _destdir="$pkgdir/opt/LightTable"

  install -dm755 $_destdir
  mv LightTable/deploy/* $_destdir
  
  mkdir -p "${pkgdir}"/usr/share/{applications,pixmaps}
  install -m644 "${startdir}"/lighttable.desktop "${pkgdir}/usr/share/applications/"
  install -m644 "${startdir}"/lighttable.png "${pkgdir}"/usr/share/pixmaps/lighttable.png

  #for more info, https://github.com/Kodowa/Light-Table-Playground/issues/161
  ln -s /usr/lib/libudev.so "$_destdir/libudev.so.0"
}
