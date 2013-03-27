# Maintainer: janhouse <janis.jansons@janhouse.lv>

pkgname=python2-wpaspy-git
pkgver=20130327
pkgrel=1
pkgdesc="Python2 bindings for wpa_ctrl (wpa_supplicant/hostapd control interface)."
url="http://w1.fi/hostapd/"
arch=('any')
license=("BSD")
depends=("python2")
conflicts=("python2-wpaspy")
replaces=("python2-wpaspy")

_gitroot="git://w1.fi/srv/git/hostap.git"
_gitname="hostap"

build() {

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $_gitname/wpaspy

  python2 setup.py build
}

package() {
  cd "${srcdir}/$_gitname/wpaspy"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
