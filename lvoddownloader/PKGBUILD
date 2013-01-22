#Maintainer: dgy18787 <dgy18787 [at] 126.com>

pkgname=lvoddownloader
pkgallname=LvodDownLoader
pkgver=3.0.0
pkgrel=testing
pkgdesc='A tool that can download & watch(using other players) videos using Qvod links(qvod://).'
arch=('i686' 'x86_64')
url='https://code.google.com/p/p2p-mediaplayer/'
license=('Other')
source=("http://p2p-mediaplayer.googlecode.com/files/$pkgallname-$pkgver-$pkgrel.deb")
md5sums=('d74fa0c8367fc0b1640c1e99062e58f4')
depends=('wine' 'openjdk6')

package()
{
	tar xzvf ${srcdir}/data.tar.gz -C ${pkgdir}/
	chmod -R 755 ${pkgdir}/opt/
	chmod -R 755 ${pkgdir}/etc
	chmod -R 755 ${pkgdir}/usr
}
