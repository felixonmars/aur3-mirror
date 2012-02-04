# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=tiger-cvs
_pkgname=tiger
pkgver=20100203
pkgrel=1
pkgdesc="The Unix security audit and intrusion detection tool"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/tiger/"
license=('GPL')
depends=('perl')
makedepends=('cvs')
provides=('tiger')
conflicts=('tiger')
backup=('usr/share/tiger/config' 'etc/tiger/tigerrc' 'etc/tiger/cronrc')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@cvs.sv.gnu.org:/sources/tiger"
build() {
  cd ${srcdir}
  cvs -d ${_cvsroot} co -D ${pkgver} .

  install -d ${pkgdir}/usr/share/${_pkgname} ${pkgdir}/usr/sbin

  cd ${srcdir}/${_pkgname}
  ./configure \
    --prefix=/usr \
    --with-tigerhome=/usr/share/${_pkgname} \
    --with-tigerwork=/var/run/${_pkgname} \
    --with-tigerlog=/var/log/${_pkgname} \
    --with-tigerconfig=/etc/${_pkgname}

  make TMPDIR=/tmp/ || return 1
  make DESTDIR=${pkgdir} install
}
