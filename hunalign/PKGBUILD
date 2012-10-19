# Contributor: Krystian Soltysik <krystians@outlook.com>
# Maintainer: Filip Graliński <filipg@amu.edu.pl>
pkgname=hunalign
pkgver=1.1
pkgrel=2
pkgdesc="Sentence aligner"
arch=(i686 x86_64)
license=('LGPL2.1')
makedepends=(gcc make)
depends=(python2 bash gawk)
source=("ftp://ftp.mokk.bme.hu/Hunglish/src/hunalign/latest/hunalign-1.1.tgz")
md5sums=('0e372362414b8acebca7898063d6a3a6')
url=http://mokk.bme.hu/resources/hunalign/

build() {
    cd "${srcdir}/${pkgname}-1.1"/src/hunalign
    make
    mkdir -p "${pkgdir}"/usr/bin
}

package() {
    cd "${srcdir}/${pkgname}-1.1/scripts"
    for f in `find -type f`; do
        install -D "$f" "${pkgdir}/usr/share/hunalign/scripts/$f"
    done
    install -D  "${srcdir}/${pkgname}-1.1/src/hunalign/hunalign" "${pkgdir}/usr/bin"
    install -D  "${srcdir}/${pkgname}-1.1/readme.html" "${pkgdir}/usr/share/hunalign/readme.html"
}
