# Maintainer: leprechau <ahurt@anbcs.com>
# Contributer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org> 
# Contributor: kleptophobiac@gmail.com

pkgname=myththemes-0-23-fixes-svn
pkgver=24661
pkgrel=1
pkgdesc="Themes for MythTV"
arch=('i686' 'x86_64')
url="http://www.mythtv.org/"
license=('GPL')
depends=('mythtv-0-23-fixes-svn')
makedpends=('subversion')
replaces=('myththemes')
conflicts=('myththemes')
provides=('myththemes')
source=()
md5sums=()

_svntrunk=http://svn.mythtv.org/svn/branches/release-0-23-fixes/myththemes
_svnmod=${pkgname}

build() {
  cd "${srcdir}"

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up)
  else
    svn co ${_svntrunk} --config-dir ./ ${_svnmod}
  fi

  msg "SVN checkout complete or server timeout"
  msg "Starting configure and make..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  ./configure --prefix=/usr 
  # basic install
  make INSTALL_ROOT="${pkgdir}" install || return 1
}
