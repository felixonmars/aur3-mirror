# Contributor: str1ngs <schzoid29 at gmail.com>

# *** README ***
# if you have problem with this package build please fork it at http://github.com/str1ngs/gobuild-hg
# and send me a pull request with any fixes

pkgname=gobuild-hg
pkgver=52
pkgrel=1
pkgdesc="gobuild is an automatic build tool that aims to replace Makefiles for simple projects written in the Go programming language."
arch=('i686' 'x86_64')
url="http://code.google.com/p/gobuild/"
license=('GPL')
groups=()
depends=('go')
makedepends=('mercurial' 'go')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgroot="https://gobuild.googlecode.com/hg/"
_hgrepo="gobuild"

build() {

  #unset go enviroment
  unset GOARCH GOROOT GOOS GOBIN 
 
  #unset -j flags, build breaks on parallel make jobs
  unset MAKEFLAGS 

  #source system go enviroment
  source /etc/profile.d/go.sh || return 1

  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #

  make || return 1

  install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname/-hg}/LICENSE || return 1
  install -D -m755 gobuild $pkgdir/usr/bin/gobuild || return 1
} 
