# Maintainer: Jeffrey Phillips Freeman <jeffrey.freeman@syncleus.com>
# Contributor: Gaetan Renaudeau <gre@zenexity.com>
pkgname=playframework
pkgver=2.3.8
_activatorver=1.3.2
pkgrel=1
pkgdesc="A Java and Scala web application framework that integrates the components and APIs you need for modern web application development."
url="http://www.playframework.org/"
arch=('any')
license=('APACHE')
depends=(java-environment bash)
backup=()
source=(http://downloads.typesafe.com/typesafe-activator/${_activatorver}/typesafe-activator-${_activatorver}-minimal.zip)
md5sums=('6e9a570e4be66fbcb7a80f4a39f298b6')

provides=()
conflicts=()
optdepends=()

package() {
  mkdir -p $pkgdir/usr/share/
  mkdir -p $pkgdir/usr/bin/

  cp -R $srcdir/activator-${_activatorver}-minimal $pkgdir/usr/share/playframework-${pkgver}
  chmod 755 $pkgdir/usr/share/playframework-${pkgver}/*

  ln -s /usr/share/playframework-${pkgver}/activator $pkgdir/usr/bin/activator
  install -d $pkgdir/usr/bin
  install -d -m755 $pkgdir/usr/share
}
