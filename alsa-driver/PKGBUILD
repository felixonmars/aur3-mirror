# Maintainer: dreieck <felix )dot( becker (at( zih )dot) tu-dresden |dot| de>.
# Contributor: sjakub

pkgname="alsa-driver"
pkgver="1.0.25"
pkgrel="6"
pkgdesc="ALSA modules from alsa-project.org. May be more up-to-date than in-kernel drivers."
arch=('i686' 'x86_64')
url='http://www.alsa-project.org/'
license=('GPL' 'LGPL')
makedepends=('linux-headers')
source=("ftp://ftp.alsa-project.org/pub/driver/alsa-driver-${pkgver}.tar.bz2" "alsa-driver.install")
md5sums=('ac56465c262ced60b5eb2d6492d7a923' '359e32dda49f7546744fb80dfd877a60')
sha512sums=('51164c5f1c6e40e188be8e544ddc610b56ffb7d696bc925a0a30e6819d6cbd90a7f9f33c379d411d0e7a172a3ed1cf15b59c27654d63db1a9bad2051331d3017' '98814829c82ba2f2b202ac5c052bfb808f62f95c6737984709b81a8e8cf4b33ba3b77cd6149cbac54890b8b0824609d5c231b1e305a21912aed93a8a99f10413')
install="alsa-driver.install"

_extractdir="${srcdir}/alsa-driver-${pkgver}"

build()
{
  cd "${_extractdir}" || exit 11
  
  ./configure --with-oss=yes --with-sequencer=yes --with-isapnp=auto --with-pcm-oss-plugins=yes --with-cards=all --with-card-options=all --with-moddir=updates || exit 21
  
  make || exit "$?"
}

package()
{
  cd "${_extractdir}" || exit 101
  make DESTDIR="${pkgdir}" install-modules || exit "$?"
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
}

