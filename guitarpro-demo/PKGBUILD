# Maintainer: Olaf Leidinger <oleid@mescharet.de>
pkgname=guitarpro-demo
pkgver=6
pkgrel=11201
pkgdesc="Guitar synthesizer"
url="http://www.guitar-pro.com"
arch=('x86_64' 'i686')
license=('custom')
if test "$CARCH" == x86_64; then
  depends=('lib32-openssl098' 'lib32-libpulse' 'lib32-portaudio' 'lib32-libxml2' 'lib32-qt4')
elif test "$CARCH" == i686; then
  depends=('openssl098' 'pulseaudio' 'portaudio' 'libxml2' 'qt4')
fi
source=("http://download3.guitar-pro.com/203528fa1b45d8e923f9fc4841626ade/5270b2ee/gp${pkgver}/gp${pkgver}-full-linux-demo-r${pkgrel}.deb")
sha1sums=('a7ff185bbd904eb4067c36ed8c69edb6b49aa185')



package() {
  cd "${pkgdir}"
  tar -xf "${srcdir}/data.tar.gz"

  for fn in libz.so.1 libQtCore.so.4  libQtDBus.so.4  libQtGui.so.4  libQtNetwork.so.4  libQtOpenGL.so.4  libQtSvg.so.4  libQtWebKit.so.4  libQtXml.so.4  libQtXmlPatterns.so.4; do
    rm opt/GuitarPro6/$fn
  done
}

# vim:set ts=2 sw=2 et:
