# Maintainer: Markus Opitz <mastero23 at gmail dot com>

pkgname=if-svnadmin
pkgver=1.5.2
pkgrel=1
pkgdesc="Web based GUI to your Subversion authorization file"
arch=('any')
url="http://www.insanefactory.com/if-svnadmin/"
license=('GPL2')
depends=('php-apache')
source=(http://sourceforge.net/projects/ifsvnadmin/files/svnadmin-$pkgver.zip)
md5sums=('b0df6497eb0324f6a56f969a69d822f7')

build() {
  cd "$pkgdir"
  mkdir -p srv/http
  cp -a "$srcdir/svnadmin" srv/http
  chmod 777 srv/http/svnadmin/data
  rm -r srv/http/svnadmin/translations/en_US
}
