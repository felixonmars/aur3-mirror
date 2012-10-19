# Contributor: nblock <nblock [/at\] archlinux DOT us>

pkgname=rstblog-git
pkgver=20121019
pkgrel=1
pkgdesc='NIH site generator'
arch=('any')
url="https://github.com/mitsuhiko/rstblog"
license=('BSD')
depends=('python2' 'python2-yaml' 'python2-werkzeug' 'python2-blinker' 'python2-babel' 'python2-pygments' 'python2-jinja')
makedepends=('git')

_gitroot="git://github.com/mitsuhiko/rstblog.git"
_gitname="rstblog"

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

  python2 ./setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --skip-build --root=${pkgdir}/ --optimize=1
  cp -r rstblog/templates ${pkgdir}/usr/lib/python2.7/site-packages/rstblog/
} 

# vim:set ts=2 sw=2 et:
