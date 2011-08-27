# Maintainer: Schnouki <thomas.jost@gmail.com>

pkgname=gtk-zenburn
_pkgname=Zenburn
pkgver=20100820
pkgrel=1
pkgdesc="A GTK theme inspired by the Zenburn colorscheme"
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php/Zenburn+GTK?content=100628"
license=('GPL')
depends=('gtk-engine-murrine')
source=(http://opendesktop.org/CONTENT/content-files/100628-Zenburn.tar.bz2)
md5sums=('23546ebc09dfbaffb74399770ab59184')
sha1sums=('8135eb8f41f5ba8201fbf7b2828548ca332d9cd8')

build () {
  mkdir -p ${pkgdir}/usr/share/themes
  cp -R ${srcdir}/${_pkgname} ${pkgdir}/usr/share/themes
  find ${pkgdir} -name '*~' -delete
}
