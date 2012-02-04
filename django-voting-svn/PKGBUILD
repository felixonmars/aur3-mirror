# Maintainer: Laszlo Papp <djszapi at archlinux us>

pkgname=django-voting-svn
pkgver=73
pkgrel=1
pkgdesc="A generic voting application for Django projects"
arch=('i686' 'x86_64')
url="http://code.google.com/p/django-voting/"
license=('GPL')
depends=('python')

_svntrunk='http://django-voting.googlecode.com/svn/trunk/'
_svnmod=${pkgname}

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  cd $_svnmod

    python setup.py install --root=$pkgdir

}

