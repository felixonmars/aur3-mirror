# Maintainer: prettyvanilla <prettyvanilla@lavabit.com>

_pkgname=Caledonia-Icons
pkgname=caledonia-icons
pkgver=1.0
pkgrel=1
pkgdesc="Caledonia icon theme for KDE4"
arch=('any')
url=("http://malcer.deviantart.com/art/Caledonia-Icons-264978107")
license=('CCPL')
source=("http://downloads.sourceforge.net/project/caledonia/Caledonia%20Icons/$_pkgname.tar.gz")

md5sums=('0bdc6c272f2452945030f80b64aafea7')

build() {
    # delete leftover .directory files
    find "$srcdir/$_pkgname/" -name '.directory' | xargs rm
}

package() {
    mkdir -p "$pkgdir/usr/share/icons/"
    cp -R "$srcdir/$_pkgname/" "$pkgdir/usr/share/icons/"
}
