# Maintainer: Ismael Castiñeira <isma.casti at gmail dot com>
pkgname=plpbt
pkgver=5.0.15
pkgrel=1
pkgdesc="Plop Boot Manager image, offering USB and CDROM boot on old machines without BIOS support"
arch=('i686' 'x86_64')
url="https://www.plop.at/en/bootmanager/index.html"
license=('custom')
groups=()
depends=()
makedepends=('unzip')
optdepends=('grub: boot menu support')
provides=()
conflicts=()
replaces=()
backup=('etc/grub.d/80_plpbt')
options=()
install=
changelog=
source=(
    "http://download.plop.at/files/bootmngr/$pkgname-$pkgver.zip"
    "80_plpbt"
)
noextract=('')
md5sums=('95e8ca2b805f0e3a304c2ad21f9e731c'
         '6bf160531549e2b89b01acd508049010')

package() {
  install -Dm755 80_plpbt "$pkgdir/etc/grub.d/80_plpbt"
  
  cd "$pkgname-$pkgver"
  install -Dm644 plpbt.bin "$pkgdir/boot/plop/plpbt.bin"
  install -Dm644 licence.txt "$pkgdir/usr/share/licenses/$pkgname/licence.txt"
} 
