# Maintainer: Edvinas Valatka <edacval@gmail.com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
pkgname=foswiki
pkgver=1.1.8
pkgrel=1
pkgdesc="Free and open source wiki-based enterprise collaboration platform"
arch=('any')
url="http://$pkgname.org"
license=('GPL')
depends=('perl' 'cron' 'apache' 'rcs' 'diffutils' 'smtp-forwarder' 'perl-html-tree')
backup=(etc/httpd/conf/extra/httpd-$pkgname.conf)
options=(!strip emptydirs)
install=$pkgname.install
changelog=$pkgname.changelog
source=(http://sourceforge.net/projects/foswiki/files/foswiki/1.1.8/Foswiki-1.1.8.tgz
  $pkgname.install
  $pkgname.changelog
  httpd-$pkgname.conf)
md5sums=('f49e6dec6da4c5124ef96a1009d196ed'
         '52b7413956af4ac15452d47349d9b3db'
         '8b6c13e0d7577b33b1369fc2dd51a844'
         'e8aeb68c905fc58b2fa8e8a3040143cf')

build() {
  mv $srcdir/Foswiki-$pkgver $srcdir/$pkgname-$pkgver
  install -Dm 644 httpd-$pkgname.conf $pkgdir/etc/httpd/conf/extra/httpd-$pkgname.conf
  install -d $pkgdir/srv/http/htdocs
  cp -a $srcdir/$pkgname-$pkgver  $pkgdir/srv/http/htdocs/$pkgname-$pkgver-$pkgrel
  chmod 770  $pkgdir/srv/http/htdocs/$pkgname-$pkgver-$pkgrel
}
# vim:set ts=2 sw=2 et:
