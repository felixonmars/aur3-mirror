#!/bin/sh
### Above shabeng-line just for automatic syntax higlighing in some editors.

# Maintainer: Dreieck
# Contributor: Nicky726

_pkgname=spoje
pkgname=spoje-svn
_pkgver=latest
pkgver="${_pkgver}" # As of 2013-12-24: Version 0.7.15.
pkgrel=2
pkgdesc="CLI aplication to search Czech public transport connections"
arch=('any')
url="http://code.google.com/p/spoje/"
license=('GPL')
depends=('python2')
provides=("${_pkgname}=${pkgver}")
replaces=("${_pkgname}<=${_pkgver}")
conflicts=("${_pkgname}")
source=(
        "http://spoje.googlecode.com/svn/trunk/spoje.py"
        "spoje.python2shabeng.patch"
        "spoje.changeddefaults.patch"
       )
sha256sums=(
            'SKIP' # As of 2013-11-01: '4b0f2e12b0722e54aa61441c87c473b270570d9ce05531f1c0764232d5ab7ee4'.
            "6aedf0c1733551df507f9cf529fd8203ed594237eaa70c1b068b5c3fc26f2135"
            "cb97a976d4b70d10197236f8f4235d95b47236b90fdedcaf5b67c777626b7e29"
           )

pkgver()
{
  _version="$(python2 "${srcdir}/spoje.py" --version || echo "${_pkgver}")"
  msg "Current version of '${pkgname}' is: '${_version}'." > /dev/stderr
  echo "${_version}"
}

build() {
  # It's python2 script.
  msg "Patching shabeng-line for python2-interpreter."
  patch --follow-symlinks -i "spoje.python2shabeng.patch" "spoje.py"
  
  msg "Changing some variables to other default values."
  patch --follow-symlinks -i "spoje.changeddefaults.patch" "spoje.py"
  
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
}

