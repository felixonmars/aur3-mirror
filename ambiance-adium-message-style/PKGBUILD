# Original uploader: franksouza18 3 <franksouza183@gmail.com>
# Maintainer: weyll <weyll@weyll.com>

pkgname=ambiance-adium-message-style
pkgver=12
pkgrel=1
pkgdesc="Ambiance Adium Message Style"
arch=('any')
url="http://gnome-look.org/content/show.php?content=146855"
license=('GPL')
depends=('empathy')
makedepends=('bzr' 'python-distutils-extra')
provides=('ambiance-adium-message-style')
conflicts=('ambiance-adium-message-style')
source=()
md5sums=()

_bzrbranch=lp:ambiance-adium-message-style
_bzrmod=ambiance-adium-message-style

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

  python2 ./setup.py build
  python2 ./setup.py install --prefix=/usr --root=$pkgdir
}
