
# Maintainer: Ashley the Catgirl <me@ashley.re>
pkgname=kailauncher
pkgver=0.2
pkgrel=1
pkgdesc="A simple dmenu-based application launcher, made for my friend - Kai"
arch=('any')
url="http://github.com/AshleyTheCatgirl/kailauncher"
license=('custom:WTFPL')
depends=('bash' 'coreutils' 'sed' 'grep')
optdepends=('i3-wm: Automatic keyboard shortcut setting.')
changelog=ChangeLog
source=(kailauncher
        LICENSE)
noextract=()
md5sums=('00ba8380695b2ea7fd7b0c60c896cc71'
         '6b7ecf56c49463aba5e61b9b038202e1')

package() {
	install -d "${pkgdir}/usr/bin"
	cp kailauncher "${pkgdir}/usr/bin/kailauncher"
	install -d "${pkgdir}/usr/share/licenses/$pkgname"
	cp LICENSE "${pkgdir}/usr/share/licenses/$pkgname/"
}
