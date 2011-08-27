# $Id: PKGBUILD 7788 2008-08-04 09:46:47Z ronald $
# Maintainer: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=black-box
pkgver=1.4.8
pkgrel=1
pkgdesc="A game where you can shoot in and watch, where the shot leaves the box"
depends=('sdl_image' 'sdl_mixer')
source=(http://user.cs.tu-berlin.de/~karlb/$pkgname/$pkgname-$pkgver.tar.gz)
license=('GPL2')
arch=('i686' 'x86_64')
url="http://user.cs.tu-berlin.de/~karlb/news/"
md5sums=('f0cf19c54a3d2c34c221d67baf78add5')

build() {
        cd $startdir/src/$pkgname-$pkgver
        ./configure --prefix=/usr
        make || return 1
        make prefix=$startdir/pkg/usr install
}
