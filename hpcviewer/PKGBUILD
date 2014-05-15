# PKGBUILD template to install hpcviewer
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>
pkgname=hpcviewer
pkgver=5.3.2
pkgrel=1
pkgdesc="To visualize results of HPCToolkit an integrated suite of tools for measurement and analysis of program performance."
depends=('java-environment' 'bash')
arch=('x86_64')
license=('BSD')
url="http://hpctoolkit.org"
source=('http://hpctoolkit.org/download/hpcviewer/hpcviewer-5.3.2-r1754-linux.gtk.x86_64.tgz')
sha1sums=('d3a2a5810281ff440a50dd9ccc41c7fc9c40b384')
install=

package() {
    #Install hpctoolskit
    cd "$srcdir/hpcviewer/"
    ./install ${pkgdir}/usr/
}



