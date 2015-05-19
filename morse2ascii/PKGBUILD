# Maintainer: Dominik George <nik@naturalnet.de>
# Contributor: Michael Bentlage <mi.bentlage AT gmail.com>

pkgname=morse2ascii
pkgver=0.2
pkgrel=1
pkgdesc="experimental tool which decodes the morse codes from a PCM WAV file using a volume/peak based method"
arch=('i686' 'x86_64')
url="http://aluigi.org/mytoolz.htm"
license=('GPL')

source=("http://aluigi.altervista.org/mytoolz/morse2ascii.zip")
md5sums=("0390918b4b214053b87b94d96a6ad1ff")

noextract=("${pkgname}.zip")
makedepends=("unzip")

build() {
 cd "${srcdir}"
 unzip ${pkgname}.zip
 
 make
}

package() {
 cd "${srcdir}"
 make PREFIX="${pkgdir}/usr" install
}
