# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=cgetvid
pkgver=2.5.0
pkgrel=2
pkgdesc="cgetvid is an easily extensible video downloader"
url="https://shadowice.org/?p=cgetvid"
arch=('x86_64' 'i686')
license=(GPL3)
depends=('youtube-dl' 'rtmpdump' 'c_download')
makedepends=('cmake')
conflicts=('cgetvid-git')
source=(ftp://shadowice.org/projects/cgetvid/cgetvid-${pkgver}.tar.xz)
md5sums=('07f48e01af2e4cb208c0ae400745d7bc')

build() {

cd ${srcdir}/${pkgname}-${pkgver}
cmake . -DCMAKE_INSTALL_PREFIX=/usr/ || return 1
make || return 1
make DESTDIR=${pkgdir} install || return 1

}
