# Contributor: Jesus Lazaro Plaza <jesuslazaro84@gmail.com>
pkgname=manencode
pkgver=1.0
pkgrel=3
pkgdesc="Transcode your videos"
arch=('i686' 'x86_64')
url="http://mantools.tuxfamily.org/node/6"
license=('GPL')
depends=('qt>=4' 'transcode' 'mplayer')
source=(ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/manencode-${pkgver}.tar.gz manencode.desktop)
md5sums=('28d0fa2ff8cb128abea1fc3b71a3623a' 'c37d0e910d1aaf1bb0523162c3d5db6b')

build() {
  cd ${startdir}/src/Manencode-${pkgver}
  /usr/bin/qmake
  make clean
  make || return 1
  
  mkdir -p ${startdir}/pkg/opt/manencode
  cp -R Manencode manencode_??.qm Interface ${startdir}/pkg/opt/manencode
  mkdir -p ${startdir}/pkg/usr/bin
  ln -sf /opt/manencode/Manencode ${startdir}/pkg/usr/bin/manencode

  # Creating menu item
  install -D -m644 Interface/executer.png ${startdir}/pkg/usr/share/pixmaps/manencode.png
  install -D -m644 ${startdir}/src/manencode.desktop ${startdir}/pkg/usr/share/applications/manencode.desktop
}
