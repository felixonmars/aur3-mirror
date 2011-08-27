# Contributor: grimi <grimi@poczta.fm>

pkgname=xsidplay
pkgver=2.0.3
pkgrel=1
pkgdesc="QT fronted for libsidplay"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/xsidplay2"
license=('GPL')
depends=('alsa-lib' 'libsidplay' 'qt3' 'sdl')
source=("http://downloads.sourceforge.net/xsidplay2/${pkgname}-${pkgver}.tar.bz2")
md5sums=('4e731fbfb47453a6770b9f83e3702619')

build() {
. /etc/profile.d/qt3.sh
cd $srcdir/$pkgname-$pkgver
./configure --prefix=/usr
make || return 1
make install DESTDIR=$pkgdir
install -Dm644 xsidplay.xpm $pkgdir/usr/share/pixmaps/xsidplay.xpm
install -Dm644 xsidplay.desktop $pkgdir/usr/share/applications/xsidplay.desktop
}


