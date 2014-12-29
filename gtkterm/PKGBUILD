#Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>
pkgname=gtkterm
pkgver=0.99.7_rc1
pkgrel=5
pkgdesc="Serial port terminal"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/gtkterm/"
license=('GPL')
__rel=0.6.rc1.git26021e33
__fc=fc21
__ver=0.99.7
depends=('vte')
makedepends=('intltool')
install=gtkterm.install
source=(
http://kojipkgs.fedoraproject.org/packages/${pkgname}/${__ver}/${__rel}.${__fc}/src/${pkgname}-${__ver}-${__rel}.${__fc}.src.rpm
        )
build() {
    bsdtar -jxf gtkterm-26021e331031902291f7f4c88dbb662ece3f6bd3.tar.bz2
    cd gtkterm-26021e331031902291f7f4c88dbb662ece3f6bd3
    patch -Np1 -i ../0001-Send_Hexadecimal-handle-more-then-50-chars-and-impro.patch
    patch -Np1 -i ../0002-Fix-autoreconf-with-newer-autotools.patch
    patch -Np1 -i ../0003-lockfiles-should-be-created-under-var-lock-lockdev.patch
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    install -Dm644 gtkterm.desktop ${pkgdir}/usr/share/applications/gtkterm.desktop
    install -Dm644 gtkterm.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/gtkterm.png
    cd gtkterm-26021e331031902291f7f4c88dbb662ece3f6bd3
    make install DESTDIR=${pkgdir}
}
md5sums=('80316be310c45b012606cce523009383')
