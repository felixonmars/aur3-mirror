# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-gitgitlab
pkgname=gitgitlab-git
_pkgname=gitgitlab
pkgver=r22.94ca664
pkgrel=1
pkgdesc='GitGitLab: Gitlab Git Plugin'
arch=('any')
url='https://gitgitlab.readthedocs.org'
license=('UNKNOWN')
depends=('python')
options=(!emptydirs)
source=("git+https://github.com/grimborg/gitgitlab")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
