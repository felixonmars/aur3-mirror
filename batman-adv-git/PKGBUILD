# Maintainer: Splex
pkgname=batman-adv-git
pkgver=20111004
pkgrel=1
pkgdesc="An implementation of the B.A.T.M.A.N. routing protocol in form of a linux kernel module operating on layer 2."
arch=('i686' 'x86_64')
url="http://http://www.open-mesh.org"
license=('GPL')
depends=('kernel26')
makedepends=('kernel26-headers' 'git')
optdepends=('batctl: CLI tool to control batman devices')
provides=('batman-adv')
conflicts=('batman-adv')
replaces=('batman-adv')
backup=()
install=batman-adv-git.install
source=()
noextract=()
md5sums=()

_gitroot=http://git.open-mesh.org/batman-adv.git
_gitname=batman-adv

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

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D -m644 batman-adv.ko ${pkgdir}/lib/modules/$(uname -r)/updates/net/batman-adv/batman_adv.ko
  install -D -m644 README ${pkgdir}/usr/share/doc/batman-adv/README
}

# vim:set ts=2 sw=2 et:
