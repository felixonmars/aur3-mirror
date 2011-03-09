_pkgbasename=sysfsutils
pkgname=lib32-$_pkgbasename
pkgver=2.1.0
pkgrel=1
pkgdesc="System Utilities Based on Sysfs (32 bit)"
arch=('x86_64')
url="http://linux-diag.sourceforge.net/Sysfsutils.html"
license=('GPL' 'LGPL')
depends=('lib32-glibc' "$_pkgbasename>=$pkgver")
options=(!libtool)
source=("http://downloads.sourceforge.net/sourceforge/linux-diag/${_pkgbasename}-${pkgver}.tar.gz")
md5sums=('14e7dcd0436d2f49aa403f67e1ef7ddc')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}" 
  ./configure --prefix=/usr --mandir=/usr/share/man \
  						--libdir=/usr/lib32 CC='gcc -m32'
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}" 
  make DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/{bin,include,share}
}
