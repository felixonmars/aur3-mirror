# Maintainer: Boudhayan Gupta <me@BaloneyGeek.com>

pkgname=spl-modules-dkms
_pkgmaj=0.6.0
_pkgmin=rc14
pkgver=${_pkgmaj}_${_pkgmin}
_pkgver=${_pkgmaj}-${_pkgmin}
pkgrel=3
pkgdesc="OpenSolaris primitives emulation for the Linux kernel (DKMS)"

url="http://zfsonlinux.org"
arch=("x86_64" "i686")
license=("CDDL")
depends=("dkms")
optdepends=()
makedepends=("rpmextract")
conflicts=()
provides=("spl-modules")
backup=()

install=$pkgname.install
source=("http://archive.zfsonlinux.org/downloads/zfsonlinux/spl/${pkgname}-${_pkgver}.noarch.rpm")
md5sums=("a165d70619de3a625271b20b10dfd794")

build() {
	rpmextract.sh ${pkgname}-${_pkgver}.noarch.rpm
}

package() {
	cp -R "$srcdir/usr" "$pkgdir/"
}