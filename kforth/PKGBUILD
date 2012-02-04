# vim:set ts=2 sw=2 et:
# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net> awagner on irc.freenode.net
pkgname=kforth
pkgver=1.5.2
pkgrel=1
epoch=
pkgdesc='kForth is an implementation of the Forth programming language and environment'
arch=('i686' 'x86_64')
url="http://ccreweb.org/software/kforth/"
license=('LGPL')
groups=()
depends=('patchutils')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(ftp://ccreweb.org/software/kforth/linux/${pkgname}-x86-linux-${pkgver}.tar.gz)
noextract=()

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}/{etc/profile.d,usr/{bin,share/kforth}}
  mv kforth kforth-fast ${pkgdir}/usr/bin/
  mv examples/{system-test,fsl,games,libs,benchmarks} ${pkgdir}/usr/share/kforth
  export KFORTH_DIR=/usr/share/kforth
  echo 'KFORTH_DIR=/usr/share/kforth' > ${pkgdir}/etc/profile.d/kforth.sh
}

md5sums=('8def6b906289fc2f2b404a7be8e8d9ce')
