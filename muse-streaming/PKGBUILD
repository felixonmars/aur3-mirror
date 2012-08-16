# Maintainer:  Eugen Zagorodniy <https://github.com/ezag>
# Contributor: Pierluigi <pierluigi88@gmail.com>

pkgname=muse-streaming
pkgver=0.9.2
pkgrel=4
pkgdesc="Application for the mixing, encoding, and network streaming of sound"
arch=('i386' 'x86_64')
url="http://muse.dyne.org/"
license=("GPL2")
depends=('lame' 'gtk2' 'libsndfile' 'libvorbis')
source=("http://files.dyne.org/muse/releases/MuSE-${pkgver}.tar.gz"
        "linklist.patch"
        "iostream.patch")
md5sums=('7b3b01a35af79b8852ee6b0f033ff46c'
         '50dcf69cb6b65a90ee9d20a7e6aa433d'
         'fc2690a62b29abef28a7e979bb8b3f16')

build() {
  cd ${srcdir}/MuSE-${pkgver}
  patch -p0 -i ../linklist.patch
  patch -p0 -i ../iostream.patch
  ./configure \
    CPPFLAGS="${CPPFLACGS} -fpermissive" \
    LDFLAGS="${LDFLAGS} -Wl,--no-as-needed" \
    --prefix=/usr
  make
}

package() {
  cd ${srcdir}/MuSE-${pkgver}
  make DESTDIR=${pkgdir} install
}
