# Wallchange
# Maintainer: ying <Jinoto Systems>
# Contributor: ying <Jinoto Systems>
pkgname=wallchange
pkgver=1.2
pkgrel=1
pkgdesc="A small and simple command tool which is changing the wallpaper on a switch to the next virtual desktop."
url="https://sourceforge.net/projects/wallchange-slim/files/"
arch=('i686' 'x86_64')
install=wallchange.install
license=('GPL2')
depends=('eterm' 'archlinux-wallpaper') # 'eterm' can be changed in any command tool to draw the wallpaper.
optdepends=('eterm' 'habak' 'feh' 'hsetroot' 'others')
source=("https://downloads.sourceforge.net/project/wallchange-slim/wallchange-${pkgver}.tar.gz?r=&ts=1289391543&use_mirror=master" wallchange.conf)


build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make all
}
package() {
	install -Dm755 ${pkgname}-${pkgver}/wallchange $pkgdir/usr/bin/wallchange || return
	install -Dm755 wallchange.conf $pkgdir/usr/share/wallchange/wallchange.conf || return 
}




md5sums=('840425f1c724aea198b7cd378fba708d'
         'd4a9b5c9b341eee1651269139e1f91c9')
