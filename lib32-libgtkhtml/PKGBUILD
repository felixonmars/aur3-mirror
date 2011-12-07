# Maintainer: Harvey <harv@gmx.de>
_pkgbasename=libgtkhtml
pkgname=lib32-$_pkgbasename
pkgver=2.11.1
pkgrel=8
pkgdesc="A HTML library for GTK (32-bit)"
arch=('x86_64')
license=('LGPL')
depends=('lib32-gtk2>=2.22.1' 'lib32-libxml2>=2.7.8' $_pkgbasename)
makedepends=('gcc-multilib' 'perlxml')
options=('!libtool')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/GNOME/sources/$_pkgbasename/2.11/$_pkgbasename-$pkgver.tar.bz2
	disable-gnome-vfs.patch)
md5sums=(`wget ${source/.t*}.md5sum -qO - | grep tar.bz2 | cut -d " " -f1` 
	'4b7e20bfad6ff13f8a9951688f7a3ba5')
 
build() {
  cd "${srcdir}/$_pkgbasename-${pkgver}"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  patch -p1 -i ${srcdir}/disable-gnome-vfs.patch
  ./configure --prefix=/usr --sysconfdir=/etc \
  --localstatedir=/var --disable-static --libdir=/usr/lib32
  
  make
}

package() {
  cd "${srcdir}/$_pkgbasename-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
