# Maintainer: crusty ( ArchUnknown [at] gmail [dot] com )
pkgname=vu-meter-with-skins
pkgver=1.0.0
pkgrel=1
pkgdesc="VU meter plugin for Audacious"
realname=analog-vu-meter-plugin
arch=('i686' 'x86_64')
url="http://github.com/downloads/crusty/VU-Meter-Plugin/"
license=('GPL')
depends=('audacious')
source=(https://github.com/downloads/crusty/VU-Meter-Plugin/vu-meter-with-skins.tar.gz)
md5sums=('742678e1e07df77b79c5ea03a1779148')

build() {
  cd ${realname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  printf "\n\n\n\033[31;1m !!! \033[0m Now copy VU_Meter_skins/ to /usr/share/audacious/ (probably as root)\n\n\n"
}
