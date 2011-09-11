# Maintainer: Estevao Valadao <estevao@archlinux-br.org>

pkgname=phrel
pkgver=1.0.0
pkgrel=1
pkgdesc="Per Host RatE Limiter"
arch=('i686' 'x86_64')
url="http://www.digitalgenesis.com/software/phrel/"
license=('GPL')
depends=('iptables')
makedepends=('libpcap' 'net-snmp' 'mysql')
optdepends=('ip6tables')
source=(ftp://ftp.digitalgenesis.com/pub/phrel/${pkgname}-${pkgver}.tar.gz)
sha1sums=(a659e992bef68431c2883cae36d522bcafc93e06)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
