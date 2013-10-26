# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=sv-dvorak-extended
pkgver=1
pkgrel=1
pkgdesc="An extended Swedish Dvorak keyboard layout."
arch=(any)
url="http://github.com/kyrias/sv-dvorak-extended"
license=('GPL')
depends=('xorg-server')
makedepends=('git')
install='sv-dvorak-extended.install'
source=('git+https://github.com/kyrias/sv-dvorak-extended.git'
		'sv-dvorak-extended.install')
md5sums=('SKIP'
		 'f6b9dc0d45e3742a865d39b8e20366b8')

package() {  
	install -Dm644 sv-dvorak-extended/sv-dvorak-extended "$pkgdir"/usr/share/X11/xkb/symbols/sv-dvorak-extended
}

# vim: set ts=4 sw=4 noet:
