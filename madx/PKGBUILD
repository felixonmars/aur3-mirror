# Maintainer: Yngve Inntjore Levinsen <yngve.inntjore.levinsen@cern.ch>


pkgname=madx
pkgver=5.00.00
_debver=2
pkgrel=1
pkgdesc="a program for particle accelerator design and simulation with a long history, production (stable) version"
depends=('libx11' 'libxcb' 'glibc' 'zlib')
makedepends=('deb2targz' 'tar' 'gzip')
optdepends=('gnuplot: Plotting functionality')
arch=('i686' 'x86_64')
license=('Mad-X:"Standard CERN copyright statement", PTC:"Covered by F. Schmidt and E. Forest", SDDS:"Specific copyright statement distributed with Mad-X"')
url="http://cern.ch/mad"
if [ "${CARCH}" = "x86_64" ]; then
    md5sums=('42766d0fa9af25acb6dedabca05681c7')
    _carch=amd64
elif [ "${CARCH}" = "i686" ]; then
    md5sums=('7e2c4b5e5bbf112158b41667b5f400d1')
    _carch=i386
fi
source=($pkgname-$pkgver.deb::"http://cern.ch/lcg-heppkg/debian/pool/hep/m/${pkgname}/${pkgname}_${pkgver}-${_debver}_${_carch}.deb")
build() {
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -d ${pkgdir}/usr/bin
    install -d ${pkgdir}/usr/lib
    pwd
    deb2targz $pkgname-$pkgver.deb
    tar -xvzf $pkgname-$pkgver.tar.gz
    gzip -d usr/share/doc/${pkgname}/License.txt.gz

    install -D -m644 usr/share/doc/${pkgname}/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
    install -D -m644 usr/share/doc/${pkgname}/License.txt ${pkgdir}/usr/share/licenses/${pkgname}/License.txt
    install -D -m644 usr/share/doc/${pkgname}/SDDS_COPYRIGHT.TXT ${pkgdir}/usr/share/licenses/${pkgname}/SDDS_COPYRIGHT.TXT
    install -D -m644 usr/share/doc/${pkgname}/SDDS_LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/SDDS_LICENSE


    install -D -m755 usr/bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}
    }
