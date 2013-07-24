
# Maintainer: Policarpo Caballero <policarpocp at gmail dot com>
pkgname=jtv-downloader-git
pkgver=bb007af
pkgrel=1
pkgdesc="A live downloader that helps you recording or watching live streams."
arch=('i686' 'x86_64')
url="https://github.com/toine512/jtv-downloader"
license=('GPL3')
depends=('qt4' 'rtmpdump')
makedepends=('git')
install=$pkgname.install
source=('git://github.com/toine512/jtv-downloader.git' \
'JtvLiveUiTabBasicJustin_tv.h-typo_fix.diff')
md5sums=('SKIP' '641f6983cbed9fbab43ec7bf218a3c3b')
_gitname="jtv-downloader"

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --always | sed 's|-|.|g'
}

build() {
   cd "$srcdir/$_gitname"

   git submodule update --init

   if true; then
      patch -uN JtvLiveUiTabBasicJustin_tv.h ../../JtvLiveUiTabBasicJustin_tv.h-typo_fix.diff || return 1
   fi

   qmake-qt4 -makefile
   make
}

package() {
  cd "$srcdir/$_gitname"
  install -D -m755 jtv-downloader "${pkgdir}/usr/bin/jtv-downloader"

  # Desktop icon
  cd debian
  install -Dm644 "$_gitname.png" "$pkgdir/usr/share/pixmaps/$_gitname.png"
  install -Dm644 "$_gitname.desktop" "$pkgdir/usr/share/applications/$_gitname.desktop"
}

# vim:set ts=2 sw=2 et:

