# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: zhuqin <zhuqin83@gmail.com>
# Contributor: mentallaxative <beshimi@hotmail.com>

pkgname=pyroom-bzr
pkgver=213
pkgrel=1
pkgdesc='A Whiteroom clone full-screen text editor'
arch=('any')
url='http://www.pyroom.org/'
license=('GPL3')
depends=('pyxdg' 'pygtk')
optdepends=('python-gconf: use GNOME default fonts in PyRoom'
            'gettext: international support')
makedepends=('python2' 'bzr')

_bzrtrunk='http://bazaar.launchpad.net/~pyroom-dev/pyroom/trunk'
_bzrmod='pyroom'

build() {
  msg "Connecting to the server...."
  if [ -d $_bzrmod ] ; then
    cd ${_bzrmod} && bzr --no-plugins pull ${_bzrtrunk} -r ${pkgver}
    msg "The local files are updated."
  else
    bzr --no-plugins branch ${_bzrtrunk} ${_bzrmod} -q -r ${pkgver}
  fi
  msg "BZR checkout done or server timeout"
  msg "Starting setup.py ..."

  cd $_bzrmod

  python2 setup.py build

  python2 setup.py install --root="$pkgdir" --prefix=/usr
}
