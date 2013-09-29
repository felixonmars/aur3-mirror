# Maintainer: Rasi <rasi at xssn dot at>
_pkgname=dzen
pkgname=dzen2-transparency-git
pkgver=20130217
pkgrel=1
pkgdesc="X notification utility with Xinerama,XMP and transparency support, git version."
arch=('i686' 'x86_64')
url=('https://github.com/robm/dzen')
license=('MIT/X')
provides=('dzen2-git')
conflicts=('dzen2-git' 'dzen2' 'dzen2-svn')
depends=(libxft)
source=(git://github.com/DaveDavenport/dzen.git)
md5sums=()

pkgver() {
    cd $_pkgname
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr
    cd gadgets
    make PREFIX=/usr

}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    cd "$srcdir/$_pkgname/gadgets"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    cd "$srcdir/$_pkgname"
    install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -D -m644 README.dzen "${pkgdir}/usr/share/doc/${pkgname}/README.dzen"
    install -D -m644 CREDITS "${pkgdir}/usr/share/doc/${pkgname}/CREDITS"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('SKIP')
