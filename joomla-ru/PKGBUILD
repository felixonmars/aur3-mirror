# Maintainer: Sergei aka runout Shadurskiy <tflow1@gmail.com>
#
# Based on Joomla PKGBUILD from Netanel Shine <Netanelshine@gmail.com>

pkgname=joomla-ru
pkgver=1.5.20
pkgrel=1
pkgdesc="Russian translation for the PHP-based content management platform."
arch=('any')
url="http://www.joomla.org/"
license=('GPL')
depends=('joomla')
makedepends=('unzip')
provides=()
install=${pkgname}.install
source=(http://joomlacode.org/gf/download/frsrelease/4520/55271/ru-RU_joomla_lang_admin.${pkgver}v2.zip
	http://joomlacode.org/gf/download/frsrelease/4533/55272/ru-RU_joomla_lang_site.${pkgver}v1.zip)
noextract=(ru-RU_joomla_lang_admin.${pkgver}v2.zip
	   ru-RU_joomla_lang_site.${pkgver}v1.zip)
md5sums=('f49b9142b88d16d24b4d5c4708eefaa7'
	  '73ddf1ee30d2ceecb0270e7a9d00e944')

build() {
  # Extract
  mkdir "$pkgdir/srv/http/joomla/administrator/language/ru-RU" -p || return 1
  unzip ru-RU_joomla_lang_admin.1.5.20v2.zip -d "$pkgdir/srv/http/joomla/administrator/language/ru-RU" || return 1
  mkdir "$pkgdir/srv/http/joomla/language/ru-RU" -p || return 1
  unzip ru-RU_joomla_lang_site.1.5.20v1.zip -d "$pkgdir/srv/http/joomla/language/ru-RU" || return 1

  # Remove unnecessary permissions.
  find "$pkgdir/srv/http/joomla" -type f -exec chmod 0664 {} \;  || return 1
  find "$pkgdir/srv/http/joomla" -type d -exec chmod 0775 {} \;  || return 1
}



