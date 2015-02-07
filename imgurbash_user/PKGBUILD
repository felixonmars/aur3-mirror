# Author: Bart Nagel <bart@tremby.net>
# Contributor: Jan Stępień <jstepien@users.sourceforge.net>
# Contributor: Westin Miller <equinoxscripts@gmail.com>

pkgname=imgurbash_user
pkgver=5
pkgrel=1
pkgdesc="A simple bash script to upload an image to your imgur account from the commandline"
arch=("any")
license=('PD')
url="http://imgur.com/tools/"
depends=('bash' 'curl' 'sed')
optdepends=('xsel: automatically putting the URL on the X selection for easy pasting'
	'xclip: an alternative to xsel'
	'xdg-utils: Better url handling for auth tokens')
source=("imgurbash_user")
sha1sums=('10c3680a1caacb920c03e03deba653fa377087f5')

package() {
	mkdir -p $pkgdir/usr/bin
	install imgurbash_user $pkgdir/usr/bin/imgurbash_user -m 755 || return 1
}
