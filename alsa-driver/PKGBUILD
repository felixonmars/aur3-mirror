# Maintainer: Felix Becker <felix )dot( becker (at( zih )dot) tu-dresden |dot| de>.

pkgname="alsa-driver"
pkgver="1.0.25"
pkgrel="4"
pkgdesc="ALSA modules from alsa-project.org. May be more actual than in-kernel drivers."
arch=('i686' 'x86_64')
url='http://www.alsa-project.org/'
license=('GPL' 'LGPL')
makedepends=('linux-headers')
source=("ftp://ftp.alsa-project.org/pub/driver/alsa-driver-${pkgver}.tar.bz2" "alsa-driver.install")
md5sums=('ac56465c262ced60b5eb2d6492d7a923' '7fea34b272152625dd4c40a25fc9b3e3')
#sha1sums=('ebda37d18379466ca9d843e7a80d10bb706a6b04')
#sha256sums=('d80e219fd410b5bc62f9332e5964acd575cc8a0bcda80fa41d5eebeabde0ebc3')
#sha384sums=('8f1f2f725e948707990c469b7b751dc3b0bfbe77205e133e9c4a8b9d1d31404c68a0ab332955da960b383224dd05dc36')
#sha512sums=('51164c5f1c6e40e188be8e544ddc610b56ffb7d696bc925a0a30e6819d6cbd90a7f9f33c379d411d0e7a172a3ed1cf15b59c27654d63db1a9bad2051331d3017')
install="alsa-driver.install"

_extractdir="${srcdir}/alsa-driver-${pkgver}"

build()
{
  cd "${_extractdir}" || exit 11
  
  ./configure --with-oss=yes --with-sequencer=yes --with-isapnp=auto --with-pcm-oss-plugins=yes --with-cards=all --with-card-options=all || exit 21
  
  make || exit "$?"
}

package()
{
  cd "${_extractdir}" || exit 101
  make DESTDIR="${pkgdir}" install-modules || exit "$?"
}
