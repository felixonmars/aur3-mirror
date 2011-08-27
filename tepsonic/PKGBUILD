# Maintainer : Dan Vratil <vratil@progdansoft.com>

pkgname=tepsonic
pkgver=0.98.3
pkgrel=1
pkgdesc="A simple lightweight audioplayer with lots of features" 
arch=('i686' 'x86_64') 
url="http://www.tepsonic.org/" 
depends=('qt>=4.5' 'phonon' 'taglib' 'libqxt') 
license=('GPLv3') 
source=("http://www.tepsonic.org/files/tepsonic-${pkgver}-src.tar.gz")

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake ./ -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {

  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
md5sums=('44230a5eb4c902028ed18686176b412b')
