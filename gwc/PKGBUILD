# Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>

pkgname=gwc
pkgver=0.21.19
_pkgver=0.21-19
pkgrel=1
pkgdesc="Gnome Wave Cleaner - dehiss/declick recordings"
url="http://gwc.sourceforge.net/"
license="GPL"
arch=('i686' 'x86_64')
depends=('fftw' 'libsndfile' 'libgnomeui')
source=(http://downloads.sourceforge.net/sourceforge/gwc/$pkgname-$_pkgver.tgz gwc.desktop)
md5sums=('740f16be30b178b155b54811491a0b46'
         '26ce01cd460f660e50e13e517461cf7b')

build() {
  cd ${srcdir}/${pkgname}-$_pkgver
  ./configure --with-all --prefix=$pkgdir/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-$_pkgver
  make install
  mkdir -p ${pkgdir}/usr/share/applications
  install -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/
}
