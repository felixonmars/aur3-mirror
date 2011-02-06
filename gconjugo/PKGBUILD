
# Maintainer: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=gconjugo
pkgver=0.8.0
pkgrel=1
pkgdesc="Learn to conjugate in many languages.."
arch=('i686' 'x86_64')
url="http://www.gconjugo.org"
license=('GPL3')
depends=('gtk2')
madepends=('make' 'libtool' 'hicolor-icon-theme')
source=(http://launchpad.net/${pkgname}/trunk/0.8/+download/${pkgname}-${pkgver}.tar.gz)
md5sums=('4e5a0d0ff804cc00f650a94536ab3f0f')
install=(gconjugo.install)

build() {
cd ${srcdir}/$pkgname-$pkgver
./configure --prefix=/usr
rm libtool
ln -s /usr/bin/libtool libtool
make || return 1
make DESTDIR=${pkgdir} install
}
