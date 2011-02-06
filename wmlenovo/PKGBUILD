# Contributor: Xavier Benderitter <phenomenologeek at gmail.com>
pkgname=wmlenovo
pkgver=0.1.4
pkgrel=1
license=('GPL')
pkgdesc="A dockapp to monitor status of up to 2 batteries, cpu, gpu, motherboard temp, fan and cpu speed on Lenovo laptops"
url="http://www.dockapps.org/file.php/id/347"
arch=(i686 x86_64)
source=(http://www.dockapps.org/download.php/id/796/wmlenovo-0.1.4.tgz)
md5sums=('78a9435e54d9f62613be028862016d11')
build() {
	cd $startdir/src/$pkgname
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
}


