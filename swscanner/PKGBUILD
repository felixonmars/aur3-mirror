# Contributor: Marochkin Sergey <xziggix@gmail.com>
# Previous PKGBUILD contributed by: Matías Javier Rossi <matiasjrossi@gmail.com>
# Previous PKGBUILD contributed by: Thomas Mudrunka <harvie@@email..cz>
# Original PKGBUILD contributed by: Erwin Van de Velde <erwin.vandevelde@gmail.com>

# IMPORTANT:: I don't know why, but unless you run makepkg as root configure will stop, and tell you to rebuild kdelibs.
# (Of course, build it as root at your own risk ;)

pkgname=swscanner
pkgver=0.2.2
pkgrel=4
pkgdesc="SWScanner is a NetStumbler like wireless network (wifi/802.11) scanner."
arch=('i686' 'x86_64')
url="http://www.swscanner.org"
license="GPL"
depends=(qt3 libidn acl libart-lgpl fam shapelib kdelibs3)
builddepends=('glibc' 'gcc')
source=("http://www.swscanner.org/files/active/0/$pkgname-$pkgver.tar.gz"
	'swscanner-0.2.2-mjr.patch')
md5sums=('6337ca79f295b42a256790f0133b7730'
	 'e0c585f910ad08ada34b10ad58c1f4f3')

build() {
  cd ${srcdir}/swscanner-${pkgver}
  patch -p1 < ${startdir}/${pkgname}-${pkgver}-mjr.patch
  ./configure --prefix=/opt/kde/ --without-arts --with-extra-includes=/usr/include/libshp --with-extra-libs="/opt/qt/lib -L/opt/kde/lib"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
