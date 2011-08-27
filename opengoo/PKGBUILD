# Maintainer: realitygaps <realitygaps AT yahoo DOT com>

pkgname=opengoo
pkgver=1.5.3
pkgrel=1
pkgdesc="OpenGoo is an easy to use Open Source Web Office"
arch=('i686' 'x86_64')
url="http://www.opengoo.org/"
license=('GPL')
depends=('php')
install=('opengoo.install')
backup=(srv/http/opengoo/.htaccess)
source=(http://downloads.sourceforge.net/$pkgname/${pkgname}_$pkgver.zip)

md5sums=('94c7336af6c27c496cf63f8440007a4b')

build() {
  mkdir -p $startdir/pkg/srv/http/opengoo
  cp -r $startdir/src/$pkgname/* $startdir/pkg/srv/http/$pkgname
}
