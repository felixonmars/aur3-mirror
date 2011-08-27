# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>

pkgname=vboxgtk-svn
_pkgname=vboxgtk
pkgver=38
pkgrel=6
pkgdesc="A simple GTK frontend for VirtualBox OSE"
arch=('i686' 'x86_64')
url="http://vboxgtk.sourceforge.net/"
license=('GPL3')
depends=('pygtk>=2.14' 'virtualbox>=4.1.0' 'virtualbox-sdk>=4.1.0')
makedepends=('subversion' 'intltool')
provides=('vboxgtk')
conflicts=('vboxgtk')
install=vboxgtk.install
source=(fixes.patch)
md5sums=('fd6d68197584bb63b415651c811f74f5')

_svntrunk=https://${_pkgname}.svn.sourceforge.net/svnroot/${_pkgname}/trunk
_svnmod=${_pkgname}

build() {
  cd ${srcdir}

  msg "Updating from SVN"
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up)
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi
  msg "SVN checkout done."

  msg "Building..."
  rm -rf ./${_svnmod}-build
  svn export ./${_svnmod} ./${_svnmod}-build
  cd ./${_svnmod}-build

  patch -Np1 -i ../fixes.patch
}  

package() {
  cd ${srcdir}/${_svnmod}-build

  python2 setup.py install --root=${pkgdir}
}
