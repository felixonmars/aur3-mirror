# Contributor: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Thomas Dziedzic

pkgname=prekin
pkgver=6.51.081122
pkgrel=1
pkgdesc='Prekin prepares molecular kinemages (input files for Mage) from PDB-format coordinate files, using either a choice of built-in scripts or a flexible user specification of options.'
arch=('i686' 'x86_64')
url='http://kinemage.biochem.duke.edu/software/prekin.php'
license=('unknown')
depends=('libxmu' 'lesstif')
source=("http://kinemage.biochem.duke.edu/downloads/software/$pkgname/$pkgname.$pkgver.src.tgz")
md5sums=('0c718716d522c5e9ffc6b8664a4af36a')

build() {
  cd $pkgname.$pkgver

  make -f Makefile.linux || return 1

  install -D prekin "$pkgdir/usr/bin/prekin"
}
