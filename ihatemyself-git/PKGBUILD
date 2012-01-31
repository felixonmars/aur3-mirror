# Maintainer: Jonathan Wehrle <jonathanw@gmx.de>
pkgname='ihatemyself-git'
pkgver=20120131
pkgrel=1
pkgdesc="A challenging puzzle platformer"
arch=('any')
url="http://www.fysx.org/i-hate-myself/"
license=('CCPL')
depends=('love>=0.7.2')
makedepends=('git zip')
changelog=

_gitroot="git://github.com/joeka/I-hate-myself.git"
_gitname="I-hate-myself"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
	cd "$_gitname"
	git submodule init
  fi
  git submodule update

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"

  mkdir -p "$srcdir/$_gitname-build"
  zip -r "$srcdir/$_gitname-build/ihatemyself.love" * -x *.git*

	echo "#!/bin/bash" > "$srcdir/ihatemyself"
	echo "love /usr/share/ihatemyself/ihatemyself.love" >> "$srcdir/ihatemyself"
}

package() {
	install -Dm644 "$srcdir/$_gitname-build/ihatemyself.love" "$pkgdir/usr/share/ihatemyself/ihatemyself.love"
	
	install -Dm755 "$srcdir/ihatemyself" "$pkgdir/usr/bin/ihatemyself"
}
