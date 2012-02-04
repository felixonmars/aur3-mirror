# Maintainer: crazyelf5

pkgname=cinnamon-themes-git
pkgver=20120125
pkgrel=1
pkgdesc="A collection of themes for Cinnamon"
arch=('any')
url="https://github.com/linuxmint/cinnamon-themes"
license=('GPL')
depends=('cinnamon')
makedepends=('git')
conflicts=('cinnamon-theme-eleganse')

_gitroot=git://github.com/linuxmint/cinnamon-themes.git
_gitname=cinnamon-themes

build() {
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  cd "$srcdir/cinnamon-themes"
  find ./*/ -maxdepth 0 -type d -exec cp -r '{}' "$pkgdir/usr/share/themes" \;
}

# vim:set ts=2 sw=2 et:
