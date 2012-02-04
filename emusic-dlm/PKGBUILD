# Contributor: Gaelan D'costa <gdcosta at gmail dot com>
# Contributor: Christopher Daley <crdaley at gmail.com>

pkgname=emusic-dlm
pkgver=4.1.4
pkgrel=2
pkgdesc="Standalone download utility for eMusic based on Mozilla's XULRunner."
url="https://www.emusic.com/dlm/download.html"
conflicts=('bin32-emusicdlm')
provides=()
if [ $CARCH == "x86_64" ]; then
  depends=('lib32-gtk2' 'lib32-libxt')
else
  depends=('gtk2' 'libxt')
fi
arch=('i686' 'x86_64')
license=('Included')
install=emusic-dlm.install
source=('emusic-dlm.desktop' \
"http://www.emusic.com/apps/dlm/emusic_linux_current.tar.gz")
md5sums=('4c0557ab6e912fec38b97c4e35e94092'
         'f5808e0550183b3e17755b0e0e710a0d')

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
