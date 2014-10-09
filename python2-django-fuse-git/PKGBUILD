# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="python2-django-fuse-git"
pkgver="20090322"
pkgrel="1"
pkgdesc="Django application for making FUSE filesystems."
arch=("i686" "x86_64")
url="https://chris-lamb.co.uk/projects/django-fuse"
license=("GPL3")
depends=("python2" "python2-django")

_gitroot="git://github.com/lamby/django-fuse"
_gitname="django-fuse"


build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
  else
    git clone "$_gitroot" "$_gitname"
  fi
}

package() {
  cd "$srcdir/$_gitname"
  /usr/bin/python2 setup.py install --root="$pkgdir/" --optimize=1
}
