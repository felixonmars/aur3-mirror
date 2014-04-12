pkgname=volatility-svn
_pkgbasename=Volatility
pkgver=20140411.3603
pkgrel=1
pkgdesc="Volatile memory analysis framework"
arch=(any)
url="https://www.volatilesystems.com/default/volatility"
license=('GPL')
depends=('python2' 'python2-crypto')
makedepends=(subversion)
options=(!emptydirs)
source=()
_svntrunk=http://volatility.googlecode.com/svn/trunk/
_svnmod=Volatility

pkgver () {
  cd "${srcdir}/${_svnmod}"
  _date=`date +"%Y%m%d"`
  echo "$_date.$(svn info|grep Revision|cut -d ' ' -f2)"
}

build() {
  if [ -d "${srcdir}/${_svnmod}/.svn" ]; then
    msg 'Updating...'
    svn up "${srcdir}"
  else
    msg 'Checking out...'
    svn co "${_svntrunk}" "${srcdir}/${_svnmod}"
  fi

  cd "${srcdir}"

  # Make sure we have a clean build directory
  if [ -d "${_svnmod}-build" ]; then
    rm -rf "${_svnmod}-build"
  fi

  cp -r "${_svnmod}" "${_svnmod}-build"
  
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      $(find "${_svnmod}-build" -name '*.py')
}

package() {
#  export PYTHON=python2
  cd "${srcdir}/${_svnmod}-build"

  python2 setup.py install --root="${pkgdir}/" --optimize=1

  # Cleaning up to save disk space
  cd "${srcdir}"
  rm -rf "${_svnmod}-build"
}

# vim:set ts=2 sw=2 et:
