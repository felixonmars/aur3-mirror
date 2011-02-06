# Contributor: C Anthony Risinger <extofme-at-gmail-dot-com>

pkgname=zarafa-webaccess-ajax
pkgver=6.30.11
pkgrel=1
pkgdesc="AJAX based web-interface to the Zarafa Groupware Suite"
arch=('i686' 'x86_64')
url="http://www.zarafa.com/"
license=('AGPL3')
depends=('php-apache>=5.2.0' "zarafa-server>=${pkgver}")
backup=("srv/http/${pkgname}/config.php")
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::http://download.zarafa.com/zarafa/drupal/ondemand.php?version=${pkgver}&src=${pkgname}-${pkgver}"
        "${pkgname}.conf"
        "${pkgname}.ini")
md5sums=('ed22c4eb660b7b7241f5e42e28b61d74'
         'd470fccc1cd265d4e06ca1c2c14c7efb'
         '95360dbedce9742bc1aa2d01c7e6710a')

build() {

  mkdir -p ${pkgdir}/srv/http || return 1
  mv ${srcdir}/php-webclient-ajax ${pkgdir}/srv/http/${pkgname} || return 1

  # This isn't really a PEAR package... but Arch's default PHP config has open_basedir restrictions
  # and I doubt there will ever be a MAPI PEAR package to conflict, so one less thing user will have to do
  cp ${pkgdir}/srv/http/${pkgname}/config.php.dist ${pkgdir}/srv/http/${pkgname}/config.php || return 1
  sed -e 's|/usr/share/php/|/usr/share/pear/|g' \
      -i ${pkgdir}/srv/http/zarafa-webaccess-ajax/config.php

  install -d -m755 ${pkgdir}/srv/http/${pkgname}/tmp || return 1
  install -D -m644 ${srcdir}/zarafa-webaccess-ajax.conf ${pkgdir}/etc/httpd/conf/extra/zarafa-webaccess-ajax.conf || return 1
  install -D -m644 ${srcdir}/zarafa-webaccess-ajax.ini ${pkgdir}/etc/php/conf.d/zarafa-webaccess-ajax.ini || return 1

}
