pkgname=howm-git
pkgver=2273b25
pkgrel=1
pkgdesc='A lightweight, tiling X11 window manager that mimics vi by offering operators, motions and modes.'
arch=('i686' 'x86_64')
url='https://github.com/HarveyHunt/howm'
license=('GPL')
depends=('xcb-util-keysyms' 'xcb-util-wm')
makedepends=('git')
options=('docs' '!strip' 'debug')
source=('git+https://github.com/HarveyHunt/howm#branch=develop'
  'config.h')
sha1sums=('SKIP'
          '60592b41ef4711878e42572c09f0f6a21a639199')
_configkeep=0
_gitname=howm

pkgver() {
  cd "$_gitname"
  git rev-parse --short HEAD
}

prepare() {
  cd "$_gitname"
  if (( _configkeep == 1 )); then
    cp "$srcdir/config.h" config.h
  fi
}
  
build() {
  cd "$_gitname"
  make debug
}

package() {
  cd "$_gitname"
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/xsessions"
  install -m755 "bin/debug/howm" "$pkgdir/usr/bin"
  install -m644 howm.xsession.desktop "$pkgdir/usr/share/xsessions"
}

# vim:set ts=2 sw=2 et:
