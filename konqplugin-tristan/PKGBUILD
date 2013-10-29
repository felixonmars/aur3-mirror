# Submitter: Thomas Fischer <thomas.fischer@t-fischer.net>
# Maintainer: Boris Vasilyev <bobartmail@gmail.com>

pkgname=konqplugin-tristan
_pkgname=tristan
pkgver=20090831
pkgrel=1
pkgdesc="Speed Dial for Konqueror"
arch=('i686' 'x86_64')
url="http://www.unix-ag.uni-kl.de/~fischer/speeddial/"
license=('GPL-2')
depends=('kdebase-konqueror')
install=konqplugin-tristan.install
source=('http://www.unix-ag.uni-kl.de/~fischer/speeddial/tristan-20090831.tar.bz2')
md5sums=('8988df46ff0fd7058946e506757476cc')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ${srcdir}/${_pkgname} \
	-DCMAKE_BUILD_TYPE=Release \
	-DKDE4_BUILD_TESTS=OFF \
	-DCMAKE_SKIP_RPATH=ON \
	-DCMAKE_INSTALL_PREFIX=/usr
  make 
}


package(){

  pkgdesc='Speed Dial for Konqueror'
  install='konqplugin-tristan.install'
  cd "${srcdir}/build"
  make DESTDIR=$pkgdir install

  install -d "${pkgdir}/usr/share/doc/tristan"
  install -m0644 "${srcdir}/${_pkgname}/example.trs" "${pkgdir}/usr/share/doc/tristan"

}
