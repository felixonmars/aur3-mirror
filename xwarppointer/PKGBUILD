# Contributor: Rick Rein <jeebusroxors@gmail.com>
# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>


pkgname=xwarppointer
pkgver=1
pkgrel=2
pkgdesc="CLI utility to move mouse cursor"
arch=('i686' 'x86_64')
url="http://www.ishiboo.com/~nirva/Projects/xwarppointer"
license=('unknown')
depends=('libx11')
source=("http://ishiboo.com/~danny/Projects/xwarppointer/${pkgname}.tar.gz")
md5sums=('49b576f66a6c0eaa47b51fbe33ed493c')


build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  # main file
  install -D -m755 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  #readme
  install -D -m644 "${srcdir}/${pkgname}/README" "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set ts=2 sw=2 et:
