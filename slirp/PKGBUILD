# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: Giovanni Scafora <linuxmania at gmail dot com>

pkgname=slirp
pkgver=1.0.16
pkgrel=4
pkgdesc="Emulates a PPP or SLIP connection over a terminal"
arch=('i686' 'x86_64')
url="http://slirp.sourceforge.net"
license=('GPL')
depends=('glibc')
makedepends=('ppp')
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz
        fix17.patch)
md5sums=('b712f2fe58aaf87172cfd31c95fc1e31'
         '8a7760e5d8a3c899a70d1bcadebf9f01')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}/src
  #patch -Np0 -i ../../fix17.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}/src
  install -D -m755 slirp "${pkgdir}"/usr/bin/slirp
  install -D -m644 slirp.man "${pkgdir}"/usr/share/man/man1/slirp.1
}
