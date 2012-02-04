# Contributor: Jan Mette (funkyou) <jan.mette@berlin.de>

pkgname=kdestyle-lipstik-vistesque
arch=('i686' 'x86_64')
pkgver=2.1
pkgrel=3
pkgdesc="Lipstik is a fast clean style for KDE3 with many options to tune your desktop look. This version has the Vistesque-patch applied."
url="http://www.kde-look.org/content/show.php?content=35729"
license="GPL"
depends=('kdebase3')
source=(ftp://ftp.univie.ac.at/systems/FreeBSD/ports/distfiles/18223-lipstik-2.1.tar.bz2 \
        http://www.kde-look.org/CONTENT/content-files/35729-lipstik-$pkgver-Vistesque-Ekaaty.patch)
md5sums=('0f7e576c615511d26209889e92aeb5c8' '12ce2c00967f5c8e4001c414b8644ad2')

build() {
	source /etc/profile.d/qt3.sh
	source /etc/profile.d/kde3.sh

        cd $srcdir/lipstik-$pkgver
	patch -p1 -i ../35729-lipstik-2.1-Vistesque-Ekaaty.patch || return 1
         ./configure --prefix=/opt/kde --without-arts
        make || return 1
        make DESTDIR=$pkgdir install
}
