# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: acounto <acounto@kamikakushi.net>

pkgname=('recpt1-stz-git' 'pt1_drv-stz-git')
pkgver=19.49c84eb
pkgrel=1
pkgdesc="recpt1 and pt1_drv modified by stz2012."
arch=('i686' 'x86_64')
url='https://github.com/stz2012/recpt1/'
license=('unknown')
provides=('recpt1' 'pt1_drv')
depends=('libarib25' 'pcsclite')
source=("git+https://github.com/stz2012/recpt1.git"
	'code-update.diff'
	'driver-install.diff')
sha512sums=('SKIP'
            'bf7d61ce2176db98e3265462038cb6776c75e29076d4edd305849f11b82f3284305d4a447aff7a7c8c4a8c989824b55a02c654ffa50ea3889fd1998efe367c64'
            'c7979a9564e1476087f0403602f587c4029302f4fc82793e68e5d5613be3603aefadb089681abd98566ea80107d67926351eecdb14594c8d67d93ffea37b7224')
makedepends=('git')
optdepends=('pt3-drv: PT3 chardev driver')
install='recpt1.install'

pkgver() {
  cd "recpt1"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $srcdir
  patch -Np1 -i code-update.diff
  patch -Np1 -i driver-install.diff
}

build() {

  cd "$srcdir/recpt1/driver"
  make

  cd "$srcdir/recpt1/recpt1"
  chmod u+x autogen.sh
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --enable-b25 
  make

}

package_pt1_drv-stz-git() {
  cd "$srcdir/recpt1/driver"
  make DESTDIR="${pkgdir}" install
}

package_recpt1-stz-git() {
  cd "$srcdir/recpt1/recpt1"
  mkdir -p "${pkgdir}/usr/bin"
  make DESTDIR="${pkgdir}" install
}
