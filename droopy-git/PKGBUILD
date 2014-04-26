# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Gabriel Peixoto <gabrielrcp@gmail.com>
pkgname=droopy-git
pkgver=r115.b7b0bb9
pkgrel=1
pkgdesc="A mini Web server whose sole purpose is to let others upload files to your computer"
arch=('any')
url="http://stackp.online.fr/droopy/"
license=('custom:BSD')
depends=('python2')
makedepends=('git')
provides=('droopy')
conflicts=('droopy')
source=('git+https://git.gitorious.org/droopy/droopy.git')
md5sums=('SKIP')

pkgver() {
  cd droopy
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd droopy
  sed  's,/usr/bin/env python,/usr/bin/env python2,' -i droopy
}

package() {
  cd droopy
  install -Dm 755 droopy "$pkgdir/usr/bin/droopy"
  gzip man/droopy.1
  install -Dm 755 man/droopy.1.gz "$pkgdir/usr/share/man/man1/droopy.1.gz"
}

# vim:set ts=2 sw=2 et:
