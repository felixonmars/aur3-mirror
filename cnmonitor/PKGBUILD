# Maintainer: loafer <davemorgan353 at btinternet dot com>
pkgname=cnmonitor
pkgver=3.2.1_1
pkgrel=1
pkgdesc="LDAP Directory Server Monitoring tool."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/cnmonitor/"
license=('GPL')
backup=(etc/httpd/conf/extra/cnmonitor.conf
        etc/cnmonitor/config.xml
)
depends=('libldap' 'php' 'php-ldap')
source=("http://sourceforge.net/projects/cnmonitor/files/latest/download/"$pkgname"-"${pkgver//_/-}".zip")

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir"/etc/cnmonitor/
  cp "$srcdir"/"$pkgname"/config/* "$pkgdir"/etc/cnmonitor/
  chown -R root:http "$pkgdir"/etc/cnmonitor/
  chmod 650 "$pkgdir"/etc/cnmonitor/*
  mkdir -p "$pkgdir"/usr/share/cnmonitor/www/
  cp -r "$srcdir"/"$pkgname"/www/* "$pkgdir"/usr/share/cnmonitor/www/
  mkdir -p "$pkgdir"/usr/share/cnmonitor/bin/
  cp "$srcdir"/"$pkgname"/bin/* "$pkgdir"/usr/share/cnmonitor/bin/
  chmod -R +x "$pkgdir"/usr/share/cnmonitor/bin/
  mkdir -p "$pkgdir"/usr/share/cnmonitor/sql/
  cp "$srcdir"/"$pkgname"/sql/* "$pkgdir"/usr/share/cnmonitor/sql/
  mkdir -p "$pkgdir"/usr/share/cnmonitor/conf/
  cp -r "$srcdir"/"$pkgname"/conf/* "$pkgdir"/usr/share/cnmonitor/conf/
  mkdir -p "$pkgdir"/usr/share/man/man1/
  cp "$srcdir"/"$pkgname"/man1/* "$pkgdir"/usr/share/man/man1/
  mkdir -p "$pkgdir"/etc/httpd/conf/extra/
  cp "$srcdir"/"$pkgname"/conf/httpd/cnmonitor.conf "$pkgdir"/etc/httpd/conf/extra/
  ln -s /etc/cnmonitor/ "$pkgdir"/usr/share/cnmonitor/config
}

# vim:set ts=2 sw=2 et:
md5sums=('595c695c28d59349177ef2e69d122f84')
