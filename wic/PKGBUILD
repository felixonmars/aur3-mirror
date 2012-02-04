# Maintainer: taylorchu <tailinchu [at] gmail [dot] com>

pkgname=wic
pkgver=20120129
pkgrel=1
pkgdesc='a wireless frontend for netcfg'
arch=('any')
url='https://github.com/taylorchu/wic'
license=('GPL2')
depends=('netcfg' 'dialog' 'wireless_tools')
makedepends=('git')
_gitroot="https://github.com/taylorchu/wic"
_gitname="wic"
build() {
   cd "$srcdir"
 msg "Connecting to GIT server...."
 if [ -d $_gitname ] ; then
   cd $_gitname && git pull origin
   msg "The local files are updated."
 else
   git clone --depth=1 $_gitroot $_gitname
   cd $_gitname
 fi
 msg "GIT checkout done or server timeout"
 make DESTDIR="$pkgdir" install
}
