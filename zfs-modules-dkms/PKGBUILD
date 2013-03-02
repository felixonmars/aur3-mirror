# Maintainer: Boudhayan Gupta <me@BaloneyGeek.com>

pkgname=zfs-modules-dkms
_pkgmaj=0.6.0
_pkgmin=rc14
pkgver=${_pkgmaj}_${_pkgmin}
_pkgver=${_pkgmaj}-${_pkgmin}
pkgrel=3
pkgdesc="ZFS kernel modules for Linux (DKMS)"

url="http://zfsonlinux.org"
arch=("x86_64" "i686")
license=("CDDL")
depends=("dkms" "spl-modules-dkms")
optdepends=()
makedepends=("rpmextract")
conflicts=()
provides=("zfs-modules")
backup=()

install=$pkgname.install
source=("http://archive.zfsonlinux.org/downloads/zfsonlinux/zfs/${pkgname}-${_pkgver}.noarch.rpm")
md5sums=("66840f950b0ddf5c6387125a5f779c1a")

build() {
	rpmextract.sh ${pkgname}-${_pkgver}.noarch.rpm
}

package() {
	cp -R "$srcdir/usr" "$pkgdir/"
}