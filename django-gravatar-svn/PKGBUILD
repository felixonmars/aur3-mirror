# Contributor: Samed Beyribey <ras0ir@eventualis.org>
pkgname=django-gravatar-svn
pkgver=13
pkgrel=1
pkgdesc="A template tag that makes it easy to add gravatar support to your Django application"
arch=(any)
url="http://code.google.com/p/django-gravatar/"
license=('BSD')
depends=('django')
makedepends=('subversion')
provides=('django-gravatar')
conflicts=('django-gravatar')

_svntrunk=http://django-gravatar.googlecode.com/svn/trunk/
_svnmod=django-gravatar-read-only

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  python setup.py install --root=$pkgdir
  install -D $srcdir/$_svnmod-build/LICENSE.txt $pkgdir/usr/share/licenses/django-gravatar/LICENSE.txt
}
