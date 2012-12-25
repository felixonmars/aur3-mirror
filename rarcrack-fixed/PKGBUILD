# Contributor: jll <paci79@free.fr>
# Updater: Eric Hansen <ehansen@securityfor.us>

pkgname=rarcrack-fixed
pkgver=0.2
pkgrel=2
pkgdesc=" This program uses bruteforce algorithm to find correct password (rar, 7z, zip).  This package resolves the download not working properly (thus timing out)."
arch=('i686' 'x86_64')
conflicts=('')
license=('GPL')
makedepends=('gcc' 'libxml2')
source=(http://voxel.dl.sourceforge.net/sourceforge/rarcrack/rarcrack-$pkgver.tar.bz2)
url="http://rarcrack.sourceforge.net/"

md5sums=('62d0cf77c6c4edc7204305649f8b7362')

build() {

  cd ${startdir}/src/$pkgname-$pkgver

  make || return 1
  install -d $startdir/pkg/usr/bin/
  install $startdir/src/$pkgname-$pkgver/rarcrack $startdir/pkg/usr/bin/rarcrack
}
