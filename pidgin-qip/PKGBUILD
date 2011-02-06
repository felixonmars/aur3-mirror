# Contributor: Petr Novák (NPetr) <n_petr at seznam dot cz>

pkgname=pidgin-qip
pkgver=1.0
pkgrel=1
pkgdesc="Fix plugin for displaying diacritic letters from qIp 2005 IM in right CP1250 encoding."
url="http://fialky.com/drupal-5.0/?q=node/13"
license=('GPL')
arch=(i686 x86_64)
provides=('pidgin')
#install="pidgin-qip.install"
depends=('pidgin')

source=(http://fialky.com/drupal-5.0/files/pidgin-qip_linux_source.tar.gz)
md5sums=('160d043911b480baa03f3228acb16b18')

build() {
  cd $startdir/src/${pkgname}_linux_source
  make || return 1
  mkdir -p $startdir/pkg/usr/lib/pidgin
  cp -a $startdir/src/${pkgname}_linux_source/*.so $startdir/pkg/usr/lib/pidgin/
}
