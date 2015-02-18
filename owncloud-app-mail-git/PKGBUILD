# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-mail-git
pkgver=2ed21b5
pkgrel=4
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/owncloud/mail"
license=('AGPL')
depends=('owncloud'
	'pear-net-idna2'
	'php-horde-core'
	'php-horde-crypt-blowfish'
	'php-horde-exception'
	'php-horde-text-filter'
	'php-horde-text-flowed'
	'php-horde-idna'
	'php-horde-imap-client'
	'php-horde-listheaders'
	'php-horde-mail'
	'php-horde-mime'
	'php-horde-nls'
	'php-horde-secret'
	'php-horde-smtp'
	'php-horde-socket-client'
	'php-horde-stream'
	'php-horde-stream-filter'
	'php-horde-stream-wrapper'
	'php-horde-support'
	'php-horde-translation'
	'php-horde-util'
	'php-htmlpurifier')
makedepends=()
options=('!strip')
conflicts=('owncloud-app-mail')
source=("git+https://github.com/owncloud/mail.git"
	"autoload.php")
sha512sums=("SKIP")

pkgver() {
  cd "$SRCDEST/mail"
  git describe --always | sed 's|-|.|g' | cut -f2 -d"v"
}

sha512sums=('SKIP'
            '5dd8c7507eb439f88b218e99f76c8839962de9acf67b32ee626ccbdc47f87607f9cf1f04f43e35ccd21c437c4f21adf2f35b45b188393bb34c827b6db2b71931')
sha512sums=('SKIP'
            '57ca21db9866d9272b097d5eaf28c82c7aa361eb62220272caaa24b7b7dcb1d733432a096b1b06492ee496ed70b2313fabf1d717e15da5725e5bb97f92dd865c')
sha512sums=('SKIP'
            '78f210d657042a9249e7297d871348d035a03e833dda617d4a04b15fe26782d9876f462a61d28272c2f15f088e750eab3d1d1992606967207f0eb980db70e2fa')

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/mail" "${pkgdir}/usr/share/webapps/owncloud/apps/mail"
  install -Dm0644 $srcdir/autoload.php "${pkgdir}/usr/share/webapps/owncloud/apps/mail/vendor/autoload.php"
}
