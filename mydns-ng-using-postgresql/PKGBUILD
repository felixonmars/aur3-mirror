# Contributor: Julien <paci79@free.fr>

pkgname=mydns-ng-using-postgresql
pkgver=1.2.8.11
pkgrel=1
pkgdesc="MyDNS is a simple, non-recursive Internet name daemon which serves records directly from an SQL database"
arch=('i686' 'x86_64')
conflicts=('')
license=('GPL')
makedepends=('postgresql')
source=(http://kent.dl.sourceforge.net/sourceforge/mydns-ng/mydns-$pkgver.tar.gz)
url=""http://sourceforge.net/projects/mydns-ng

md5sums=('6eec53bfc286a057864916e2cef6f74a')

build() {

	  cd ${startdir}/src/mydns-1.2.8

	    ./configure --prefix=/usr --with-pgsql
	      make || return 1
	        make prefix=$startdir/pkg/usr install
	}

