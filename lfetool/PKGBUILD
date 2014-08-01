# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <aaron.l.france@gmail.com>
pkgname=lfetool
pkgver=0.0.1
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url="https://github.com/oubiwann/lfetool"
license=('Apache')
groups=()
depends=('erlang' 'lfe')
makedepends=('git' 'rebar')
provides=('lfetool')
source=('git://github.com/oubiwann/lfetool.git')
md5sums=('SKIP')
noextract=()


build() {
  cd $pkgname

  make build
  chmod +x ./lfetool
}

package() {
  cd $pkgname
  install -Dm755 lfetool "$pkgdir/usr/bin/lfetool"
}

# vim:set ts=2 sw=2 et:
