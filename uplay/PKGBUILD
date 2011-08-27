# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=uplay
pkgver=0.1e
pkgrel=1
pkgdesc="A Qt audio/video player inspired by Sonata (uses Phonon)."
arch=('i686' 'x86_64')
url="http://ukweb.fr/"
license=('GPL2')
depends=('qt>=4.4' 'phonon')
source=(http://qt-apps.org/CONTENT/content-files/107395-uplay-$pkgver.tar.gz)
md5sums=('ef7557961f6fdbe86847214e1d92f52d')

build() {

cd $srcdir/uplay
rm Makefile
qmake
make || return 1
install -D -m755 uplay $pkgdir/usr/bin/uplay

}
