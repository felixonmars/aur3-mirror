# Contributor: Christophe Robin <bombstrike@gmail.com>
pkgname=genext2fs
pkgver=1.4.1
pkgrel=3
_pkgreldeb=4
pkgdesc="Generate an ext2fs filesystem as a user"
# The author didn't create a proper tag for that version
arch=('i686' 'x86_64')
url="http://genext2fs.sourceforge.net/"
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/g/genext2fs/genext2fs_${pkgver}.orig.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/g/genext2fs/genext2fs_${pkgver}-${_pkgreldeb}.debian.tar.gz")
md5sums=('b7b6361bcce2cedff1ae437fadafe53b'
         'd0233745c5683f55275da9513862363d')
makedepends=('automake-1.9')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # apply debian patches
  for PATCHFILE in `cat "${srcdir}/debian/patches/series"`; do
    echo "Applying patch ${PATCHFILE}"
    patch -p1 -i "${srcdir}/debian/patches/${PATCHFILE}";
  done
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install || return 1
}
