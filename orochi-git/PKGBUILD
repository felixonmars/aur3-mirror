# Maintainer: Chris van Dijk (quigybo) <quigybo at hotmail dot com>
# Contributor: Darshit Shah <darnir@gmail.com>

pkgname=orochi-git
_gitname=orochi
pkgver=85.8b11585
pkgrel=1
pkgdesc="A command line client for 8tracks.com written in Python"
arch=('any')
url="https://github.com/dbrgn/orochi"
license=('GPL3')
depends=('python2-requests' 'mplayer')
optdepends=('python2-ipdb: debug support')
makedepends=('python2-setuptools' 'git')
provides=('orochi')
conflicts=('orochi')
options=(!emptydirs)
source=('git+https://github.com/dbrgn/orochi.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  local ver="$(git describe --long 2>/dev/null)"
  if [[ -n "$ver" ]]; then
    printf '%s' "${ver//-/.}"
  else
    printf '%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

package() {
  cd "$_gitname"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
