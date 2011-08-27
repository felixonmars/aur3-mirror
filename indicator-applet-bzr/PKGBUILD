# Maintainer: Michal Gawronski <dinth1906@gmail.com>
# Old maintainer: Paul Burton <paulburton89@gmail.com>
# Contributor: max.bra <max.bra at alice dot it>
# Contributor: nuovodna <nuovodna_at_gmail.com>

pkgname=indicator-applet-bzr
pkgver=391
pkgbranch=0.4
pkgrel=1
pkgdesc="A small applet to display information from various applications consistently in the panel. (Canonical Ayatana Project)"
arch=('i686' 'x86_64')
url="http://launchpad.net/indicator-applet"
license=('GPL')
depends=('gconf' 'gnome-panel' 'indicator-messages-bzr' 'indicator-session-bzr')
makedepends=('bzr')
optdepends=('indicator-sound-bzr' 'indicator-network-bzr' 'indicator-datetime-bzr' 'battery-status-bzr')
provides=('indicator-applet')
conflicts=('indicator-applet')
#install=$pkgname.install
#source=(original-user-switch-survive.patch)
#md5sums=('cd89d62dccd65fa11590994ba73154f2')


_bzrbranch=lp:indicator-applet
_bzrmod=indicator-applet

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

#  patch -Np1 -i "${srcdir}"/original-user-switch-survive.patch || return 1

  ./autogen.sh || return 1
  ./configure --prefix=/usr --with-gconf-schema-file-dir=/usr/share/gconf/schemas --disable-static || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

}
