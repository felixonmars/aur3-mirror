# Maintainer: David Barchiesi <dlbarchiesi@gmail.com>

pkgname=i3lock-libcairo-git
pkgver=20120407
pkgrel=1
pkgdesc="An improved screenlocker based upon XCB and PAM (with image support)"
arch=('i686' 'x86_64')
url="http://i3.zekjur.net/i3lock/"
license=('MIT')
depends=('xcb-util' 'xcb-util-image' 'xcb-util-keysyms' 'pam' 'libev' 'cairo-xcb')
provides=('i3lock')
conflicts=('i3lock')
makedepends=('git')

_gitroot="git://code.stapelberg.de/i3lock"
_gitname="i3lock"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  make
  gzip i3lock.1
}

package() {  
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
  
  install -Dm644 i3lock.1.gz ${pkgdir}/usr/share/man/man1/i3lock.1.gz
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  make clean
}

# vim:set ts=2 sw=2 et:

