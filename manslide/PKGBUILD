# Contributor: Jesus Lazaro Plaza <jesuslazaro84@gmail.com>

pkgname=manslide
pkgver=2.0.3
pkgrel=3
pkgdesc="Create your own slideshow"
url="http://www.kde-apps.org/content/show.php/Manslide?content=72739"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt>=4.3' 'libgl' 'smilutils-cvs' 'netpbm' 'mjpegtools' 'sox' 'imagemagick' 'vorbis-tools' 'mplayer')
install=manslide.install
source=(http://www.mandrivalinux-online.eu/${pkgname}/${pkgname}-${pkgver}.tar.gz manslide.desktop)
md5sums=('a8483c6ab80b030b07e73c7035a2ce2e' 'a1ba973a5d1a6a764623f1bfe59cd0d8')

build() {
  cd ${startdir}/src
  cd ${pkgname}-${pkgver}
  /usr/bin/qmake
  make clean
  make || return 1

  mkdir -p ${startdir}/pkg/opt/manslide
  cp -R BIB_ManSlide Interface Manslide manslide_??.qm ${startdir}/pkg/opt/manslide
  mkdir -p ${startdir}/pkg/usr/bin
  ln -sf /opt/manslide/Manslide ${startdir}/pkg/usr/bin/manslide

  # Creating menu item
  install -D -m644 Interface/tux.png ${startdir}/pkg/usr/share/pixmaps/manslide.png
  install -D -m644 ${startdir}/src/manslide.desktop ${startdir}/pkg/usr/share/applications/manslide.desktop
}
