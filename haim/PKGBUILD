# Contributor: Antonio Arias Orzanco <antonio.arias99999@gmail.com>

_origname=Haim
pkgname=haim
pkgver=0.2.0
pkgrel=2
pkgdesc="Haim is an ISO image automounter. Click on your iso image to mount and reclick to unmount."
arch=('i686' 'x86_64')
url="http://www.hyperray.net/hyperget/haim-holoox-auto-iso-mounter"
license=('GPL')
depends=('qt')
source=(http://hyperray.org/Products/$_origname/$_origname-$pkgver.tar.gz)
md5sums=('cfb54e590564735bf12d957fba779f5a')

build() {
  cd $srcdir/$_origname

  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
