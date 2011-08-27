# Contributor: Apkawa <apkawa@gmail.com>

pkgname="django-tagging-svn"
pkgver=185
pkgrel=1
pkgdesc="A generic tagging application for Django projects"
arch=('i686' 'x86_64')
url="http://code.google.com/p/django-tagging/"
license=('MIT License')
makedepends=('svn')
depends=('python2' 'django')
provides=('')
conflicts=('django-tagging')
replaces=( 'django-tagging')

_svntrunk=http://django-tagging.googlecode.com/svn/trunk/
_svnmod=django-tagging-svn

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
