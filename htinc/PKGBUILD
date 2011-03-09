# Contributor: bzt <unmacaque@gmail.com>

pkgname=htinc
pkgver=0.20
pkgrel=1
pkgdesc="HTML Include handles Include files in HTML Source files."
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/htinc/"
license=('GPL2')
source=("http://download.berlios.de/htinc/${pkgname}-${pkgver}.tar.bz2"
	"std_time.patch")
md5sums=("667107737495aeb75e89ff26f74d47bc"
	 "a32a18775b2a7d9bc856f78580579734")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  patch -p0 < ../std_time.patch

  ./configure --prefix=/usr || return 1

  make || return 1
  make install DESTDIR=$pkgdir || return 1
}

