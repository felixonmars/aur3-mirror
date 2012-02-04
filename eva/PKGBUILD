#below is binary package download page:
#http://www.fs2you.com/files/6bc272d4-d7cf-11dc-a6b8-0014221b798a/
#below is PKGBUILD
# Contributor: lo3 <smoke.v@gmail.com>
pkgname=eva
pkgver=0.4.1
pkgrel=1
arch=('i686')
pkgdesc="QQ protocol instant messaging client for KDE."
url="http://sourceforge.net/projects/evaq"
license="GPL"
depends=('kdelibs' 'qt3')
makedepends=('pkgconfig' 'make')
source=(http://internap.dl.sourceforge.net/sourceforge/evaq/$pkgname-$pkgver.tar.bz2)
md5sums=('975ad99a5ae2286432896968cb07334b')

build() {
	cd $srcdir/$pkgname
	./configure --prefix=`kde-config --prefix`
	make || return 1
	make DESTDIR=$pkgdir install
}
