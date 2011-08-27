# Contributor: Apkawa <apkawa@gmail.com>

pkgname="django-treemenus-svn"
 
pkgver=48
pkgrel=3
pkgdesc="Generic tree-structured menuing system for Django"
arch=('i686' 'x86_64')
url="http://code.google.com/p/django-treemenus/"
license=('New BSD License')
makedepends=('svn')
depends=('python' 'django')
provides=('')
conflicts=('')
replaces=('')
source=( )
md5sums=( )

_svntrunk=http://django-treemenus.googlecode.com/svn/trunk/
_svnmod=django-treemenus-svn

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  cd $_svnmod
  python setup.py install --root=$startdir/pkg


}
