# Contributor:  Massimiliano Torromeo < massimiliano DOT torromeo AT google mail service
# Maintainer:   Mariano Iglesias < mgiglesias AT gmail DOT com >

pkgname=drizzle-bzr
pkgver=993
pkgrel=1
pkgdesc="A Lightweight SQL Database for Cloud and Web."
url="https://launchpad.net/drizzle"
arch=('i686' 'x86_64')
license=('GPL')

depends=('protobuf' 'gettext')
makedepends=('bzr' 'gperf')
conflicts=('mysql')

_bzrtrunk=lp:drizzle
_bzrmod=drizzle

build() {
  cd ${srcdir}

  msg "Connecting to the server...."

  bzr branch ${_bzrtrunk} -q -r ${pkgver}
  cd ${_bzrmod}

  msg "BZR checkout done or server timeout"

  msg "Changing references to python binary..."
  sed -i 's/python/python2/g' ./config/pre_hook.sh
  sed -i 's/python/python2/g' ./config/pandora-plugin

  msg "Starting make..."

  ./config/autorun.sh
  ./configure --prefix=/usr || return 1

  # Disable adding group and user by the install rule in the makefile
  sed -i 's/^GROUPADD/#GROUPADD/' Makefile
  sed -i 's/^USERADD/#USERADD/' Makefile

  make || return 1
  make DESTDIR="$pkgdir/" install
}
# vim:syntax=sh
