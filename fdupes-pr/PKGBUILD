# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Daenyth <Daenyth+Arch at gmail dot com>
# Contributor: Chris Winter <twidds at gmail dot com>

pkgname=fdupes-pr
_pkgname=fdupes
pkgver=1.50_PR2
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="a program for identifying or deleting duplicate files residing within specified directories (1.50 \"preview release\")"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fdupes/"
license=('MIT')
depends=('glibc')
provides=('fdupes')
conflicts=('fdupes')
source=("http://fdupes.googlecode.com/files/$_pkgname-$_pkgver.tar.gz")
md5sums=('a4f0de2d9a79efce3d712d6520e58c7f')

build() {
  cd $srcdir/$_pkgname-$_pkgver
  sed -n '/^Legal Information$/,$p' README > LICENSE
  make 
}

package(){
  cd $srcdir/$_pkgname-$_pkgver
  install -d ${pkgdir}/usr/{share/man/man1,bin}
  make BIN_DIR=${pkgdir}/usr/bin MAN_DIR=${pkgdir}/usr/share/man/man1 install
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
