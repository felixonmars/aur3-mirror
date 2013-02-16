# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=timemachine
pkgver=0.3.3
pkgrel=3
pkgdesc="A quick one-click audio file recorder for JACK audio applications"
arch=('i686' 'x86_64')
url="http://plugin.org.uk/timemachine/"
license=('GPL')
depends=('jack' 'gtk2')
source=(http://plugin.org.uk/timemachine/${pkgname}-${pkgver}.tar.gz)
md5sums=('6f26d1c4bac96b36dfe743bcc07bfe53')
sha256sums=('3e798a952b83874e3d60642ca4a7e0c2e2990c4659561009087da95044b21f9d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  LDFLAGS="-lm" CFLAGS="$SLKCFLAGS" CXXFLAGS="$SLKCFLAGS" ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
