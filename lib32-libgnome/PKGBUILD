_pkgbase=libgnome
pkgname=lib32-$_pkgbase
pkgver=2.32.1
pkgrel=2
pkgdesc="Common libraries for GNOME (32 bit)"
arch=('x86_64')
license=('LGPL')
depends=('lib32-libbonobo' 'lib32-libcanberra' 'lib32-gnome-vfs' 'lib32-popt')
makedepends=('intltool' 'gcc-multilib' 'lib32-gconf')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgbase}/2.32/${_pkgbase}-${pkgver}.tar.bz2)
sha256sums=('b2c63916866485793b87398266dd7778548c1734923c272a94d84ee011b6f7a4')

build() {
  cd ${_pkgbase}-${pkgver}
  sed -i 's/-DG_DISABLE_DEPRECATED//' libgnome/Makefile.in
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static --disable-esd \
      --libdir=/usr/lib32 CC='gcc -m32'
  make
}

package() {
  cd ${_pkgbase}-${pkgver}
  make -C libgnome DESTDIR="${pkgdir}" install
  make -C monikers DESTDIR="${pkgdir}" install
  rm -rf "$pkgdir"/usr/{bin,include,lib32/bonobo/servers}
}
