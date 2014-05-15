# PKGBUILD template to install hpctraceviewer
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>
pkgname=hpctraceviewer
pkgver=5.3.2
pkgrel=1
pkgdesc="To visualize trace results of HPCToolkit an integrated suite of tools for measurement and analysis of program performance."
depends=('java-environment' 'bash')
arch=('x86_64')
license=('BSD')
url="http://hpctoolkit.org"
source=('http://hpctoolkit.org/download/hpcviewer/hpctraceviewer-5.3.2-r1754-linux.gtk.x86_64.tgz')
sha1sums=('db7e2f9c31c1454b10289b37e54187147792b2a1')
install=

package() {
    #Install hpctoolskit
    cd "$srcdir/hpctraceviewer/"
    ./install ${pkgdir}/usr/
}



