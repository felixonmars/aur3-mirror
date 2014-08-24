# Maintainer : Dustin Falgout <dustin@falgout.us>

pkgname=ajenti-v
pkgver=0.2.46
pkgrel=1
pkgdesc='Plugin suite for Ajenti that adds web hosting capabilities.'
arch=(any)
url='http://ajenti.org/'
license=(LGPL)
depends=('ajenti>=1.2.21.12' 'python2-reconfigure>=0.1.39' 'supervisor>=3.0' 'mariadb'
         'mariadb-clients' 'nginx-mainline-common' 'php-fpm' 'gunicorn' 'vsftpd>=3.0.2'
         'db' 'pure-ftpd' 'puma' 'nodejs' 'exim' 'courier-imap>=4.9.3' 'courier-authlib>=0.64.0')
makedepends=('git')
provides=(ajenti-v-core)
install=ajenti-v.install
source=('git+https://github.com/Eugeny/ajenti-v.git')
md5sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}
  
  msg2 'Replacing python shebang by python2 shebang...'
  find . -type f -exec sed -i \
    -e '1s|^#!/usr/bin/env python$|#!/usr/bin/env python2|' \
    -e '1s|^#!/usr/bin/python$|#!/usr/bin/env python2|' \
    "{}" \;

  for file in ./*.sh; do rm "${file}"; done
}

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/var/lib/ajenti/plugins
  cp -dpr --no-preserve=ownership ${pkgname}/* ${pkgdir}/var/lib/ajenti/plugins
}
