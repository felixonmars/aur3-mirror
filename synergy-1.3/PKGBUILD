# Maintainer: Élie Bouttier <elie.bouttier@free.fr>
# Contributor: Jelle van der Waa <jelle vdwaa nl>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=synergy-1.3
pkgver=1.3.8
pkgrel=1
pkgdesc="Share a single mouse and keyboard between multiple computers - version 1.3 for backward compatibility"
url="http://synergy-foss.org"
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libxtst' 'libxinerama' )
license=('GPL2')
makedepends=('libxt' 'cmake')       # used by configure to test for libx11...
backup=('etc/synergy-1.3.conf')
source=("http://synergy.googlecode.com/files/synergy-${pkgver}-Source.tar.gz" "synergys-1.3.rc" "synergys-1.3.socket" "synergys-1.3.service")

build() {
  cd "${srcdir}/synergy-${pkgver}-Source"

  cmake  -D CMAKE_INSTALL_PREFIX=/usr . 
  make
}

package() {
  cd "${srcdir}/synergy-${pkgver}-Source/bin"

  #make DESTDIR="$pkgdir" install

  # install binary
  install -d "$pkgdir/usr/bin/"
  install -Dm755 synergyc $pkgdir/usr/bin/synergyc-1.3
  install -Dm755 synergys $pkgdir/usr/bin/synergys-1.3

  # install rc.d script  and config
  install -d "${pkgdir}/etc/rc.d"
  install -Dm644 $srcdir/synergy-$pkgver-Source/doc/synergy.conf.example "${pkgdir}/etc/synergy-1.3.conf.example" 
  install -Dm755 $srcdir/synergys-1.3.rc "${pkgdir}/etc/rc.d/synergys-1.3" 

  # Install systemd service and socket
  install -d "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/synergys-1.3.service" "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$srcdir/synergys-1.3.socket" "$pkgdir/usr/lib/systemd/system/"
}
md5sums=('3534c65ecfa6e47d7899c57975442f03'
         '4e6a71ecfab2da48bb9d004c93e5642a'
         '6b89458058952af947cc4d8026f40d46'
         '3f2e3b13e313fffbcc4be4d9a4b5898d')
