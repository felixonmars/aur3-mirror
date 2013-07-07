# Maintainer: Dmitry Zio (ziodm) <ziodmitry+aur at gmail botka com>
pkgname=align-it
pkgver=1.0.3
pkgrel=1
pkgdesc="a tool to align molecules according their pharmacophores"
arch=('i686', 'x86_64')
url="http://silicos-it.com/software/align-it/1.0.3/align-it.html"
license=('LGPL3')
groups=()
depends=('openbabel>=2.3.1', 'gcc-libs-multilib')
makedepends=('cmake')
optdepends=()
backup=()
options=()
install='align-it.install'
source=(http://silicos-it.com/_php/download.php?file=$pkgname-$pkgver.tar.gz)
md5sums=('5bee9df74814182efd2487152de2d042')


build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make
}


package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

