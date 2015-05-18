# Maintainer: Nico Di Rocco <dirocco.nico@gmail.com>

pkgname=xprofile-git
pkgver=46a0da5
pkgrel=1
pkgdesc="A tool to manage and automatically apply xrandr configurations."
arch=('any')
url="https://github.com/nrocco/xprofile"
license=('GPL')
depends=('python' 'xorg-xrandr')
makedepends=('python-setuptools' 'git')
provides=('xprofile')
conflicts=('xprofile')
source=("git+https://github.com/nrocco/xprofile.git")
md5sums=('SKIP')
_gitname='xprofile'

pkgver() {
  cd "$srcdir/$_gitname"
  git rev-parse --short HEAD
}

build() {
  cd "$srcdir/$_gitname"
  local version="$(python3 setup.py --version)"
  sed -i "s|$version|$pkgver|" xprofile.1 xprofilerc.5 xprofile/__init__.py
  gzip -9 xprofile.1 xprofilerc.5
}

package() {
  cd "$srcdir/$_gitname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xprofile/LICENSE"
  install -Dm644 zsh/completions "$pkgdir/usr/share/zsh/site-functions/_xprofile"
  install -Dm644 xprofile.1.gz "$pkgdir/usr/share/man/man1/xprofile.1.gz"
  install -Dm644 xprofilerc.5.gz "$pkgdir/usr/share/man/man5/xprofilerc.5.gz"

  python3 setup.py install --root="$pkgdir" --optimize=1
}
