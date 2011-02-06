# Bambus
# Maintainer: ying <Jinoto Systems>
# Contributor: ying <Jinoto Systems>
pkgname=bambus  
pkgver=2.4
pkgrel=1
pkgdesc="A small and simple GTK Gui to change Wallpapers using feh, Esetroot, hsetroot, habak or any other command tool."
url="http://malisch-ts.de"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtkmm' 'eterm') # 'eterm' can be changed in any command tool to draw the wallpaper.
optdepends=('eterm' 'habak' 'feh' 'hsetroot' 'others')
source=("https://downloads.sourceforge.net/project/simplebambus/bambus-${pkgver}-source.tar.gz?r=&ts=1289210369&use_mirror=master")
md5sums=('c8001d9f837f04f4f8712729c2aa1849')

build() {
  make all
}
package() {
  install -Dm755 bambus $pkgdir/usr/bin/bambus || return 
}


