# Contributor: Wido <widomaker2k7@gmail.com>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=tuxtremsplit-bzr
pkgver=61
pkgrel=1
pkgdesc=" Linux client of Xtremsplit application (bzr version)"
arch=('any')
url=(https://launchpad.net/tuxtremsplit)
license=('GPL')
depends=('xdg-utils' 'pygtk' 'pygobject' 'python2')
makedepends=('bzr' 'python2')
optdepends=()
conflicts=('tuxtremsplit')
install=tuxtremsplit.install
provides=('tuxtremsplit')
groups=()
md5sums=()

_bzrtrunk="lp:tuxtremsplit"
_bzrmod="trunk"

build() {
    cd ${srcdir}
  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
  else
    bzr up ${_bzrmod}
  fi

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build
  # Compile
  #python2 setup.py --without-icon-cache \
  #                --without-mime-database \
  #                --without-desktop-database \
  #                --without-nautilus-extension \
  #                install --root=${pkgdir}
  python2 setup.py \
                  install --root=${pkgdir}
  # Patch
  #rm ${pkgdir}/usr/bin/tuxtremsplit
  #ln -s /usr/bin/txs.py ${pkgdir}/usr/bin/tuxtremsplit
}
