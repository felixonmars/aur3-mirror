# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: acounto <acounto@kamikakushi.net>

pkgname=libarib25-stz-git
pkgver=6.6b47a28
pkgrel=1
pkgdesc="ARIB B25 test program for Linux modified by stz2012, based on a test program written by Kazuhiro MOGI."
arch=('i686' 'x86_64')
url="http://hg.honeyplanet.jp/pt1/"
license=('custom')
provides=('arib25' 'libarib25' 'b25' 'libb25')
conflicts=('arib25' 'libarib25' 'b25' 'libb25')
depends=('pcsclite')
source=("git+https://github.com/stz2012/libarib25.git" 'Makefile.diff' 'libarib25.install')
md5sums=('SKIP'
         '29e38ece370aecfc857914fe2b8007fc'
         '3660bc9da99885d476cc254f25462d9c')
install='libarib25.install'

pkgver() {
  cd "libarib25"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  patch -p0 -i ${srcdir}/Makefile.diff
  cd ${srcdir}/libarib25/src
  make PREFIX=/usr
}

package() {
  cd $srcdir/libarib25/src
  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/bin
  make PREFIX="${pkgdir}/usr" install
  make PREFIX="${pkgdir}/usr" install-headers
}
