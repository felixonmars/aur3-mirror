# Contributor: jordz <jordz@archlinux.us>

pkgname=nemiver
pkgver=0.9.0
pkgrel=2
pkgdesc="A C/C++ debugger for GNOME"
arch=(i686 x86_64)
license=('GPL')
depends=('gdb' 'gtksourceviewmm' 'libgtop' 'vte3' 'dconf' 'ghex')
makedepends=('boost' 'intltool')
url="http://www.gnome.org/projects/nemiver/"
install=nemiver.install
source=(http://ftp.acc.umu.se/pub/GNOME/sources/$pkgname/0.9/$pkgname-$pkgver.tar.xz)
options=('!libtool' '!emptydirs')
md5sums=('03a2c34d4c04fd69749c01975a97c0c2') 

build() 
{	
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc \
                  --localstatedir=/var --disable-static \
                  --with-boost --disable-scrollkeeper \
                  --enable-symsvis=yes --enable-gio=yes \
                  --enable-memoryview=yes
	make
}

package() {
      cd $srcdir/$pkgname-$pkgver
	make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$pkgdir install
      install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
      gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain nemiver ${pkgdir}/etc/gconf/schemas/*.schemas
      rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
