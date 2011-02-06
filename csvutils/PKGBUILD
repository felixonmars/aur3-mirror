# Maintainer: Edgar Joergensen <siredgar@gmail.com>
# $Id $
pkgname=csvutils
pkgver=0.1
pkgrel=2
pkgdesc="Utilities to handle CSV (comma separated values) files."
url="http://freshmeat.net/projects/csvutils/"
groups=
provides=
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=()
source=(ftp://ftp.visi.com/users/hawkeyd/fbsd/csvutils.tar.gz)
md5sums=('2e35a467c1564ae30f49e4b58e47357f')
arch=('i686')
license=('GPL')

build()
{
    cd $startdir/src/csvutils
    make SHELLNAME=bash BINPATH=$startdir/pkg/usr/bin MANPATH=$startdir/pkg/usr/man install
}
