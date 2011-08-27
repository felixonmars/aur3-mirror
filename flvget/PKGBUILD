# Contributor: Jesus Lazaro Plaza <jesuslazaro84@gmail.com>

pkgname=flvget
pkgver=1.6.1
pkgrel=1
pkgdesc="Kommander script for downloading  a flash format video from a website and convert to manifold formats"
url="http://www.kde-apps.org/content/show.php/FLVGET?content=33973"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdebase' 'kdewebdev' 'ffmpeg')
source=(http://www.kde-apps.org/CONTENT/content-files/33973-${pkgname}-${pkgver}.tar.bz2)
md5sums=('d0031d588526a20610c9223d1d139cf7')

options=(docs)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  
  install -D -m755 install_data/flvget ${startdir}/pkg/usr/bin/flvget
  install -D -m644 install_data/flvget.desktop ${startdir}/pkg/usr/share/applications/kde/flvget.desktop
  install -D -m644 install_data/flvget-convert.desktop ${startdir}/pkg/usr/share/apps/konqueror/servicemenus/flvget-convert.desktop
  mkdir -p ${startdir}/pkg/usr/share/doc/flvget/
  cp CHANGELOG README ${startdir}/pkg/usr/share/doc/flvget/
  mkdir -p ${startdir}/pkg/usr/share/flvget/
  cp -R flvget.kmdr plugins/ ${startdir}/pkg/usr/share/flvget/
  install -D -m644 install_data/hi128-apps-flvget.png ${startdir}/pkg/usr/share/pixmaps/flvget.png
  install -D install_data/flvget.1.gz  ${startdir}/pkg/usr/man/man1/flvget.1.gz
}
