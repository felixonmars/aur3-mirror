# Maintainer: Thomas Oster <thomas.oster@rwth-aachen.de>
# Contributor: Jelle van der Waa <jelle vdwaa nl>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=synergy-gnome3-fixed
pkgver=1.3.7
pkgrel=2
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="http://synergy-foss.org"
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libxtst' 'libxinerama' )
license=('GPL2')
makedepends=('libxt' 'cmake')       # used by configure to test for libx11...
conflicts=('synergy' 'synergy-plus')
backup=('etc/synergy.conf')
source=("http://synergy.googlecode.com/files/synergy-$pkgver-Source.tar.gz" "synergys.rc" "http://synergy-foss.org/tracker/attachments/download/2930/RawEvent.diff" )

build() {
  cd "${srcdir}/synergy-${pkgver}-Source"
  patch -p0 -i $srcdir/RawEvent.diff
  cmake  -D CMAKE_INSTALL_PREFIX=/usr . 
  make
}

package() {
  cd "${srcdir}/synergy-${pkgver}-Source/bin"

#  make DESTDIR="$pkgdir" install # doesn't work atm

  # install binary
  install -d "$pkgdir/usr/bin/"
  install -Dm755 synergyc $pkgdir/usr/bin/
  install -Dm755 synergys $pkgdir/usr/bin/

  # install rc.d script  and config
  install -d "${pkgdir}/etc/rc.d"
  install -Dm644 $srcdir/synergy-$pkgver-Source/doc/synergy.conf.example "${pkgdir}/etc" 
  install -Dm755 $srcdir/synergys.rc "${pkgdir}/etc/rc.d/synergys" 
}

md5sums=('27842f45f8ab6923eb702f9cc4858194'
         '056e59b1d04a66820ffa4b53e5ec20bc'
         'eb59ecaeb9934890ddc52b271783b4b9')

