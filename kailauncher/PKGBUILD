
# Maintainer: Ashley the Catgirl <me@ashley.re>
pkgname=kailauncher
pkgver=0.1
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
md5sums=('908ea2cc0af0501cbf4ed17cc06684e8'
         '6b7ecf56c49463aba5e61b9b038202e1')

package() {
	install -d "${pkgdir}/usr/bin"
	cp kailauncher "${pkgdir}/usr/bin/kailauncher"
	install -d "${pkgdir}/usr/share/licenses/$pkgname"
	cp LICENSE "${pkgdir}/usr/share/licenses/$pkgname/"
}
