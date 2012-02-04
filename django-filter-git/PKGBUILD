# Contributor: morakh
pkgname=django-filter-git
pkgver=20111201
pkgrel=1
pkgdesc="A generic system for filtering Django QuerySets based on user selections"
arch=('any')
url="https://github.com/alex/django-filter"
license=('BSD')
depends=('python' 'django')
makedepends=('git')
provides=('django-filter')
source=()
md5sums=()

_gitname="django-filter"
_gitroot="git://github.com/alex/django-filter.git"
build() {
  cd $startdir/src
  
  msg "Connecting to GIT server..."
  
  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi
  msg "GIT checkout done or server timeout"

  python setup.py install --root=$pkgdir/
}
