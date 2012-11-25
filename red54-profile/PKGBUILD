# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=red54-profile
pkgver=1
pkgrel=2
pkgdesc="bash.sh and fcitx.sh at profile.d from Red54.com"
arch=('any')
url="http://Red54.com/"
license=('MIT')
backup=('etc/profile.d/bash.sh'
	'etc/profile.d/fcitx.sh')
source=('bash.sh'
	'fcitx.sh')
md5sums=('84f427dd68db3834df5f744267efc273'
	'1b0bb31828383fc79acb082570cb6f0c')

package() {
	install -D bash.sh $pkgdir/etc/profile.d/bash.sh
	install -D fcitx.sh $pkgdir/etc/profile.d/fcitx.sh
}
