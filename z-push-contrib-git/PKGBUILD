# Contributor: C Anthony Risinger
# Contributer: Jörg Thalheim <joerg@higgsboson.tk>
# Contributer: Robin McCorkell <rmccorkell@karoshi.org.uk>

pkgname=z-push-contrib-git
pkgver=r1162.bbac928
pkgrel=1
pkgdesc="open-source implementation of the ActiveSync protocol"
arch=('any')
url="https://github.com/fmbiete/Z-Push-contrib"
license=('AGPL3')
provides=(z-push z-push-contrib)
conflicts=(z-push z-push-git z-push-contrib)
depends=('php')
install=z-push.install

_backend_configs=(
	backend/caldav/config.php
	backend/carddav/config.php
	backend/combined/config.php
	backend/imap/config.php
	backend/ldap/config.php
	backend/maildir/config.php
	backend/searchldap/config.php
	backend/vcarddir/config.php
	backend/zarafa/config.php
)

backup=('etc/webapps/z-push/config.php'
	'etc/webapps/z-push/.htaccess'
	'etc/webapps/z-push/apache.conf'
	'etc/webapps/z-push/nginx.conf'
	"${_backend_configs[@]/#/etc\/webapps\/z-push\/}"
)

options=('!strip')
source=(
	"git+https://github.com/fmbiete/Z-Push-contrib"
	"htaccess"
	"apache.conf"
	"nginx.conf"
	"z-push.ini"
)

md5sums=(
	'SKIP'
	'1091aa1ba272ef05bf628f73b05c527a'
	'32a459bd61135b6c5e99e82e3a6b0007'
	'e768c5ed6e631d18e156f94b3bc46948'
	'ceaa699636b0de6d678a2cf3af264d2b'
)

package() {
  mkdir -p ${pkgdir}/etc/webapps/z-push
  mkdir -p ${pkgdir}/etc/php/conf.d
  mkdir -p ${pkgdir}/usr/share/webapps/z-push
  mkdir -p ${pkgdir}/var/{lib,log}/z-push
  cd ${pkgdir}/usr/share/webapps/

  cp -r ${srcdir}/Z-Push-contrib/* z-push

  mv z-push/config.php ${pkgdir}/etc/webapps/z-push/config.php
  ln -s /etc/webapps/z-push/config.php z-push/config.php

  for backendconfig in "${_backend_configs[@]}"; do
    install -D z-push/"$backendconfig" ${pkgdir}/etc/webapps/z-push/"$backendconfig"
    ln -sf /etc/webapps/z-push/"$backendconfig" z-push/"$backendconfig"
  done

  cp ${srcdir}/htaccess ${pkgdir}/etc/webapps/z-push/.htaccess
  ln -s /etc/webapps/z-push/.htaccess z-push/.htaccess

  cp ${srcdir}/{apache,nginx}.conf ${pkgdir}/etc/webapps/z-push/

  cp ${srcdir}/z-push.ini  ${pkgdir}/etc/php/conf.d/
}

pkgver() {
  cd ${srcdir}/Z-Push-contrib
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
