#Maintainer: Aeternus Atterratio <atterratio@gmail.com>

pkgname=django-inline-ordering-git
pkgver=20121021
pkgrel=2
pkgdesc="Django app to ease ordering of related data - enable Drag&Drop ordering in admin with just a few LOC"
arch=('any')
url="https://github.com/centralniak/django-inline-ordering"
license=('custom')
depends=('python2' 'django')
makedepends=('git' 'python2-distribute')

_gitroot="https://github.com/centralniak/django-inline-ordering.git"
_gitname="django-inline-ordering"

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

}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1
}
