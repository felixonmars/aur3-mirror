# Maintainer: Heiko Baums <heiko@baums-on-web.de>

pkgname=qdvdauthor-templates
pkgver=1.11.1
pkgrel=1
pkgdesc="Templates for 'Q' DVD-Author"
url="http://qdvdauthor.sourceforge.net"
license=('CCPL:by-sa')
arch=(i686 x86_64)
depends=('qdvdauthor')
source=(http://downloads.sourceforge.net/qdvdauthor/$pkgname-$pkgver-1.i586.rpm)
md5sums=('f13316d7621b445b9547545f8bb1d612')

package() {
  cd ${srcdir}
  cd usr/share/qdvdauthor

  mkdir -p ${pkgdir}/usr/share/qdvdauthor

  for _dir in animated buttons masks slideshow static; do
    cp -R $_dir ${pkgdir}/usr/share/qdvdauthor
  done

  rm ${pkgdir}/usr/share/qdvdauthor/masks/VERSION
}
