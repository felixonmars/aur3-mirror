# The latest release of eqtlbma from git. Not stable
# Maintainer: Mike Dacre <mike@dacre.me>
pkgname=eqtlbma-git
pkgver=v1.2.r156.g6628158
pkgrel=1
pkgdesc="A bayesian statistical method to detect eQTLs jointly in multiple subgroups (e.g. tissues). Unstable git version."
arch=('i386' 'i686' 'x86_64')
url="https://github.com/timflutre/eqtlbma"
license=('GPL')
depends=('gcc-libs-multilib' 'gsl')
optdepends=('r: Running tutorials')
install='eqtlbma.install'
makedepends=('git')
provides=('eqtlbma')
conflicts=('eqtlbma')

_gitroot=https://github.com/timflutre/eqtlbma
_gitname=eqtlbma

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
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  autoreconf --install --force --symlink
  ./configure --prefix=/usr
  make
  make pdf
}

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

check() {
  cd "$srcdir/$_gitname-build"
  make -k check
}

package() {
  cd "$srcdir/$_gitname-build"              
  make DESTDIR="$pkgdir/" install install-info
  install -dm0755 "$pkgdir/usr/share/eqtlbma/"
  install -m0444 "$srcdir/$_gitname-build/doc/manual_eqtlbma.pdf" "$pkgdir/usr/share/eqtlbma/"
  install -m0444 "$srcdir/$_gitname-build/scripts/utils_eqtlbma.R" "$pkgdir/usr/share/eqtlbma/"
  install -m0444 "$srcdir/$_gitname-build/scripts/tutorial_eqtlbma.R" "$pkgdir/usr/share/eqtlbma/"
}
# vim:set ts=2 sw=2 et:
