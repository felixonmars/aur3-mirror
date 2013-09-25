# Maintainer: Chris van Dijk (quigybo) <quigybo at hotmail dot com>

pkgname=python2-pypgf-git
_pkgname=python2-pypgf
_gitname=pypgf
pkgver=79.f907c2f
pkgrel=1
pkgdesc="A Python interface for PGFPlots"
arch=('any')
url="https://github.com/lucastheis/pypgf"
license=('MIT')
depends=('python2-numpy' 'python-imaging'
         'texlive-core' 'texlive-pictures')
makedepends=('python2-setuptools' 'git')
provides=('python2-pypgf')
conflicts=('python2-pypgf')
source=('git+https://github.com/lucastheis/pypgf.git'
        'COPYING')
sha256sums=('SKIP'
            '7026ebc9d15cabaa79dbc04d611a9f2a9860c8d933ff5e0a03ea10b81e589d40')

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
  install -Dm644 "$srcdir"/COPYING "$pkgdir/usr/share/licenses/$_pkgname"
}
