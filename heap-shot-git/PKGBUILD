# Contributor:  Nicklas Overgaard <nicklas@isharp.dk>

pkgname=heap-shot-git
pkgver=20130203
pkgrel=1
pkgdesc="Bleeding edge Mono heap-shot profiler"
url="http://www.mono-project.com/HeapShot"
arch=('i686' 'x86_64')
license=('GPL')
depends=('mono' 'glib2' 'gtk-sharp-2')
makedepends=('git')
provides=('heap-shot'=$pkgver-$pgkrel)

source=(heapshotgui)
md5sums=('1639c681f4bf2540f83cfc1ef75cf6c5')

_gitroot="git://github.com/mono/heap-shot"
_gitname="heap-shot"

build() {
  cd ${srcdir}

  if [ -d "$_gitname" ]; then
	cd "$_gitname"
	git pull origin || return 1
	cd ..
  else
	git clone "$_gitroot" || return 1
  fi
  rm -rf "$_gitname-build"
  git clone "$_gitname" "$_gitname-build" || return 1
  cd "$_gitname-build"
  git submodule update --init --recursive || return 1
  
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  install -D -m755 ${srcdir}/heapshotgui \
    ${pkgdir}/usr/bin/heapshotgui

}
# vim:syntax=sh
