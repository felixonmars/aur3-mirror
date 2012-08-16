#Maintainer: Jove Yu <yushijun110 [at] gmail.com>

pkgname=wine-tdx
pkgver=20120712
pkgrel=1
pkgdesc='wine version of TXD client,made by Longene Team'
arch=('i686' 'x86_64')
url='http://www.longene.org'
license=('Other')
source=("http://www.longene.org/download/WineTdx-20120712-Longene.deb")
md5sums=('8523a5d880a9a91e6839c554dfd71908')
depends=('wine')

package()
{
	tar xzvf ${srcdir}/data.tar.gz -C ${pkgdir}/
	chmod -R 755 ${pkgdir}/opt/longene
}
