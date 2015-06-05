# Maintainer: Julian Fenk <julian@nastymatter.net>
pkgname=qemu-debootstrap
pkgver=2.3
pkgrel=1
pkgdesc="A wrapper for debootstrap using qemu to emulate foreign architectures."
arch=('x86_64')
url="https://packages.debian.org/experimental/amd64/qemu-user-static/download"
license=('GPL')
depends=(qemu-user-static dpkg)
optdepends=(qemu binfmt-support)
makedepends=(binutils tar)
source=("http://ftp.de.debian.org/debian/pool/main/q/qemu/qemu-user-static_$pkgver+dfsg-5_amd64.deb")
md5sums=(e1ace94959e59d760b7275af6baddfb9)

prepare() {
        cd "$srcdir"
        tar xf data.tar.xz
}

package() {
        cd "$srcdir"
        mkdir -p "$pkgdir"/usr/bin
        install usr/sbin/"$pkgname" "$pkgdir"/usr/bin/
        #the qemu-user-static package from aur installs the manpage
        #mkdir -p "$pkgdir"/usr/share/man/man1
        #install usr/share/man/man1/"$pkgname".1.gz "$pkgdir"/usr/share/man/man1/
}
