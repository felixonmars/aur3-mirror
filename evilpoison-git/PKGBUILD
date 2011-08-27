# Contributor: Alex Brown <alexpbrown9@gmail.com>
pkgname=evilpoison-git
pkgver=20090630
pkgrel=1
pkgdesc="A non-wimp window manager for X11 based loosely on EvilWM and RatPoison "
arch=('i686')
url="http://clivecrous.lighthouseapp.com/projects/11269/home"
license=('custom')
depends=('libx11' 'libxinerama')
makedepends=('git')
provides=('evilpoison')
source=()
md5sums=()

_gitroot="git://github.com/clivecrous/evilpoison.git"
_gitname="evilpoison"

build() {
  cd "$srcdir"
  
  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
  
  msg "Starting make..."
  cd $_gitname
  make || return 1

  install -D -m775 src/evilpoison $startdir/pkg/usr/bin/evilpoison 
  install -D -m644 doc/README $startdir/pkg/usr/share/licenses/$pkgname/README
}
