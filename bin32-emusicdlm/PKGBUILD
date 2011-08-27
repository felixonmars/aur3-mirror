# Contributor: Gaelan D'costa <gdcosta at gmail dot com>
# Contributor: Christopher Daley <crdaley at gmail.com>

pkgname=bin32-emusicdlm
pkgver=4.1.3.1
pkgrel=1
pkgdesc="Standalone download utility for eMusic based on Mozilla's XULRunner."
url="https://www.emusic.com/dlm/download.html"
conflicts=('emusic-dlm')
provides=()
depends=('lib32-gtk2')
arch=('x86_64')
license=('Included')
install=emusic-dlm.install
source=('emusic-dlm.desktop' \
'http://www.emusic.com/apps/dlm/emusic_linux_current.tar.gz')
md5sums=('4c0557ab6e912fec38b97c4e35e94092'
         '9777207237d3899879866020be3d94e9')

build() {
  # Install Data
  mkdir $startdir/pkg/usr/
  mkdir $startdir/pkg/usr/share
  cp -Rd $startdir/src/builds/emusicdlm $startdir/pkg/usr/share/emusic
  # Install Icon
  install -D -m 644 $startdir/pkg/usr/share/emusic/xulrunner48.png \
    $startdir/pkg/usr/share/pixmaps/xulrunner48.png
  # Install Desktop File
  install -D -m 644 $startdir/emusic-dlm.desktop \
    $startdir/pkg/usr/share/applications/emusic-dlm.desktop
}
