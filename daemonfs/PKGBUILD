 
# Contributor: said <atvordhosbn at gmail dot com> 

pkgname=daemonfs
pkgver=1.1
pkgrel=1
pkgdesc="A realtime file monitor."
arch=('i686' 'x86_64')
url="http://giowisys.com/giowisys/DaemonFS.html"
license=('GPL')
depends=('qt')
source=(http://launchpad.net/deamonfs/stable/${pkgver}/+download/DaemonFS_${pkgver}_src.tar.bz2)
md5sums=('8053fcff43fa5a3b2b0db8e622c184af')

build() {
    cd  $srcdir/DaemonFS
    qmake
    make || return 1
    install -Dm755 DaemonFS $pkgdir/usr/bin/$pkgname 
}
