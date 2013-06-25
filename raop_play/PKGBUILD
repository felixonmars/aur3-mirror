pkgname='raop_play'
pkgdesc='Command line music file player for Apple Airport Express'
pkgver=0.5.1
pkgrel=5
arch=('i686' 'x86_64')
url='http://raop-play.sourceforge.net/'
license=('GPL2')
depends=('openssl' 'libsamplerate' 'libid3tag')
makedepends=('linux-headers')
optdepends=('mpg123: MP3 playback support'
            'flac: FLAC playback support'
            'faad: AAC playback support'
            'vorbis-tools: OGG playback support')
source=("http://prdownloads.sourceforge.net/raop-play/${pkgname}-${pkgver}.tar.gz"
        'openssl.patch'
        'mpg123.patch'
        'fltk.patch'
        'linux.patch'
        'devinit.patch')
md5sums=('921f89c1d61f2a22e737e8431df63301'
         '724a8c7ea1cd3f855f19fcd79019d107'
         '3af0d7f9350f71acd28c246a536fe85a'
         '05aa29cc85d161ace1a8b07499f15edf'
         '3c46ae3ced44386b585850cfb0c685a3'
         '4ff802d7de38c8db08664145b9973374')
install=install

_kernver="`uname -r`"

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fix RAND_bytes-linker error with openssl.
  patch -p1 < "${srcdir}/openssl.patch"

  # Arch Linux uses mpg123, so patch raop_play to use that instead of mpg321.
  patch -p1 < "${srcdir}/mpg123.patch"

  # We do not need fltk, as we only want raop_play.
  patch -p1 < "${srcdir}/fltk.patch"

  # Fix kernel module for recent kernel versions.
  patch -p1 < "${srcdir}/linux.patch"

  # Remove __devinit removed in Linux v3.9 */
  patch -p1 < "${srcdir}/devinit.patch"

  ./configure --prefix="${pkgdir}/usr"

  # Build raop_play
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
  make

  # Build kernel module
  cd "${srcdir}/${pkgname}-${pkgver}/drivers"
  make -C /usr/lib/modules/"${_kernver}"/build M=`pwd`
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
  make install

  cd "${srcdir}/${pkgname}-${pkgver}/drivers"
  install -D -m 755 alsa_raoppcm.ko "${pkgdir}/usr/lib/modules/${_extramodules}/alsa_raoppcm.ko"
}
