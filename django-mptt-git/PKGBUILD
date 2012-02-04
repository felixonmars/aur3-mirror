# Contributor: Apkawa <apkawa@gmail.com>
pkgname=django-mptt-git
pkgver=20101024
pkgrel=1
pkgdesc="Utilities for implementing Modified Preorder Tree Traversal"
arch=('any')
url="http://code.google.com/p/django-mptt/"
license=('BSD')
depends=('python2' 'django')
makedepends=('git')
provides=('django-mptt')
conflicts=('django-mptt')
replaces=('django-mptt')

_gitroot="http://github.com/django-mptt/django-mptt.git"
_gitname="django-mptt"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir || return 1
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE


} 
