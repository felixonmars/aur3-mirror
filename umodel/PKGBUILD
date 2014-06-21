# Maintainer: Shaun Westmacott <xyem@electricjungle.org>

pkgname=umodel
pkgver=20140616
pkgrel=1
pkgdesc='Unreal engine resource viewer AKA UE Viewer'
arch=('i686' 'x86_64')
url='http://www.gildor.org/en/projects/umodel'
license=('unknown')
source=("http://www.gildor.org/down/38/${pkgname}/${pkgname}_linux.tar.gz")
md5sums=('bcafdef3d76a5f68dc977153c1e40ff2')

package() {
    cd "$srcdir"

    install -d -m755 "${pkgdir}/usr/bin"
    install -m755 umodel "${pkgdir}/usr/bin/"
}
