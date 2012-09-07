# Maintainer: Dominik George <nik@naturalnet.de>

pkgname=dtmf2num
pkgver=0.1d
pkgrel=2
pkgdesc="tool for decoding the DTMF and MF tones from PCM wave files"
arch=('i686' 'x86_64')
url="http://aluigi.org/mytoolz.htm"
license=('GPL')

# I had to re-upload the file because upstream blocks curl/wget
source=("http://shore.naturalnet.de/~nik/${pkgname}.zip" 01-free-segfault.patch)
md5sums=("d8ef615b49a32ca305352d733ebcfdf5" "ba30bf7bc959abd66394fa28c6650e9a")

noextract=("${pkgname}.zip")
makedepends=("unzip")

build() {
 cd "${srcdir}"
 unzip ${pkgname}.zip

 patch -p0 <01-free-segfault.patch

 make
}

package() {
 cd "${srcdir}"
 make PREFIX="${pkgdir}/usr" install
}
