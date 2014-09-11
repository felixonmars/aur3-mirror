# Maintainer: rafmav@free.fr
pkgname=biwascheme-git
_pkgname=biwascheme
pkgver=0.5.4.2.r414.g13e21f8
pkgrel=1
pkgdesc="Scheme interpreter written in JavaScript. git version."
arch=(i686 x86_64)
makedepends=('git' 'nodejs' 'nodejs-uglify-js')
url="http://www.biwascheme.org/"
license=('MIT' 'GPL2')

_gitroot=https://github.com/$_pkgname/$_pkgname
_gitname=$pkgname

prepare() {
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

#pkgver for the git version
pkgver() {
	cd "$srcdir/$_gitname-build"
	echo $(git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g')
}

# _pkgver for the true version
_pkgver() {
	cd "$srcdir/$_gitname-build"
	cat "VERSION"
}

build() {
  cd "$srcdir/$_gitname-build"
  make all
}

package() {
    mkdir -p $pkgdir/usr/share/$_pkgname
    cd "$srcdir/$_gitname-build/release"
	install * $pkgdir/usr/share/$_pkgname
}

