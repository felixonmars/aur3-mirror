# Contributor: Stefan Mark <mark@unserver.de>
# Fixed by josephgbr

pkgname=bunnykill-git
pkgver=20120510
pkgrel=1
pkgdesc="A bunny hopping (and killing) game"
arch=('i686' 'x86_64')
url="http://e-x-a.org/?view=projects"
license=('GPL')
depends=('freealut' 'openal' 'freetype2' 'libvorbis' 'libpng' 'sdl' 'freeglut')
makedepends=('scons' 'git')
provides=(bunnykill)
source=(bunnykill-fix-destdir.patch
        bunnykill-libpng15.patch)
md5sums=('2c46d6b806eb9dfaf3443cfb991e1632'
         'e24ba12bb0d75f3f4bd36ee4d3e934ee')

_gitroot="http://repos.e-x-a.org/bunnykill.git"
_gitname="bunnykill"

build() {
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
  
  patch -p1 -i ${srcdir}/bunnykill-libpng15.patch
  patch -p1 -i ${srcdir}/bunnykill-fix-destdir.patch

  #
  # BUILD HERE
  #
  scons
}

package() {
 cd $_gitname-build
 for filepath in $(find data -type f); do
    install -Dm644 $filepath "$pkgdir"/usr/share/bunnykill/$filepath
 done
 install -Dm755 bunnykill "$pkgdir"/usr/bin/bunnykill
}
