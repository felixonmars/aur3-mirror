# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributor: dhamp <dhamp@ya.ru>

_name=eiskaltdcpp
pkgname=eiskaltdcpp-gtk3-git
pkgver=20140115
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="DC and ADC client based on dcpp core"
depends=('gtk3' 'libnotify' 'zlib' 'bzip2' 'pcre' 'lua' 'libidn')
makedepends=('git' 'cmake')
license=('GPL3')
url="http://code.google.com/p/eiskaltdc/"
conflicts=('eiskaltdcpp' 'eiskaltdcpp-gtk' 'eiskaltdcpp-qt')
install=$_name.install
provides=('eiskaltdcpp')
source=('git+https://github.com/eiskaltdcpp/eiskaltdcpp.git')
sha1sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_name}
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd ${srcdir}/${_name}
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_IDNA=ON -DUSE_LIBGNOME2=OFF \
    -DLOCAL_MINIUPNP=ON -DUSE_GTK3=ON -DUSE_QT=NO -DLOCAL_BOOST=ON -DLUA_SCRIPT=ON -DWITH_LUASCRIPTS=ON -DWITH_DHT=ON -DCMAKE_BUILD_TYPE="Release"
	make -j 4
}

package() {
	cd ${srcdir}/${_name}
	make DESTDIR=$pkgdir install
}
