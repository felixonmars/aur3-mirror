# Maintainer: Philipp Millar <poxar[at]gmx[dot]net>
pkgname=rawk-git
pkgver=8d22a44
pkgrel=1
epoch=1
pkgdesc="A static site generator written in bourne shell."
url="http://rawk.brokenlcd.net"
arch=('any')
license=('ISC')
depends=('bash')
makedepends=('git')
provides=('rawk')
conflicts=('rawk')
optdepends=('smu: for markdown parsing'
            'markdown: for markdown parsing')

source=('git://github.com/kisom/rawk.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/rawk"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd ${srcdir}/rawk

  PREFIX="${pkgdir}/usr" MANDIR="${pkgdir}/usr/share/man" ./config.sh

  sed -i -e 's|/usr/local|/usr|' rawk.1
  sed -i -e 's|/usr/local|/usr|' rawkrc.5
}  

package() {
  cd ${srcdir}/rawk

  mkdir -p ${pkgdir}/usr/bin
  make install

  # MANDIR is not honored by config.sh so move it in place manually
  mv ${pkgdir}/usr/man ${pkgdir}/usr/share/man

  mkdir -p ${pkgdir}/usr/share/licenses/rawk
  cp license.txt ${pkgdir}/usr/share/licenses/rawk/license.txt
}

# vim:set ts=2 sw=2 et:
