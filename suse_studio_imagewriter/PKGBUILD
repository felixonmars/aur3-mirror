# Maintainer: Vindex17 <vindex17@outlook.it>
pkgname=suse_studio_imagewriter
pkgver=1.10
_release=2.1.2
pkgrel=1
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('i686' 'x86_64')
url="https://github.com/mbarringer/imagewriter"
license=('GPL2')
depends=('qt4' 'udisks2')
optdepends=("xdg-su: needed by non-KDE users"
	    "kdebase-runtime: provides kdesu")
conflicts=(imagewriter)
replaces=(imagewriter)
source=(http://download.opensuse.org/source/distribution/openSUSE-current/repo/oss/suse/src/imagewriter-$pkgver-$_release.src.rpm)
noextract=(imagewriter.spec)
sha512sums=('79e4bdf2fb26a7b9da716e3ba4edb737af673ac686bedb0ef0f588d85c9eb409407d469311e27a9a01f493d4574512a668a058103ecc4efb6e6a536e484f5df7')

prepare() {
	cd $srcdir
	tar xvzf imagewriter-$pkgver.tar.gz
	if [[ -e /usr/bin/kdesu ]]
	  then sed 's/\/usr\/bin\/xdg-su -c \/usr\/bin\//kdesu /' -i imagewriter-$pkgver/imagewriter.desktop
	  else sed 's/\/usr\/bin\/xdg-su -c \/usr\/bin\//xdg-su -s /' -i imagewriter-$pkgver/imagewriter.desktop
	fi
}

build() {
	cd $srcdir/imagewriter-$pkgver
	qmake-qt4 PREFIX=$pkgdir/usr DEFINES=USEUDISKS2 imagewriter.pro
	make CFLAGS="$CFLAGS -DKIOSKHACK"
}

package() {
	cd $srcdir/imagewriter-$pkgver
	make install
}
