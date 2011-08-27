# Maintainer: Michal Gawronski <dinth1906@gmail.com>
# Old maintainer: Paul Burton <paulburton89@gmail.com>
# Contributor: max.bra <max.bra at alice dot it>

pkgname=indicator-session-bzr
pkgbranch=0.2
pkgver=146
pkgrel=1
pkgdesc="Quick! Change your status. Switch users. Close your session. All provided by the The Session Menu these tasks are conviniently placed in the upper-right corner of the desktop to make them available and easy to use. (Canonical Ayatana Project)"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-session"
license=('GPL')
depends=('gconf' 'libdbusmenu' 'gtk2')
makedepends=('libindicator' 'bzr')
provides=('indicator-session')
conflicts=('indicator-session')
install=$pkgname.install
source=()
md5sums=()


_bzrbranch=lp:indicator-session
_bzrmod=indicator-session

build() {
   cd ${srcdir}

  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrbranch} ${_bzrmod}
  else
    bzr up ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build

  ./autogen.sh || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib --disable-static --disable-schemas-install --with-gconf-schema-file-dir=/usr/share/gconf/schemas || return 1
  find . -name Makefile -exec sed -i 's/-Wall -Werror//g' {} \;
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
