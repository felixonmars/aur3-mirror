# Maintainer: Clayton G. Hobbs <clay@lakeserv.net>
pkgname=crossfire-client-rpm-64
pkgver=1.60.0
pkgrel=1
pkgdesc="A free and open source cross platform MMORPG.  Package pre-built from an RPM."
arch=('x86_64')
url="http://crossfire.real-time.com/"
license=('GPL2')
depends=('libx11' 'sdl' 'alsa-lib' 'gtk2' 'lua' 'curl' 'libglade' 'libgl' 'libpng12')
makedepends=('rpmextract')
conflicts=('crossfire-client' 'crossfire-client-svn')
source=(http://downloads.sourceforge.net/project/crossfire/client-linux-rpm/${pkgver}/crossfire-client-gtk2-${pkgver}-1.x86_64.rpm)
noextract=(http://downloads.sourceforge.net/project/crossfire/client-linux-rpm/${pkgver}/crossfire-client-gtk2-${pkgver}-1.x86_64.rpm)
md5sums=('cdbc967d04f72da8ab57063fbe05f2ad') #generate with 'makepkg -g'

build() {
  cd "$srcdir/"

  rpmextract.sh crossfire-client-gtk2-${pkgver}-1.x86_64.rpm
}

package() {
  cd "$srcdir/"

  mv usr/ $pkgdir/
}

# vim:set ts=2 sw=2 et:
