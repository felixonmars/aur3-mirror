# Maintainer: Vertoe <vertoe AT qhor DOT net>
# Based on PKGBUILD from darkcoin maintained by Mitsu <archlinux AT suumitsu DOT eu>

pkgname='darkcoin-bin-rc'
pkgver=0.10.13.15
pkgrel=1
arch=('x86_64')
url="http://www.darkcoin.io/"
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6' 'qrencode>=3.4.3')
license=('MIT')
pkgdesc="Privacy-Centric Cryptographic Currency with fully encrypted transactions and anonymous block transactions. Binary version, of the release candidate: use only if you know what you are doing!"
provides=('darkcoin')
conflicts=('darkcoin' 'darkcoin-git')
source=("http://bamboo.darkcoin.qa/artifact/BL-DRKRC/QTL/build-50/gitian-linux-darkcoin-rc-bin/bin/64/darkcoin-qt"
"http://bamboo.darkcoin.qa/artifact/BL-DRKRC/QTL/build-50/gitian-linux-darkcoin-rc-bin/bin/64/darkcoind"
"https://raw.githubusercontent.com/darkcoinproject/darkcoin/master/COPYING"
"https://raw.githubusercontent.com/darkcoinproject/darkcoin/master/share/pixmaps/bitcoin128.png"
"https://raw.githubusercontent.com/darkcoinproject/darkcoin/master/contrib/debian/darkcoin-qt.desktop")
sha512sums=('a96599b6999b3cf74e11bedbfd5af73fd9dac56a3e262a660bf596d82bf2070f5b4df85f0b396caf819fc9db1ea2cfc6d2b4eeeaacb7be31a99597a71a641b8f'
'65da0f67cd25b6b54fbaaf7fc6b17b3890709ef69a02dd5623de502edec1790c97e8ee8c6f4c16cadcf35d342638ea9df3cc998860a91958b40e4d9c8be3dfe8'
'8aa23a60e346399b9a841258c45a6927ee7da6a033c39730b284bff5b3215e05497de027af57214393edec637718a986bf329937f59042918a9ea3c761db4089'
'f0bab4b845746dd56f368fbc439b87119c539eb3a4a6d937c5524c807f1b9d63d2c8a0c6680ede402c46fc5fbe6d13b95a107849e1d2e024e68a2a5ec9711e44'
'8df4301a0f582ee86da79bcc215d8cd230e1b573cfd0a928601ba23d17518edef3a9d8577afb5bea145a017b085777150ef0d70ef4dec2e4cf758e3780b6daad')

package() {
	install -D -m755 "$srcdir/darkcoin-qt" "$pkgdir/usr/bin/darkcoin-qt"
	install -D -m755 "$srcdir/darkcoind" "$pkgdir/usr/bin/darkcoind"
  install -D -m644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "$srcdir/bitcoin128.png" "$pkgdir/usr/share/pixmaps/darkcoin128.png"
  install -D -m644 "$srcdir/darkcoin-qt.desktop" "$pkgdir/usr/share/applications/darkcoin.desktop"
}
