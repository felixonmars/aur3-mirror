# Maintainer: Chuck Atkins <chuckatkins at gmail dot com>
# Contributors: Andrew Antle <andrew dot antle at gmail dot com>

pkgname=gst-editor-0.10
pkgver=0.10.2
pkgrel=2
pkgdesc="A graphical pileline eeditor for the GStreamer multimedia framework"
arch=(i686 x86_64)
license=(LGPL)
url="http://code.google.com/p/gst-editor/"
groups=('multimedia')
makedepends=('intltool' 'cvs')
depends=('gstreamer0.10>=0.10' 'goocanvas' )
source=(http://gst-editor.googlecode.com/files/gst-editor-${pkgver}.tar.gz)
md5sums=('50928f2d99b18e4afc8818f08ae2ab4b')
sha1sums=('5d59cda55e43ec7327a955a0b0af90c00dcdbd2e')
sha256sums=('268a474e39d478d67cda50ed84ddef7fd95bba094faa999ec4ec89104e21205f')
sha384sums=('8b16a6e08342a3d16f845bb9376587740c86fdc808dcb8a92902c92fb273f59638d3e753d6e055124ab86237e1523db6')
sha512sums=('4c55d91a07970437a99ee441d7c9471a66c26c040f601c31059b66320a8319634c19d0d45ca9bb5d52b21002cbe92291433cd256becdd614f056c92163331153')

build() {
  cd ${srcdir}
  ./autogen.sh --noconfigure
  ./configure --prefix=/usr
  make
  make DESTDIR="${pkgdir}" install 
}

