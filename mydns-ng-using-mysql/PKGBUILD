# Contributor: Julien <paci79@free.fr>

pkgname=mydns-ng-using-mysql
pkgver=1.2.8.31
pkgrel=1
pkgdesc="MyDNS is a simple, non-recursive Internet name daemon which serves records directly from an SQL database"
arch=('i686' 'x86_64')
conflicts=('')
license=('GPL')
makedepends=('mysql')
source=(http://kent.dl.sourceforge.net/sourceforge/mydns-ng/mydns-$pkgver.tar.gz)
url=""http://sourceforge.net/projects/mydns-ng

md5sums=('f640b619d2baf40456c91f797d22a3f0')

build() {

	  cd ${startdir}/src/mydns-${pkgver}

	    ./configure --prefix=/usr --with-mysql
	      make || return 1
	        make prefix=$startdir/pkg/usr install
	}

