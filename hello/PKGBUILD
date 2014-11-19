# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=hello
pkgver=2.10
pkgrel=1
pkgdesc="The GNU Hello program produces a familiar, friendly greeting"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/hello/"
license=('GPL3')
depends=('glibc')
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('6cd0ffea3884a4e79330338dcc2987d6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-nls
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
