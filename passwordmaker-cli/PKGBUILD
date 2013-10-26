# Contributor: danielpublic <daniel at belagg dot nu>
# Contributor: Moritz Heidkamp <moritz.heidkamp@bevuta.com>
# Maintainer: Eduardo Büll <eduardo.bull@gmail.com> 
pkgname=passwordmaker-cli
pkgver=1.5
pkgrel=2
pkgdesc="A CLI edition of passwordmaker.org"
arch=('arm' 'i686' 'x86_64')
url="http://passwordmaker.org/Command-line"
license=('LGPL')
depends=(mhash)
source=(http://downloads.sourceforge.net/passwordmaker/$pkgname-$pkgver.tar.bz2)
md5sums=('36c4399e1fa38fdffc58756b62d42143')

build() {
make -C ${srcdir}/${pkgname}-${pkgver} -f unix.mak
}

package() {
install -D ${srcdir}/${pkgname}-${pkgver}/passwordmaker ${pkgdir}/usr/bin/passwordmaker
}