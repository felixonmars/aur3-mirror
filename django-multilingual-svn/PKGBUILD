# Contributor: Apkawa <apkawa@gmail.com>

pkgname=django-multilingual-svn
pkgver=187
pkgrel=1
pkgdesc="Multilingual extension for Django"
arch=('i686' 'x86_64')
url="http://code.google.com/p/django-multilingual/"
license=('MIT')
makedepends=('')
depends=('python2')
provides=('')
conflicts=('')
replaces=( '')

_svntrunk='http://django-multilingual.googlecode.com/svn/trunk/'
_svnmod=${pkgname}

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  cd $_svnmod

    python2 setup.py install --root=$startdir/pkg

}
