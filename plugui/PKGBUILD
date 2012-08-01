# Maintainer: Markus M. May <mmay@javafreedom.org>

pkgname=plugui
pkgver=20120801
pkgrel=1
pkgdesc="Web interface for Plug computers (running Arch Linux) - NodeJS Version"
arch=('any')
url="https://github.com/triplem/PlugUI"
license=('unknown')
depends=('nodejs')
makedepends=('git')
backup=(opt/PlugUI/config/app.yaml)
source=()
md5sums=()
_gitroot="git://github.com/triplem/PlugUI.git"
_gitname="PlugUI"
# Using newversion branch, but this is the default one, so no specific 
# stuff needed in here

build() {
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/${_gitname} ] ; then
    cd ${srcdir}/${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  if [ -d ${srcdir}/${_gitname-build} ] ; then
    cd ${srcdir}/${_gitname-build} && git pull origin
  else
    cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname-build}
  fi

  cd ${srcdir}/${_gitname-build} && git submodule init && git submodule update
}

package() {
  cd ${srcdir}/${_gitname-build}

  install -m755 -d ${pkgdir}/opt/PlugUI

  cp -rf * ${pkgdir}/opt/PlugUI

  cd ${pkgdir}/opt/PlugUI
  npm -d install   
}