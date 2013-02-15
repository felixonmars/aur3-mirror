# Maintainer: Josh Klar <j@iv597.com>
pkgname=python2-pyjade-git
pkgver=20130215
pkgrel=1
pkgdesc="Jade Syntax Adapter for Django, Jinja2 and Mako Templates"
arch=('any')
url="https://github.com/SyrusAkbary/pyjade"
license=('MIT')
depends=('python2')
makedepends=('python2-pip')
provides=('python2-pyjade')
conflicts=('python2-pyjade')

_gitroot="git://github.com/SyrusAkbary/pyjade"
_gitname="pyjade"

package() {
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  
  cd $_gitname
  python2 setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
