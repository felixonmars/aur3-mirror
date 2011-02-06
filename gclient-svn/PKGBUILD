# Maintainer:  Gergely Imreh <imrehgATgmailDOTcom>
# Contributor:  Gergely Imreh <imrehgATgmailDOTcom>
pkgname=gclient-svn
pkgver=72
pkgrel=2
pkgdesc="Script to manage checkouts and updates for a set of client modules in various SCM repository locations."
url="http://code.google.com/p/gclient/"
arch=('i686' 'x86_64')
license=('APACHE')
makedepends=('subversion' 'autoconf')
depends=('python2' 'python-pymox')
provides=('gclient')
_svntrunk=http://gclient.googlecode.com/svn/trunk/gclient
_svnmod=gclient

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting install..."

  install -D -m755 "${_svnmod}/gclient.py" "${pkgdir}/usr/bin/gclient.py" || return 1
  ln -s gclient.py ${pkgdir}/usr/bin/gclient || return 1
}
