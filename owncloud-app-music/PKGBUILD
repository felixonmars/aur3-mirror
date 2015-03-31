# Maintainer: theblackcrow1 <at> bingo-ev.de

appname=music
pkgname=owncloud-app-$appname
pkgver=0.3.5
pkgrel=1
pkgdesc="Music player and server for owncloud"
arch=('any')
url="http://owncloud.org/"
license=('AGPL3')
depends=('owncloud')
options=('!strip')
source=("https://github.com/owncloud/$appname/releases/download/v$pkgver/$appname.zip")
md5sums=('7e12f595a2f367b2c3fb117747a340d3')

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/$appname ${pkgdir}/usr/share/webapps/owncloud/apps/$appname
}

