# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jeff Bailes <thepizzaking@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=python2-sexy
pkgver=0.1.9
pkgrel=1
pkgdesc="Python bindings for libsexy"
arch=(i686 x86_64)
url=http://chipx86.com/wiki/Libsexy
license=('LGPL')
depends=(libsexy pygtk)
options=(!libtool)
source=(http://releases.chipx86.com/libsexy/sexy-python/sexy-python-$pkgver.tar.gz)
sha256sums=('2d8d257bbfa498a89792e0405ed8cf70396648b3df3c8e32cdc3dcc9bb666f15')
sha512sums=('e735f06efce302e10b89cfd3d6c641d523cd29517792ccaa4d022d7be6f6a350fff180f1c94d255ccbc82891cac7346520dfed2a88d828fbd7e891aa56396530')

build() {
    cd sexy-python-$pkgver/
    ./configure --prefix=/usr
    make
}

package() {
    make -C sexy-python-$pkgver DESTDIR="$pkgdir" install
}
