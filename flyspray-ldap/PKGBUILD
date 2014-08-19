# $Id$
# Maintainer: Ethan Zonca <e@ethanzonca.com>

pkgname=flyspray-ldap
pkgver=0.9.9.7
pkgrel=1
pkgdesc="A PHP web-based bug tracker with patches to support LDAP authentication"
arch=('any')
url="http://www.flyspray.org/"
license=('GPL')
depends=('php')
conflicts=('flyspray')
makedepends=('unzip')
backup=('etc/webapps/flyspray/.htaccess')
install=$pkgname.install
options=('!strip')
noextract=(flyspray-$pkgver.zip)
source=(http://flyspray.org/flyspray-$pkgver.zip
	"flyspray-php-5.4.patch::https://projects.archlinux.org/vhosts/bugs.archlinux.org.git/patch/?id=aaeeeb05f6d81ce88131239126b9da189fd1f904"
        "flyspray-ldap.patch"
        "http://mirror.protofusion.org/flyspray-ldap-adodb.tar.gz")

md5sums=('3a218c5447d64af18f19bc63bb825e58'
         '340c40221401232172a356e76c85ccc8'
         '009d6ed41dde48b90393ffebbc4c3c60'
         '20f278a117d81f6d4dee1e38cf08f633')

package() {
  mkdir $srcdir/flyspray-${pkgver}
  cd $srcdir/flyspray-${pkgver}
  unzip ../flyspray-$pkgver.zip

  patch -Np3 -i ../flyspray-ldap.patch

  cp -R ../ldap adodb/

  _instdir=$pkgdir/usr/share/webapps/flyspray
  mkdir -p ${_instdir} $pkgdir/etc/webapps/flyspray
  cd ${_instdir}
  cp -ra $srcdir/flyspray-${pkgver}/* .
  echo "deny from all" > $pkgdir/etc/webapps/flyspray/.htaccess
  ln -s /etc/webapps/flyspray/.htaccess .htaccess
}

