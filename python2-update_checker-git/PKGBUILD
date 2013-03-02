# Maintainer: William Osler <wosler@acm.org> 
pkgname=python2-update_checker-git
pkgver=20130302
pkgrel=1
pkgdesc="A python module that will check for package updates."
arch=('any')
url="https://github.com/bboe/update_checker"
license=('BSD 2-Clause')
depends=(python2)
makedepends=(git)
_gitroot="git://github.com/bboe/update_checker.git"
_gitname="update_checker"

build() {
  msg "Connecting to github.com GIT server...."
    if [[ -d $_gitname ]] ; then
      ( cd "$_gitname" && git pull origin )
      msg "The local files are updated."
    else
      git clone "$_gitroot" --depth=1
    fi
  msg "GIT checkout done or server timeout"

  cd "$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
