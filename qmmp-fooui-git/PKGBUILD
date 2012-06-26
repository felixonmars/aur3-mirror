# Contributor: core <angrycore@gmail.com>
# Maintainer: mengjiao <mengjiao.lu@gmail.com>
pkgname=qmmp-fooui-git
pkgver=20120626
pkgrel=1
pkgdesc="Foobar-like interface for qmmp. Git version."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://gitorious.org/qmmp-fooui"
depends=('qmmp')
makedepends=('git') 
install=qmmp-fooui.install
source=('qmmp-fooui.desktop'
        'include_unistd_h.patch')
md5sums=('620d7c274d116ef15f805bd841492413'
         '35a9e7c69034c7d8d37d02f22b8989d2')

_gitroot="git://gitorious.org/qmmp-fooui/qmmp-fooui.git"
_gitname="qmmp-foou"

build() {
  cd ${srcdir}
  if [[ -d $_gitname ]]; then
    cd $_gitname
    git pull || return 1
  else
    git clone $_gitroot $_gitname  && cd $_gitname || return 1
  fi

  cd ${srcdir}
  patch -Np1 -i include_unistd_h.patch
#  rm -r $_gitname-build 
  cp -r $_gitname $_gitname-build 
  cd $_gitname-build

  msg "Starting make..."
  qmake qmmp_fooui.pro
  make
  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/$_gitname-build/qmmp-fooui ${pkgdir}/usr/bin/qmmp-fooui
  mkdir -p ${pkgdir}/usr/share/applications/
  cp ${srcdir}/qmmp-fooui.desktop ${pkgdir}/usr/share/applications/
}
