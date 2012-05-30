# Mantainer: The Lemon Man <thatlemon at gmail.com>

pkgname=pogo-bzr
pkgver=512
pkgrel=1
pkgdesc="Probably the simplest and fastest audio player for Linux"
arch=('any')
url="https://launchpad.net/pogo/"
license=('GPL')
depends=('pygtk' 'dbus-python' 'mutagen' 'python-imaging'
         'gstreamer0.10-python' 'desktop-file-utils')
optdepends=('python-notify: notifications support'
            'gnome-setting-daemon: gnome media keys')
makedepends=('bzr')
provides=('pogo')
conflicts=('pogo')
install="$pkgname.install"

_bzrtrunk=lp:pogo
_bzrmod=pogo

package() {
  msg "Connecting to Launchpad..."
  if [ -d ${_bzrmod} ]; then
    bzr up ${_bzrmod}
    msg2 "The local files have been updated"
  else
    bzr co ${_bzrtrunk} ${_bzrmod}
  fi
  msg2 "BZR checkout done or server timeout"
  [ -d ${_bzrmod}-build ] && rm -rf ${_bzrmod}-build
  cp -a ${_bzrmod} ${_bzrmod}-build
  cd ${_bzrmod}-build

  make DESTDIR="$pkgdir/" install

  # python2 fix
  sed -i "s/python/&2/" "$pkgdir/usr/bin/pogo"
}

# vim:set ts=2 sw=2 et:
