# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=c_download
pkgver=0.1
pkgrel=1
pkgdesc="Library to download files single or multithreaded"
url="http://shadowice.org/?p=c_download"
arch=('i686' 'x86_64')
license=(GPL3)
depends=('curl')
conflicts=('c_download-git')
source=(ftp://shadowice.org/projects/cgetvid/c_download-$pkgver.tar.xz)
md5sums=('e702c80cd84b9aa3fbd1d59812eeb942')

build() {

cd ${srcdir}/c_download-$pkgver

cmake . -DCMAKE_INSTALL_PREFIX=/usr/ || return 1
make || return 1
make DESTDIR=${pkgdir} install || return 1

}
