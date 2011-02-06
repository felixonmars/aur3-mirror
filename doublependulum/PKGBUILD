# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Renan Birck <renan.ee.ufsm@gmail.com>
pkgname=doublependulum
pkgver=0.2
pkgrel=1
pkgdesc="A simulation of a chaotic pendulum."
arch=('i686' 'x86_64')
url="http://freddie.witherden.org/tools/doublependulum/#bugs"
license=('GPL')
groups=()
depends=('qt' 'freetype2')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://freddie.witherden.org/tools/doublependulum/releases/$pkgname-$pkgver-src.tar.gz)
noextract=()
md5sums=('fd8def977fdb2a20740ce9ec2b67f9a4')

build() {
  cd "$srcdir/$pkgname-$pkgver" 
  qmake || return 1
  make || return 1
  echo "SRCDIR is " $srcdir
  
  
  install -D -m755 ${srcdir}/${pkgname}-${pkgver}/doublependulum ${pkgdir}/usr/bin/doublependulum
}

# vim:set ts=2 sw=2 et:
