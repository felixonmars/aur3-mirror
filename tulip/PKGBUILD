# Contributor: Thomas Aynaud <taynaud at gmail dot com>
# Contributor: moostik <mooostik_at_gmail.com>
# Maintainer: Alexey Stukalov <astukalov at gmail.com>

pkgname=tulip
pkgver=4.7.0
pkgrel=1
pkgdesc="An information visualization framework dedicated to the analysis and visualization of relational data"
arch=('i686' 'x86_64')
url="http://www.tulip-software.org"
license=('LGPL')
depends=('python2' 'libxml2' 'glew' 'freetype2' 'doxygen' 'ftgl'
         'qt5-base' 'qt5-tools' 'qt5-xmlpatterns' 'qt5-webkit' )
optdepends=('python-sphinx: generates docucentation for python bindings')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/project/auber/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}_src.tar.gz"
	"${pkgname}.profile"	
	'bfd_link.patch'
)
md5sums=('f68a74545788b5c5e51e662fa0c036f5'
	 'fa35918a3844ba4cbf494ac5ce8007f7'
	 '399930468a7e12451a5f100317531ab1')

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p2 -i ../bfd_link.patch
  mkdir build
}

build() {
  cd "${srcdir}/${pkgname}/build"
  
  cmake .. \
  	-DCMAKE_BUILD_TYPE=Release \
  	-DCMAKE_SKIP_RPATH=ON \
	-DCMAKE_PREFIX_PATH=/usr/lib/qt5 \
	-DUSE_QT5_IF_INSTALLED=ON \
  	-DCMAKE_INSTALL_PREFIX="${pkgdir}/opt/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make install
  # strip ${pkgdir} from tulip-config
  sed -i -e "s!${pkgdir}!!g" ${pkgdir}/opt/tulip/bin/tulip-config
  # shell profile for running tulip
  install -D "${srcdir}/${pkgname}.profile" "${pkgdir}/etc/profile.d/${pkgname}.sh"
}

