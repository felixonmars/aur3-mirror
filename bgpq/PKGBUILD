# Contributor: Oleg Alekseenko <al_oleg [at] bk.ru>

pkgname=bgpq
pkgver=1.0.9.7
pkgrel=1
pkgdesc="The program for access- and prefix-list generation (for Cisco routers and GateD network filters)"
arch=('i686' 'x86_64')
url="http://www.lexa.ru/snar/bgpq.html"
license=('bgpq')
depends=('flex') 
source=(ftp://ftp.lexa.ru/pub/domestic/snar/bgpq-${pkgver}.tgz)
md5sums=('a1c8c3ef463fd658bf0462f68a90410b')

build() {
  cd bgpq-${pkgver}

  ./configure --prefix=/usr || return 1

  make  || return 1
  
  make install || return 1

}
