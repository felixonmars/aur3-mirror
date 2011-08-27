# Maintainer: Juan Diego Tascon

pkgname=nateon
pkgver=1.0.1.275
pkgrel=1
pkgdesc="Nateon messenger for Linux"
arch=(i686)
url="http://kldp.net/projects/nateon/"
depends=('kdelibs3>=3.5.10' 'libxss>=1.1')
makedepends=('qt>=4.5.0' 'kdelibs3>=3.5.10' 'kdelibs>=4.2.1' 'sqlite3>=3.6.11' 'cmake')
license="GPL"
source=("http://kldp.net/frs/download.php/5390/${pkgname}-${pkgver}.tar.bz2" "http://nateondownload.nate.com/download/nateongen_32.zip")
md5sums=('5b6425cdf28332cdb21f8dbe2fe0606e' 'e87e751d2eee21544a876e68e9131f59')
build() {
	cd ${startdir}/src/${pkgname}-1.0
	
	# no use arts
	sed -i 's|.*arts.*||ig' CMakeLists.txt
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make || return 1
	make DESTDIR=${startdir}/pkg install

	install -m755 ${startdir}/src/nateongen ${startdir}/pkg/usr/bin/
}

