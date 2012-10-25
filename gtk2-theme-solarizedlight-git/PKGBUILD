# Maintainer: Tom Vincent <http://tlvince.com/contact>
_pkgname=gtk2-theme-solarizedlight
pkgname=$_pkgname-git
pkgver=20121026
pkgrel=1
pkgdesc="A GTK2 theme based on the light variant of the Solarized colorscheme"
arch=(any)
url="https://github.com/heichblatt/gtk2-theme-solarizedlight"
license=('unknown')
depends=('gtk-engines')
makedepends=('git')
md5sums=()

_gitroot=https://github.com/heichblatt/gtk2-theme-solarizedlight.git
_gitname=$_pkgname

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

  solarized="$pkgdir/usr/share/themes/SolarizedLight"
  install -dm755 "$solarized"
  cp -R "gtk-2.0" "$solarized"
}

# vim:set ts=2 sw=2 et:
