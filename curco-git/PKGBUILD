# Maintainer: Nicola Lamacchia <nicola dot lamacchia ampersat gmail dot com>
pkgname=curco-git
pkgver=20130418
pkgrel=1
pkgdesc="A dummy CLI currency converter"
arch=(any)
url="https://github.com/nicolalamacchia/curco"
license=('custom:Unlicense')
depends=('python')
makedepends=('git')
provides=('curco')
conflicts=('curco')
options=(!emptydirs)
source=('git://github.com/nicolalamacchia/curco.git')
md5sums=('SKIP')

_gitroot=git://github.com/nicolalamacchia/curco.git
_gitname=curco

pkgver() {
  date +%Y%m%d
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
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
# vim:set ts=2 sw=2 et:
