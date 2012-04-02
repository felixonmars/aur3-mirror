# Contributor: Ray Rashif <schivmeister@gmail.com>
# Contributor: Alexandr Grigorcea <cahr.gr@gmail.com>
# Contributor: xgdgsc <xgdgsc@gmail.com>
pkgname=nuvola-bzr-stable
pkgver=221
pkgrel=1
pkgdesc="Integrated Google Music, Grooveshark, 8tracks and Hype Machine player.Note:may require launchpad account"
arch=(i686 x86_64)
url="https://launchpad.net/nuvola-player"
license=('GPLv3')
depends=('intltool' 'gtk2' 'libwebkit' 'python2' 'libnotify' 'libx11' 'libunique' 'libgee' 'libsoup')
makedepends=('bzr' 'vala' )
provides=()
conflicts=('google-musc-frame-bzr' 'nuvola-bzr')
optdepends=('gnome-shell-extension-mediaplayer-git: Gnome Shell integration')
replaces=('google-music-frame-bzr')
options=()
source=()
md5sums=()
install=nuvola-bzr-stable.install

_bzrtrunk=lp:nuvola-player/releases-1.x
_bzrmod=nuvola-player

build() {

  msg "Connecting to the server...."
  cd ${srcdir}
  if [ -d ${_bzrmod} ] ; then
    bzr pull -d ${_bzrmod}
    msg "The local files are updated."
  else
    bzr branch ${_bzrtrunk} -r tag:1.0.4 ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${_bzrmod}-build"
  cp -r "${_bzrmod}" "${_bzrmod}-build"
  cd "${_bzrmod}-build"

  LDFLAGS="$LDFLAGS -ldl"

  python2 ./waf configure --prefix=/usr
  python2 ./waf build $MAKEFLAGS || return 1
}

package() {
  cd "${srcdir}/${_bzrmod}-build"

  python2 ./waf install --destdir="${pkgdir}"
}

