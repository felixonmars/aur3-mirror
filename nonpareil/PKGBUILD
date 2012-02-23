# PKGBUILD file for nonpareil HP calculator simulator.

# Contributor: GdelaRey <arch at delarey dot org>
# Maintainer:  GdelaRey <arch at delarey dot org>

pkgname=nonpareil
pkgver=0.79
pkgrel=5
pkgdesc="HP calculator simulator"
arch=('i686' 'x86_64')
url="http://nonpareil.brouhaha.com"
license=('GPL2')
groups=()
depends=('glib2>=2.4.7' 'gtk2>=2.4.14' 'sdl>=1.2.7' 'libxml2>=2.6.16')
makedepends=('scons>=0.96.90' 'python>=1.5.2' 'netpbm>=10.25')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://nonpareil.brouhaha.com/download/$pkgname-$pkgver.tar.gz
        rename_modutil.patch
        zlib_h.patch)
noextract=()
md5sums=('4274dee70d9633304194a904b2573489'
         '19c56459877cf9604eedb64eec8b20d1'
         'f9a54b02a88a11eb50b5b496994231df')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np0 -i $srcdir/rename_modutil.patch || return 1
  patch -Np0 -i $srcdir/zlib_h.patch || return 1
  scons destdir=$pkgdir prefix=/usr || return 1
  scons destdir=$pkgdir install
}

# vim:set ts=2 sw=2 et:
