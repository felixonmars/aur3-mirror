# Maintainer: Jakob Nixdorf <flocke@user-helfen-usern.de>

pkgname=decibel-audio-player-bzr
pkgver=180
pkgrel=1
pkgdesc="Decibel audio player for GNOME desktop"
url="http://decibel.silent-blade.org"
arch=(i686 x86_64)
license=(GPL)
depends=('python' 'gstreamer0.10-python' 'python-notify' 'pygtk' 'dbus-python' 'mutagen')
makedepends=('bzr')
provides=('decibel-audio-player')
conflicts=('decibel-audio-player')
source=(http://decibel.silent-blade.org/uploads/Main/decibel-audio-player-1.08.tar.gz)
md5sums=(e8ebaf819c198ff9951903e7c4056aef)

_bzrtrunk=lp:decibel-audio-player
_bzrmod=decibel

build() {

  cd ${srcdir}
  
  msg "Connecting to the server...."
  
  if [ -d "${_bzrmod}" ]; then
  msg "Found local source repository, attempting update to latest revision."
  bzr update ${_bzrmod}
  else
  msg "Unable to find local source repository; checking out latest revision."
  bzr branch ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
  fi
  
  msg "BZR checkout done or server timeout"
  msg "Starting make..."
  
  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build

  cd ./${_bzrmod}-build

  make prefix=/usr DESTDIR=${pkgdir} install || return 1

}
