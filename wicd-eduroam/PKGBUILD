# Maintainer: Oliver Wiedemann <crxxn@tinkershack.org>
# Contributor: Dominik George <nik@naturalnet.de>
# Contributor: Ander Martinez <dwarfnauko@gmail.com>

pkgname='wicd-eduroam'
pkgver=1.7.2.4_9
pkgrel=5
pkgdesc="WICD configuration templates for use in university networks"
arch=('any')
url="http://wicd.sourceforge.net/"
license=('GPL')
depends=('wicd')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=eduroam.install
source=(eduroam.install eduroam-TTLS eduroam-PEAP)
noextract=()
sha512sums=('2e2e5b88c26b11b39dd6434a6e55ed4f1de4196fbe94d524b7095f799f7981a011ba1689daa288b1b0c21341d2c4a8ea35fa2e7cbcf1897ecc65a3328c1b8c75'
	    'b95e718e925029e6e8631fbfbc4b594c58c4cd8db82091f59bfb87073e8b02e8d70193a9e0988b0eb2b85b3aa9b113bd5437a5f2aae0d57716ef0bd9c1553b0d' 
	    '4ac0a9f6a310eb581d778a7265cb5b84027ed51aed496ec032c9c9c0b8ee54fdbb44070394d83181eb836110926f6dfc2feb5f4efbd5aa8e80e696b986cd4e40')

package(){
	install -Dm 644 eduroam-TTLS 		$pkgdir/etc/wicd/encryption/templates/eduroam-TTLS
	install -Dm 644 eduroam-PEAP 		$pkgdir/etc/wicd/encryption/templates/eduroam-PEAP
}
