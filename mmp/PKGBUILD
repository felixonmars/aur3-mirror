# Contributor: vinoca <supoingo@163.com>

pkgname=mmp
pkgver=0.3
pkgrel=1
pkgdesc="a mplayer wrapper to play the music in the background"
arch=('any')
license=('GPL')
url="http://www.vinoca.org/"
depends=('file' 'findutils')
source=(http://vincasrcfiles.googlecode.com/files/mmp.tar.gz)
sha1sums=('736683015d70890c7adaf1247db4cf22732c34c8')

build() {
  install -d	${pkgdir}/usr/bin
  install -m755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/
}
