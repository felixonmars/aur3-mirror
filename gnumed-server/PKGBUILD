# Maintainer: FreeWilly

pkgname=gnumed-server
pkgver=20.4
pkgrel=1
pkgdesc="Electronic Medical Record software in multiple languages to assist and improve longitudinal care"
arch=('any')
url="http://wiki.gnumed.de/bin/view/Gnumed"
license=('GPL')
depends=('postgresql' 'python2')
install=$pkgname.install
source=(http://www.gnumed.de/downloads/server/v20/$pkgname.$pkgver.tgz)
md5sums=('b3fae8cbb456f283069ff481eee9e6e4')

build() {
  cd "$srcdir"/$pkgname.$pkgver
  
  # silent bootstrap process by setting interactive to 'no' and set 'gm-dbo' as default password
  for conffile in `find server/bootstrap -maxdepth 1 -type f -name \*.conf` ; do \
    sed -i 's/^\(interactive[[:space:]]*=[[:space:]]*\)yes/\1no/' "$conffile" ; \
    sed -i 's/^\(password[[:space:]]*=[[:space:]]*\)/\1 gm-dbo/' "$conffile" ; \
  done

  # python2 fixes
  sed "s|python'|python2'|g" -i server/pycommon/gmMimeMagic.py
  sed "s|env python|env  python2|g" -i server/bootstrap/bootstrap_gm_db_system.py
  sed "s|env python|env  python2|g" -i server/gm-fingerprint_db.py
}

package() {
  cd "$srcdir"/$pkgname.$pkgver

  install -dm755 "$pkgdir"{/usr/bin/,/var/{log/gnumed/server,lib/gnumed/server/bootstrap}}

  cp -r server/* "$pkgdir"/var/lib/gnumed/server/
  cp server/{*.sh,gm-bootstrap_server} "$pkgdir"/usr/bin/
}
