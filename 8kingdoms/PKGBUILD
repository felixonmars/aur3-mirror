# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=8kingdoms
pkgver=1.1.0
pkgrel=2
pkgdesc="A 3D turn-based fantasy strategy game in which players become kings"
arch=('i686' 'x86_64')
url="http://kralovstvi.sourceforge.net/"
license=('GPL')
depends=('mesa' 'sdl_mixer>=1.2' 'tcl>=8.4.12')
makedepends=('autoconf' 'automake')
source=(http://downloads.sourceforge.net/kralovstvi/8Kingdoms-$pkgver.tar.gz \
	$pkgname.desktop \
	$pkgname.png \
	fixes.diff)

md5sums=('8409daf3d44e294dcfb50b85e87a3fa1'
         '1aa1feb5b0dd0893d21e41d47668624a'
         'bfea55da5b9680224aad847b87e758f5'
         '6a492f0a5251f6e52fdbe3c4978e1246')

build() {
  cd 8Kingdoms-$pkgver

  patch -Np1 -i ${srcdir}/fixes.diff || return 1

  sed	-e 's|8.4|8.5|g' \
	-e 's|games/8K|share/8k|g' -is \
	configure.in \
	Makefile.am \
	Makefile.in

  autoreconf -i
  ./configure --prefix=/usr

  make || return 1
  make DESTDIR=${pkgdir} install

  mv -f $pkgdir/usr/bin/8Kingdoms $pkgdir/usr/bin/$pkgname || return 1

  install -D -m644 ${srcdir}/$pkgname.png \
    $pkgdir/usr/share/pixmaps/$pkgname.png || return 1
  install -D -m644 ${srcdir}/$pkgname.desktop \
    $pkgdir/usr/share/applications/$pkgname.desktop || return 1
}
