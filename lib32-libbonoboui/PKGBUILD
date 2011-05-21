_pkgbasename=libbonoboui
pkgname=lib32-$_pkgbasename
pkgver=2.24.5
pkgrel=1
pkgdesc="User Interface library for Bonobo (32 bit)"
arch=('x86_64')
url="http://www.gnome.org"
license=('GPL' 'LGPL')
depends=('lib32-libgnome' 'lib32-libsm' 'lib32-libgnomecanvas')
makedepends=('intltool' 'gcc-multilib')
options=('!libtool' '!emptydirs')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgbasename}/${pkgver%.*}/${_pkgbasename}-${pkgver}.tar.bz2)
sha256sums=('fab5f2ac6c842d949861c07cb520afe5bee3dce55805151ce9cd01be0ec46fcd')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
  		--disable-static --libdir=/usr/lib32 CC='gcc -m32'
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/{bin,include,share} \
  	 ${pkgdir}/usr/lib32/{bonobo,bonobo-2.0}
}
