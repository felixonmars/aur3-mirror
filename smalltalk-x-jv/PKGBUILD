# Maintainer: Daniel Milde <info@milde.cz>

pkgname=smalltalk-x-jv
pkgver=6.1.2
_srcrel=20100831
pkgrel=5
pkgdesc="Smalltalk/X JV branch"
arch=('i686' 'x86_64')
url="https://swing.fit.cvut.cz//projects/stx-goodies/wiki/SmalltalkX"
license=('MIT')
depends=('glibc')
makedepends=('')
source=(https://swing.fit.cvut.cz//download/smalltalkx/smalltalk-${pkgver}+mop.${_srcrel}svn_linux.tar.bz2 smalltalk-x-jv.desktop)
md5sums=('eadc222f490ac29c051ed67d914b0d6c' 'c121991fe06d55f03e9c508748e20c9a')
conflicts=(smalltalk-x-jv-nightly)

build() {
    install -d ${pkgdir}/opt/stx-jv
    
    cd ${srcdir}/smalltalk-${pkgver}+mop.${_srcrel}svn_linux
    cp -R ./* ${pkgdir}/opt/stx-jv
    
    install -D ${srcdir}/smalltalk-x-jv.desktop ${pkgdir}/usr/share/applications/smalltalk-x-jv.desktop
    install -D ./lib/smalltalkx/6.1.2/lib/splash-smalltalkx.gif ${pkgdir}/usr/share/pixmaps/stx.gif
}
