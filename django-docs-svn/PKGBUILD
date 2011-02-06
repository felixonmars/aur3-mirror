# Contributor: Apkawa <apkawa@gmail.com>

pkgname=django-docs-svn
pkgver=11863
pkgrel=1
pkgdesc="Docs for Django's SVN release"
arch=('i686' 'x86_64')
url="http://docs.djangoproject.com/en/dev/"
license=('GPL')
makedepends=('python-sphinx')

_svntrunk='http://code.djangoproject.com/svn/django/trunk/docs/'
_svnmod=${pkgname}

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  make html
  mkdir ${pkgdir}/usr/share/doc/ -p
  mv _build/html ${pkgdir}/usr/share/doc/django-svn

}
