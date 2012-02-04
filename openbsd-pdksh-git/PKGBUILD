# Maintainer: Andrew Antle <andrew dot antle at gmail dot com>

pkgname=openbsd-pdksh-git
pkgver=20111202
pkgrel=1
pkgdesc="Portable version of OpenBSD's ksh, git version"
arch=('i686' 'x86_64')
url="http://github.com/dryfish/openbsd-pdksh"
license=('custom')
makedepends=('git')
provides=('pdksh' 'ksh')
conflicts=('pdksh' 'ksh')
install=$pkgname.install

_gitroot="http://github.com/dryfish/openbsd-pdksh.git"
_gitname="openbsd-pdksh"

build() {
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname"{,-build}
  cd "$srcdir/$_gitname-build"

  sh ./autogen.sh
  ./configure --prefix=/ --mandir=/usr/share/man
  make
}

package() {
  cd "$_gitname-build"

  make prefix="$pkgdir" mandir="$pkgdir/usr/share/man/man1" install

  install -D -m644 src/bin/ksh/ksh.1 "$pkgdir/usr/share/man/man1/ksh.1"
  install -D -m644 src/bin/ksh/LEGAL "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
