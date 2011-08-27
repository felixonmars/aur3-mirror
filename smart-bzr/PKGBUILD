# Contrubutor: lh <jarryson#gmail.com>

pkgname=smart-bzr
_realname=smart
pkgver=866
pkgrel=1
pkgdesc="CThe Smart Package Manager project has the ambitious objective of creating smart and portable algorithms for solving adequately the problem of managing software upgrades and installation."
arch=('i686' 'x86_64')
url="http://labix.org/smart"
license=('GPL')
depends=('python')
makedepends=('python')
source=()
provides=(smart)
conflicts=(smart)
md5sums=()

_bzrbranch=lp:smart
_bzrmod=smart

build() {
  cd ${srcdir}

  msg "Connecting to the server...."

  bzr branch ${_bzrbranch} #-q -r ${pkgver}

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build

  python setup.py build
  python setup.py install --prefix=${pkgdir}/usr
  
}

# vim:set ts=2 sw=2 et:
