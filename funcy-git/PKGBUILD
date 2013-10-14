# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: mar77i <mysatyre@gmail.com>
pkgname=funcy-git
pkgver=0.5.6.20131014
pkgrel=1
pkgdesc="A collection of fancy functional tools focused on practicality."
arch=(any)
url="https://github.com/Suor/funcy"
license=(custom)
groups=()
depends=()
makedepends=('git')
_gitname=funcy
source=("${_gitname}::git+https://github.com/Suor/${_gitname}.git")
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir/${_gitname}"
	local ver=$(python3 setup.py -V)
	printf "%s.%s" "${ver//-/.}" "$(date +%Y%m%d)"
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname"
  python3 setup.py install --prefix=/usr --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
