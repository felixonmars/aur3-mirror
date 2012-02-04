# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor Saeed Rasooli <saeed.gnu@gmail.com>
# Contributor Mola Pahnadayan <mola.mp@gmail.com>
# Contributor Mehdi Bayazee <bayazee@gmail.com>
# Contributor atmahasan <atmahasan9@gmail.com>
pkgname=starcal
pkgver=1.5.3
pkgrel=2
pkgdesc="A calender for persian users"
arch=('any')
url=(http://starcal.sourceforge.net)
license=('GPL')
depends=('python2' 'pygtk>=2.0' 'pygobject')
makedepends=()
source=(http://surfnet.dl.sourceforge.net/project/starcal/starcal/1.5.3/starcal_1.5.3_all.deb)
md5sums=(bcbc5254edf2b0479d6c6d607cb34508)
build() {
  ar vx starcal_1.5.3_all.deb
  tar xvzf data.tar.gz

  sed -i 's|^python|python2|' ./usr/bin/starcal

  mkdir -p $pkgdir/usr/
  install -Dm644 ./usr/share/applications/starcal.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  cp -r ./usr/* $pkgdir/usr/
  
}
