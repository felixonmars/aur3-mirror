# Maintainer: Chris Withers <chris-arch [at] samurai {dot} me {dot} uk
# Contributor: leejkennedy [arch forums]
pkgname=dvorak-uk
pkgver=0.1
pkgrel=1
pkgdesc="UK variant dvorak layout"
arch=(any)
url="https://bbs.archlinux.org/viewtopic.php?id=138893"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname.map.gz)
noextract=()
md5sums=('ba46655eaf0626f75934b70d40f30c44')

build() {
  mkdir -p $pkgdir/usr/share/kbd/keymaps/i386/dvorak
  install -m644 $pkgname.map.gz $pkgdir/usr/share/kbd/keymaps/i386/dvorak
}

# vim:set ts=2 sw=2 et:
