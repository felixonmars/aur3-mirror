# Contributor: Alexander Rødseth <rodseth@gmail.com>
pkgname=libnsfb-git
_gitname=libnsfb
pkgver=1.r115.1ed0510
pkgrel=2
pkgdesc="netsurf framebuffer library"
arch=('i686' 'x86_64')
url="http://www.netsurf-browser.org/projects/libnsfb/"
license=('MIT')
provides=('libnsfb')
conflicts=('libnsfb' 'libnsfb-svn')
makedepends=('git' 'netsurf-buildsystem')
source=('git://git.netsurf-browser.org/libnsfb.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "1.r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$_gitname"
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
