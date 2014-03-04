# Maintainer: Roman Rader <antigluk@gmail.com>
pkgname=packer-image-builder
pkgver=0.5.2
pkgrel=1
pkgdesc="Tool for creating identical machine images for multiple platforms from a single source configuration."
arch=('x86_64' 'i686')
url="http://www.packer.io/"
license=('MPL2')
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
source=(https://dl.bintray.com/mitchellh/packer/0.5.2_linux_386.zip)
noextract=()
md5sums=('cbf21fae4eaf8b0f66f00cb1b2cd4e5d')


package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/local/lib/packer"
    install -m 755 packer* "$pkgdir/usr/local/lib/packer/"
    install -d "$pkgdir/usr/local/bin/"
    cd "$pkgdir"
    find "usr/local/lib/packer/" -maxdepth 1 -printf 'ln -s /%h/%f ./usr/local/bin/%f ;\n' | sh
}
