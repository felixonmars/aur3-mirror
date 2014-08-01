# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <aaron.l.france@gmail.com>
pkgname=lfe
pkgver=0.0.1
pkgrel=1
pkgdesc="Lisp Flavoured Erlang!"
arch=('i686' 'x86_64')
url="https://github.com/rvirding/lfe"
license=('Apache')
depends=('erlang')
makedepends=('git' 'erlang')
provides=('lfe')
source=('git://github.com/AeroNotix/lfe.git')
md5sums=('SKIP')
install='msg.install'

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  PREFIX=${pkgdir} ERL_LIBS=`erl -noshell -eval 'io:format(code:lib_dir()), init:stop()'` make install
}

# vim:set ts=2 sw=2 et:
