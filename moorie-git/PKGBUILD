# Contributor: Patryk Połomski <cykuss@gmail.com>
pkgname=moorie-git
pkgver=latest
pkgrel=1
pkgdesc="Linux p2m client"
arch=("i686" "x86_64")
url="http://moorie.pl"
license=('LGPL')
depends=('boost' 'qt' 'mcrypt' 'openssl' 'curl' 'mhash')
makedepends=(cmake)
provides=()
conflicts=('moorie_git' 'moorie-devel' 'moorie-svn')
source=()
md5sums=()

_gitname="moorie"
_gitroot="git://github.com/cykus/${_gitname}.git"

build() {
cd ${startdir}/src
    msg "Connecting to ${_gitroot} git server...."
    if [[ -d ${startdir}/src/${_gitname} ]] ; then
        cd ${_gitname}
        git pull ${pkgver} || return 1
        msg "The local files are updated."
    else
        git clone ${_gitroot} ${pkgver} --branch master || return 1
    fi
    msg "git checkout done"
    msg "Starting make..."
  cd ${startdir}/src/${pkgver}
  CFLAGS="$SLKCFLAGS" CXXFLAGS="$SLKCFLAGS" cmake -DENABLE_GUI=ON -DCMAKE_INSTALL_PREFIX=/usr/ .
  make
  make DESTDIR=$pkgdir install
}
