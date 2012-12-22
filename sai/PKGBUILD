# Maintainer: taylorchu <tailinchu [at] gmail [dot] com>

pkgname=sai
pkgver=20121222
pkgrel=1
pkgdesc='simple arch installer'
arch=('any')
url='https://github.com/taylorchu/sai'
license=('GPL2')
depends=('syslinux' 'gptfdisk' 'parted' 'util-linux')
makedepends=('git')
_gitroot="https://github.com/taylorchu/sai"
_gitname="sai"
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
