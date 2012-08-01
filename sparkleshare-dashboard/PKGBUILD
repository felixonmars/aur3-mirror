# Maintainer: Markus M. May <mmay@javafreedom.org>

pkgname=sparkleshare-dashboard
pkgver=20120801
pkgrel=1
pkgdesc="SparkleShare Dashboard"
arch=('any')
url="https://github.com/hbons/SparkleShare-Dashboard"
license=('AGPL3')
depends=('git' 'nodejs')
makedepends=('git')
backup=(opt/sparkelshare-dashboard/config.js)
install=sparkleshare-dashboard.install
source=()
md5sums=()
_gitroot="git://github.com/triplem/SparkleShare-Dashboard.git"
_gitname="SparkleShare-Dashboard"

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

  install -m755 -d ${pkgdir}/usr/share/licenses/sparkleshare-dashboard
  install -m755 -d ${pkgdir}/opt/sparkleshare-dashboard

  cp LICENSE ${pkgdir}/usr/share/licenses/sparkleshare-dashboard
  cp -rf * ${pkgdir}/opt/sparkleshare-dashboard

  cd ${pkgdir}/opt/sparkleshare-dashboard
  npm -d install   
}