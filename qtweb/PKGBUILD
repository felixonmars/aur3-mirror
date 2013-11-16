#Maintainer: DaZ <daz.root+arch@gmail.com> 
#Contributor: andy123 < ajs AT online DOT de >

pkgname=qtweb
pkgver=3.8.5.108
_pkgbuild=108
pkgrel=1
pkgdesc="lightweight, secure and portable browser based on qt and webkit"
arch=('i686' 'x86_64')
url=('http://qtweb.net')
license=('GPL')
depends=('qtwebkit')
makedepends=()

source=(https://github.com/magist3r/QtWeb/archive/b$_pkgbuild.tar.gz ${pkgname}.desktop)
sha1sums=('5a803872fe9fd5ba4fdbed82b0ad8c8f7e648fd5'
          'a69b318c269a9e365cb0d96d1f290437c18b1e89')

build(){
    cd "${srcdir}/QtWeb-b$_pkgbuild"
    qmake-qt4
    make
}

package(){
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    install ${srcdir}/QtWeb-b$_pkgbuild/build/QtWeb ${pkgdir}/usr/bin/${pkgname}
    install ${pkgname}.desktop ${pkgdir}/usr/share/applications 
    install ${srcdir}/QtWeb-b$_pkgbuild/src/Resources/logo.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
}
