# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
pkgname=snesreader
pkgver=0.011
pkgrel=1
pkgdesc="bsnes library for handling compressed files."
arch=('i686' 'x86_64')
url="http://byuu.org/bsnes/"
license=('GPL2' 'LGPL' 'zlib' 'custom:unrar')
depends=('qt>=4.5.0')
source=("http://byuu.org/files/${pkgname}_v011.tar.bz2")
md5sums=('ce5c44d79628879e5261b28c61db2279')

build() {
  cd "${srcdir}/${pkgname}"

  # Conform to the Arch Linux packaging standards
  sed -e 's|\(libsnesreader.*\) $(DESTDIR)$(prefix)/lib|\1 $(DESTDIR)$(prefix)/lib/\1|' \
      -i "${srcdir}/${pkgname}/Makefile" || return 1

  # Build and install it
  make || return 1
  make install DESTDIR=$pkgdir prefix=/usr || return 1
  chmod 644 "${pkgdir}/usr/lib/lib${pkgname}.a" || return 1
  
  # Licenses
  mkdir -p "${pkgdir}/usr/share/licenses/snesreader"
  install -m644 "${srcdir}/${pkgname}/7z_C/lzma.txt" "${pkgdir}/usr/share/licenses/snesreader/license-7zip.txt"
  install -m644 "${srcdir}/${pkgname}/unrar/license.txt" "${pkgdir}/usr/share/licenses/snesreader/license-unrar.txt"
}