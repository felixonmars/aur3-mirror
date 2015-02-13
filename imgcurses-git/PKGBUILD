#Maintainer Joseph Simone <averagejoey2000 at gmail dot com>
pkgname=imgcurses-git
pkgrel=3
pkgdesc="An ncurses image viewer"
arch=(any)
url="https://github.com/orangeduck/imgcurses.git"

license=('BSD')
makedepends=('git')
_gitroot=$url
_gitname=imgcurses

build() 
{
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
pkgver() 
{
cd "$srcdir/$pkgname"
( set -o pipefail
git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
)
}
pkgver=`pkgver`
package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir/" install
}
# vim:set ts=2 sw=2 et:

