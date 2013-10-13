# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>
# Contributor: Alper KANAT <tunix@raptiye.org>

pkgname=rhino-with-interpreter
pkgver=1.7R4
pkgrel=1
pkgdesc="Open-source implementation of JavaScript written entirely in Java"
arch=('i686' 'x86_64')
url="http://www.mozilla.org/rhino/"
license=('MPL' 'GPL2')
source=("https://github.com/downloads/mozilla/rhino/rhino1_7R4.zip" "rhino")
md5sums=('ad67a3dff135e3a70f0c3528a2d6edf2'
         '1495c23052688ec1276d8d5e1ec86cae')
depends=("apache-ant" "java-runtime")
replaces="rhino"
provides="rhino"

build() {
  cd ${srcdir}/rhino1_7R4
  install -m755 -d ${pkgdir}/usr/share/java
  install -m644 js.jar ${pkgdir}/usr/share/java/
  install -m755 -d ${pkgdir}/usr/bin
  install -m755 ${startdir}/rhino ${pkgdir}/usr/bin/
}
