# Maintainer: Mohammad Razeghi <razeghi71@gmail.com>
pkgname=persian-calendar-git
pkgver=28
pkgrel=1
pkgdesc="persian calendar extension for gnome shell"
arch=(any)
url="http://oxygenws.com/blog/"
license=('GPL')
makedepends=('git')
md5sums=() #generate with 'makepkg -g'

_gitroot="https://github.com/omid/Persian-Calendar-for-Gnome-Shell"
_gitname=$pkgname-$pkgver

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
}

package() {
  echo "$srcdir/$_gitname"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/"
  cp -r "$srcdir/$_gitname/" "$pkgdir/usr/share/gnome-shell/extensions/PersianCalendar@oxygenws.com"
}

# vim:set ts=2 sw=2 et:
