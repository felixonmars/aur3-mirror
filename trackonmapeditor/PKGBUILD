# Maintainer: vn158 <vn158 at seznam dot cz>
pkgname=trackonmapeditor
pkgver=0.24
pkgrel=1
pkgdesc="GPX editor with map underlay"
arch=('i686' 'x86_64')
url="http://www.fi.muni.cz/~xsnajdr/trackEditor/"
license=('GPLv3')
groups=()
depends=(java-runtime)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=($pkgname-$pkgver.zip::http://www.fi.muni.cz/~xsnajdr/trackEditor/down.cgi?file=TrackOnMapEditor0_24.zip $pkgname $pkgname.desktop)
noextract=()
md5sums=('bf642523182015f59ad2f0e463954d65' 'eac808032693d4155e28b08a2d267d7e' 'fc7304f408003cab3115a167bf94f2f9')

build() {
	    :
    }
package() {
    cd "$srcdir"
    
    install -d -m755 $pkgdir/usr/share/java
    install -d -m755 $pkgdir/usr/share/java/$pkgname
    install -m644 TrackOnMapEditor/*.jar $pkgdir/usr/share/java/$pkgname
    install -m644 TrackOnMapEditor/README.TXT $pkgdir/usr/share/java/$pkgname

    install -d -m755 $pkgdir/usr/share/java/$pkgname/lib
    install -m644 TrackOnMapEditor/lib/*.jar $pkgdir/usr/share/java/$pkgname/lib

    install -d -m755 $pkgdir/usr/bin
    install -m755 $pkgname $pkgdir/usr/bin
    
#    install -d -m755 $pkgdir/usr/share/pixmaps
#    install -m644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png

    install -d -m755 $pkgdir/usr/share/applications
    install -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
