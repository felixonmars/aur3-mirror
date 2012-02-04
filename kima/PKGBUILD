# Contributor: Georg Grabler <ggrabler@gmail.com>
# Maintainer: AddictedToChaos <damageplan85@gmail.com>
pkgname=kima
pkgver=0.7.4
pkgrel=3
pkgdesc="This applet monitors various sources such as temperature, frequency and fan speed values in your kicker panel."
url="http://kima.sourceforge.net/"
license=('GPL')
depends=('qt3' 'kdelibs3' 'hal')
makedepends=('pkgconfig')
arch=('i686' 'x86_64')
source=(http://prdownloads.sourceforge.net/kima/$pkgname-$pkgver.tar.gz)
md5sums=(ed93c3a6871b514726fcdc6fbf49bba4)

build() {
cd "$srcdir/$pkgname-$pkgver"

./configure --prefix=/usr --prefix=$(kde-config --prefix) 
make || return 1
make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et: 
