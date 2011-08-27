pkgname=salasaga
pkgver=0.8.0.alpha7
pkgrel=1
pkgdesc="An Integrated Development Environment for producing eLearning"
url="http://www.salasaga.org/"
license=("LGPL")
arch=('i686' 'x86_64')
md5sums=('31fbfc3883376ae0beb9cf017f18c805')
depends=('pango' 'ming' 'libxml2')
makedeps=('autoconf' 'automake' 'glib2' 'gtk2' 'libgnome')
source=("http://www.salasaga.org/downloads/${pkgver##*.}/$pkgname-${pkgver/.a/-a}.tar.bz2")
md5sums=('f5e87faed718fbf5eb5a52ee308de97d')

build() {
	cd $startdir/src/$pkgname
	./autogen.sh
	./configure prefix=$startdir/pkg/usr
	make
	make prefix=$startdir/pkg/usr install
}

