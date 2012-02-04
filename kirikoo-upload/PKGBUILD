# Contributor: hylix <hylix@gmail.com>
pkgname=kirikoo-upload
pkgver=0.5.1
pkgrel=1
pkgdesc="Envoi d'images sur kirikoo.net, en console."
arch=(i686 x86_64)
url="http://forums.archlinux.fr/topic5063.html"
license=('GPL')
depends=('python2')
source=(kirikoo-upload)
md5sums=('ca2156faab5f57319bdef4030c1e6c74')
 
build() {
  cd $srcdir
  install -D -m755 kirikoo-upload "$pkgdir"/usr/bin/kirikoo-upload
}
