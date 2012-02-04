# Maintainer: James Buckley <xanium4332@gmail.com>
pkgname=fbuild-git
pkgver=20111112
pkgrel=1
pkgdesc="A build system that is designed around caching instead of tree evaluation"
arch=('any')
url="https://github.com/felix-lang/fbuild"
license=('custom')
depends=('python>=3')
makedepends=('git')
provides=('fbuild')
conflicts=('fbuild')
options=(!emptydirs)

_gitroot="https://github.com/felix-lang/fbuild"
_gitname="fbuild"

package() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python setup.py install --root=$pkgdir/ --optimize=1

  install -D -o root -g root -m 644 "LICENSE" -p "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

