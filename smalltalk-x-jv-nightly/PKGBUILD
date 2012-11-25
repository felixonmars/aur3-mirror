# Maintainer: Daniel Milde <info@milde.cz>

pkgname=smalltalk-x-jv-nightly
pkgver=6.2.3b
_srcrel=585
pkgrel=2
pkgdesc="Smalltalk/X JV branch nightly builds"
arch=('i686' 'x86_64')
url="https://swing.fit.cvut.cz//projects/stx-goodies/wiki/SmalltalkX"
license=('MIT')
depends=('glibc' 'lib32-libxinerama')
makedepends=('')
source=("https://swing.fit.cvut.cz/jenkins/job/stx_jv/${_srcrel}/PLATFORM=Linux/artifact/artifacts/smalltalkx-jv-branch-${pkgver}_build${_srcrel}_linux-gnu_x86.tar.bz2" \
        smalltalk-x-jv.desktop
	stx.gif)
md5sums=('8524fc5fb643ac8a3216fcb9867c77aa' \
         '8b59c87e1c96c195fa0ffb869b230754' \
         '536a02c356e924e5c291343c5b5bbe6f')
conflicts=(smalltalk-x-jv)

build() {
    install -d ${pkgdir}/opt/stx-jv

    cd ${srcdir}/smalltalkx-jv-branch-${pkgver}_build${_srcrel}_linux-gnu_x86
    cp -R ./* ${pkgdir}/opt/stx-jv

    install -D ${srcdir}/smalltalk-x-jv.desktop ${pkgdir}/usr/share/applications/smalltalk-x-jv.desktop
    install -D ${srcdir}/stx.gif ${pkgdir}/usr/share/pixmaps/stx.gif
}
