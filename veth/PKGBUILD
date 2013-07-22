# Maintainer: alister.hood <gmail>
# Submitter: Schnouki <thomas.jost@gmail.com>
pkgname=veth
pkgver=1.0
pkgrel=4
pkgdesc="A daemon that sets up a virtual Ethernet card in Linux"
arch=('i686' 'x86_64')
url="http://www.geocities.ws/nestorjpg/veth/index.html"
license=('GPL')
source=(http://www.geocities.ws/nestorjpg/veth/veth-1.0.tar.gz
        vethd.conf
        vethd.rc)
md5sums=('11536388d9c76552a4b736638a458361'
         '22f3ef554311d3d098f54336906a0d2c'
         'd7c1553f1c11fea41cce7f0669734be2')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  make
}

package() {
  cd $srcdir
  install -Dm 755 ${pkgname}-${pkgver}/veth/vethd $pkgdir/usr/bin/vethd
  install -Dm 755 vethd.rc $pkgdir/etc/rc.d/vethd
  install -Dm 644 vethd.conf $pkgdir/etc/conf.d/vethd
}

