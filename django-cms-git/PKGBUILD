#Maintainer: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=django-cms-git
pkgver=20101106
pkgrel=1
pkgdesc="CMS framework based on Django - GIT Version"
arch=('any')
url="http://www.django-cms.org/"
license=('GPL')
depends=('python2')
makedepends=('git')

_gitroot="https://github.com/divio/django-cms.git"
_gitname="django-cms"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"


    cd $srcdir/$_gitname
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir --install-data=/usr/share/$pkgname || return 1
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE  
  
} 
