# Maintainer: Eric Pfeiffer <computerfreak@computerfr33k.com>
pkgname=paycoin-wallet
pkgver=0.1.2.26
pkgrel=4
epoch=
pkgdesc="PayCoin is a global currency that lets you send money to anyone, anywhere, anytime. Sending and accepting money is virtually free, lightning fast and insanely easy."
arch=('i386' 'x86_64')
url="http://paycoin.com"
license=('MIT/X11')
groups=('network')
depends=('qt4')
makedepends=()
checkdepends=()
optdepends=()
provides=('paycoin' 'paycoind')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('paycoin-wallet.desktop')
noextract=()
validpgpkeys=()

source_i386=("https://github.com/GAWMiners/paycoin/releases/download/v${pkgver}/linux32.zip")
source_x86_64=("https://github.com/GAWMiners/paycoin/releases/download/v${pkgver}/linux64.zip")

sha256sums=('988716e8dd05aa876ccb5fe0bd889d39b8464c6142dd795f1587728470aa407e')
sha256sums_i386=('188eff6bb53653b2acab72d90b0406420b2e030670b2567f4c9352da004b3647')
sha256sums_x86_64=('de33f5c89077d0ec104ecacb58087a3bce416a1c9f27fbbab266271d20e8f9b2')

package() {
	if [ "$CARCH" = "x86_64" ]; then
		_source_arch="64"
	else
		_source_arch="32"
	fi

	install -d "$pkgdir"/opt/Paycoin
	
	mv "$srcdir"/"$_source_arch"/paycoin "$pkgdir"/opt/Paycoin/paycoin
	mv "$srcdir"/"$_source_arch"/paycoind "$pkgdir"/opt/Paycoin/paycoind

	chmod 755 "$pkgdir"/opt/Paycoin/paycoin
	chmod 755 "$pkgdir"/opt/Paycoin/paycoind

	install -d "$pkgdir"/usr/bin
	ln -s /opt/Paycoin/paycoin "$pkgdir"/usr/bin/paycoin
	ln -s /opt/Paycoin/paycoind "$pkgdir"/usr/bin/paycoind

	install -Dm644 "$srcdir"/paycoin-wallet.desktop "$pkgdir"/usr/share/applications/paycoin-wallet.desktop
}
