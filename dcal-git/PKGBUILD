# Maintainer: Alan Berndt <alan@eatabrick.org>
pkgname=dcal-git
pkgver=1
pkgrel=1
pkgdesc="A generic calendar for X"
url="https://github.com/bentglasstube/dcal"
license='MIT'
arch=('i686' 'x86_64')
depends=('libx11')
makedepends=('git')
provides=('dcal')

_gitroot='git://github.com/bentglasstube'
_gitrepo='dcal'

build() {
  cd $srcdir
  msg "Connecting to git server..."

  if [ -d $_gitrepo ]; then
    cd $_gitrepo
    git pull || return 1
    msg "The local files are updated."
  else
    git clone "$_gitroot/$_gitrepo.git"
  fi

  msg "Git checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitrepo-build"
  cp -r "$srcdir/$_gitrepo" "$srcdir/$_gitrepo-build"
  cd "$srcdir/$_gitrepo-build"

  make || return 1
}

package() {
  cd "$srcdir/$_gitrepo-build"
  install -Dm644 ${srcdir}/$_gitrepo-build/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  make MANPREFIX="$pkgdir/usr/share/man" PREFIX="$pkgdir" clean install || return 1
}
