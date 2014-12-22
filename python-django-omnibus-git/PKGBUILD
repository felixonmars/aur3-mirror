# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="python-django-omnibus-git"
pkgver="20141220"
pkgrel="3"
pkgdesc="A Django library which helps to create websocket-based connections between a browser and a server to deliver messages."
arch=("any")
url="https://github.com/moccu/django-omnibus/"
license=("BSD")
depends=("python" "python-tornado" "python-pyzmq")
makedepends=("git")
provides=("python-django-omnibus")
conflicts=("python-django-omnibus")
options=("!emptydirs")

_gitroot="https://github.com/moccu/django-omnibus.git"
_gitname="django-omnibus"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
  else
    git clone "$_gitroot" "$_gitname"
  fi

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  /usr/bin/python3 setup.py install --root="$pkgdir/" --optimize=1
}
