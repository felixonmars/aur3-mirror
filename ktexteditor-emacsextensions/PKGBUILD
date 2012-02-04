#Contributor: Michael Krauss <hippodriver@gmx.net>

pkgname=ktexteditor-emacsextensions
pkgver=0.1.7
pkgrel=1
pkgdesc="Extensions for katepart to make it look more emacs like."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=21706"
license=("GPL")
depends=('kdelibs')
options=('libtool')
source=('http://ilist.sourceforge.net/ktexteditor-emacsextensions-0.1.7.tar.gz')
md5sums=('a436a57a5673c370b5259abb2f5807c4')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/opt/kde
	make || return 1
	make DESTDIR=$startdir/pkg install
}