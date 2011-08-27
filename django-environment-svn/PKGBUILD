# Maintainer:  Gergely Imreh <imrehgATgmailDOTcom>
pkgname=django-environment-svn
pkgver=44
pkgrel=1
pkgdesc="A system to provide environment variables to django apps, SVN version."
url="http://code.google.com/p/django-environment/"
arch=('any')
license=('BSD')
makedepends=('subversion')
depends=('django')
provides=('django-environemnt')
conflicts=('django-environment')

_svntrunk=http://django-environment.googlecode.com/svn/trunk/ 
_svnmod=django-environment

build() {
  cd ${srcdir}

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting install..."

  cd ${srcdir}/${_svnmod}
  python setup.py install --root ${pkgdir} || return 1
}
