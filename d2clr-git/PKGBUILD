pkgname=d2clr-git
pkgver=0.1
pkgrel=1
pkgdesc="Auto click button 'Accept' in Dota 2 game"
url="https://github.com/FTCr/D2Clicker"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('glibc' 'dbus' 'wmctrl')
source=("git://github.com/FTCr/D2Clicker.git")
md5sums=('SKIP')
build(){
  cd "${srcdir}/D2Clicker"
  make install PREFIX="${pkgdir}/usr"
}
