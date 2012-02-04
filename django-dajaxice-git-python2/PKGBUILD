# Contributor: Mathieu Pasquet <mathieui@mathieui.net>
# Maintainer: Mathieu Pasquet <mathieui@mathieui.net>

pkgname=django-dajaxice-git-python2
pkgver=20101108
pkgrel=1
pkgdesc="Dajax is a powerfull tool to easily and super-fastly develop asynchronous presentation logic in web applications using python and almost no lines of JS source code."
arch=("any")
url="http://dajaxproject.com"
license=('GPL')
depends=('python2')
makedepends=('git')

_gitroot="https://github.com/jorgebastida/django-dajaxice.git"
_gitname="dajaxice"

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

  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir/"
}
