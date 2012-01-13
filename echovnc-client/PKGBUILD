#Contributor: Paul Nicholson <brenix@gmail.com>
pkgname=echovnc-client
pkgver=1.1.2
pkgrel=2
pkgdesc="EchoVNC Client for EchoWare remote support system. Works with echovnc-server package"
arch=('i686' 'x86_64')
url="http://www.echogent.com/"
license=('sleepycat')
depends=('vnc' 'rdesktop')
optdepends=('echovnc-server: for relaying VNC connections')
source=('http://dl.sourceforge.net/echovnc/echovnc_1.1-2_amd64.deb'
        'http://dl.sourceforge.net/echovnc/echovnc_1.1-2_i686.deb')

build() {
    cd ${srcdir}
    if [ "$CARCH" = "x86_64" ]; then
      ar x echovnc_1.1-2_amd64.deb
      tar xvzf data.tar.gz
    else
      ar x echovnc_1.1-2_i686.deb
      tar xvzf data.tar.gz
    fi
    cp -a ${srcdir}/usr $pkgdir/usr || return 1
}
md5sums=('811ad502a7eaadf585a7555643857de9'
         '45b54b3c1e87e4d0e22d0892b0094933')
