# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 08/12/2011

pkgname=prename
pkgver=1.5
pkgrel=1
pkgdesc='Regular expression file renaming utility'
arch=('any')
url='http://www.perl.org'
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=($pkgname $pkgname.1.gz)
noextract=()

build(){
  cd $srcdir
  install -Dm755 $pkgname ${pkgdir}/usr/bin/$pkgname || return 1
  install -Dm644 $pkgname.1.gz ${pkgdir}/usr/share/man/man1/${pkgname}.1.gz || return 1
}
md5sums=('6bab41c344d5b68224cbd5ab3e2945e9'
         '8185c93b83e39dddd19872dd5a049486')
