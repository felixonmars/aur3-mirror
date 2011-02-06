_pkgbasename=libgnomecanvas
pkgname=lib32-$_pkgbasename
pkgver=2.30.3
pkgrel=1
pkgdesc="The GNOME Canvas library (32 bit)"
arch=('x86_64')
license=('LGPL')
url="http://www.gnome.org"
depends=('lib32-libglade>=2.6.4' 'lib32-libart-lgpl>=2.3.21' "$_pkgbasename>=$pkgver")
makedepends=('pkgconfig' 'intltool' 'gcc-multilib')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgbasename}/2.30/${_pkgbasename}-${pkgver}.tar.bz2)
sha256sums=('859b78e08489fce4d5c15c676fec1cd79782f115f516e8ad8bed6abcb8dedd40')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --disable-static --enable-glade --libdir=/usr/lib32 \
  				--prefix=/usr CC='gcc -m32'
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/{include,share/gtk-doc,share/locale}
  install -Dm644 COPYING.LIB "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LIB"
}
