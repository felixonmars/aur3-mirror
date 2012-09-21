# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <chris@x120e>
pkgname=php-build
_gitver=5298c84
pkgver=0.8.0
pkgrel=1
pkgdesc="Builds PHP so that multiple versions can be used in parallel."
arch=('i686' 'x86_64')
url="http://chh.github.com/php-build/"
license=('MIT')
groups=()
depends=('autoconf' 'automake>=1.4' 'libtool>=1.4' 're2c>=0.13.4'
  'bison' 'gcc' 'libmcrypt' 'tidyhtml')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/CHH/$pkgname/tarball/v$pkgver")
md5sums=('8d71bca044643ab169586eb7e9a856d3')
noextract=()

package() {
  cd $startdir/src/CHH-$pkgname-$_gitver

  install -d $startdir/pkg/usr/bin
  install -d $startdir/pkg/usr/share/man/man1
  install -d $startdir/pkg/usr/share/man/man5

  PREFIX=$startdir/pkg/usr ./install.sh
}

# vim:set ts=2 sw=2 et:
