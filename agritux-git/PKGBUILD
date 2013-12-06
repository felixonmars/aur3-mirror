# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Jean-Noël Rouchon <mail@mithril.re>
pkgname=agritux-git
pkgver=0.r42.66f70ad
pkgrel=1
pkgdesc="Logiciel de gestion d'exploitations agricoles"
arch=('any')
url="http://agritux.net"
license=('GPL3')
groups=()
depends=('ruby' 'postgresql-libs' 'sqlite')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=agritux-git.install

_gitroot=https://git.gitorious.org/agritux/agritux.git
_gitname=agritux

source=("$pkgname::git://gitorious.org/agritux/agritux.git"
        'agritux' 
        'agritux.desktop')
noextract=()
md5sums=( SKIP 
         'bd56d358c8b81617b46d7192ad29c1f2'  
         '83524a05ffaa8ae40a5074997b69257a')

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  rm -rf "$srcdir/$_gitname-build"
  mkdir -p "$srcdir/$_gitname-build/usr/share/"
  cd "$srcdir/$_gitname-build/usr/share"
  
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  
  cd ../../../..
  mkdir -p "$srcdir/$_gitname-build/usr/bin/"
  cp 'agritux' "$srcdir/$_gitname-build/usr/bin/"
  
  mkdir -p "$srcdir/$_gitname-build/usr/share/applications"
  cp 'agritux.desktop' "$srcdir/$_gitname-build/usr/share/applications"
  
  mkdir -p "$srcdir/$_gitname-build/usr/share/pixmaps"
  cp "$srcdir/$_gitname-build/usr/share/$_gitname/src/resources/icons/agritux128.png" "$srcdir/$_gitname-build/usr/share/pixmaps/agritux.png"
  
  msg "Starting build..."

}

pkgver() {
  cd "$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/$_gitname-build"
  cp -r . "${pkgdir}/"
}

# vim:set ts=2 sw=2 et:
