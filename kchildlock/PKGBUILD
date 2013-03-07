# Maintainer: Miguel Aguilar <zodiac_es@yahoo.es>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=kchildlock
pkgver=0.90.4.2
pkgrel=2
pkgdesc="Monitors and restricts the usage time of a children spent on the computer.  For KDE4"
url="http://sourceforge.net/projects/kchildlock"
license="GPL"
arch=('i686' 'x86_64')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('d3a8dc41c76679d3c114b25440ba5e2b')

build() {
          #find . -name CMakeLists.txt -exec sed -i 's/add_subdirectory(doc)/#add_subdirectory(doc)/g' {} \;
	  cd ${srcdir}/$pkgname-$pkgver
	  cmake -DCMAKE_INSTALL_PREFIX=/usr -G KDevelop3 -DCMAKE_BUILD_TYPE=Release \
           -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
           -DDATA_INSTALL_DIR=/usr/share/kde4/ -DICON_INSTALL_DIR=/usr/share/icons .
	  make
	}

package() {
	cd ${srcdir}/$pkgname-$pkgver
	make DESTDIR=${pkgdir} install
}
