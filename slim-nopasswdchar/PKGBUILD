# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Hugo Ideler <hugoideler@dse.nl>

pkgname=slim-nopasswdchar
pkgver=1.3.2
pkgrel=1
pkgdesc="Desktop-independent graphical login manager for X11 with nopasswdchar patch."
arch=('i686' 'x86_64')
url="http://slim.berlios.de/"
license=('GPL2')
depends=('pam' 'libxmu' 'libpng' 'libjpeg>=8' 'libxft')
provides=('slim')
conflicts=('slim')
backup=('etc/slim.conf' 'etc/logrotate.d/slim' 'etc/pam.d/slim')
install=slim.install
source=(http://download.berlios.de/slim/slim-$pkgver.tar.gz
        'slim'
        'slim.logrotate'
        'slim.pam'
        'slim-restart.patch'
        'slim-tty-slowness.patch'
        'slim-gcc44.patch'
        'slim-nopasswdchar.patch')
md5sums=('ca1ae6120e6f4b4969f2d6cf94f47b42'
         'd8ea9c4dee2811524b67f4f666311a1f'
         '43da096480bf72c3ccec8ad8400f34f0'
         'b20fe3c8487a039050986d60e45233a9'
         '1610b2834bf4622c0668fb15ea05e399'
         '11ad2cd582edf705a417c33fe24f1a61'
         '8db2bb319be4c82fca7dbbb7999f8800'
         '987fad1509ee614550c7f96ecb4b7620')

build() {
  cd "$srcdir/slim-$pkgver"
  
  sed -i -e 's/png12/png14/g' Makefile
  patch -Np1 -i ../slim-gcc44.patch
  patch -Np1 -i ../slim-tty-slowness.patch
  patch -Np1 -i ../slim-restart.patch
  patch -Np1 -i ../slim-nopasswdchar.patch

  make USE_PAM=1
}

package() {
  cd "$srcdir/slim-$pkgver"

  make DESTDIR="$pkgdir" MANDIR=/usr/share/man install
  install -D -m755 "$srcdir/slim" "$pkgdir/etc/rc.d/slim"
  install -D -m644 "$srcdir/slim.logrotate" "$pkgdir/etc/logrotate.d/slim"
  install -D -m644 "$srcdir/slim.pam" "$pkgdir/etc/pam.d/slim"

  # Provide sane defaults
  sed -i 's|#xserver_arguments.*|xserver_arguments   -nolisten tcp vt07|' "$pkgdir/etc/slim.conf"
  sed -i 's|/var/run/slim.lock|/var/lock/slim.lock|' "$pkgdir/etc/slim.conf"
}
