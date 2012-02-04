# Maintainer: Dan Serban
# Contributor: zbito <ztokarczyk at gmail dot com>

pkgname=steadyflow-bzr
pkgver=latest
pkgrel=1
pkgdesc="A download manager that aims for minimalism, ease of use, and a clean, malleable codebase"
arch=(i686 x86_64)
url=https://launchpad.net/steadyflow
license=(GPLv3)
depends=(desktop-file-utils glib2 gtk2 libgee libnotify libunique)
makedepends=(bzr cmake vala)
install=steadyflow-bzr.install
conflicts=(steadyflow)

_bzrmod=steadyflow
_bzrtrunk=lp:steadyflow

build()
{
  msg "Connecting to Launchpad..."
  if [ -d ${_bzrmod} ]; then
    bzr up ${_bzrmod}
    msg2 "The local files are updated."
  else
    bzr branch ${_bzrtrunk}
  fi
  msg2 "BZR checkout done or server timeout"
  [ -d ${_bzrmod}-build ] && rm -r ${_bzrmod}-build
  cp -a ${_bzrmod} ${_bzrmod}-build
  cd ${_bzrmod}-build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCOMPILE_GSETTINGS_ON_INSTALL=NO -DWANT_AYATANA=NO
  make
  make install DESTDIR="${pkgdir}"
  mkdir -p "${pkgdir}"/usr/share/pixmaps
  wget -O "${pkgdir}"/usr/share/pixmaps/steadyflow.png https://launchpadlibrarian.net/55910801/steadyflow-64px.png
}

