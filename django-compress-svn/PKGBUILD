# Contributor: Apkawa <apkawa@gmail.com>

pkgname='django-compress-svn'
pkgver=98
pkgrel=1
pkgdesc="A Django application that automates CSS/JavaScript compression and helps in making delivery of static media more efficient"
arch=('i686' 'x86_64')
url="http://code.google.com/p/django-compress/"
license=('AS IS')
makedepends=('svn')
depends=('python2' 'django')

_svntrunk=http://django-compress.googlecode.com/svn/trunk/
_svnmod=django-compress-svn

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
