#Maintainer: Nathan O <ndowens.aur at gmail dot com>
pkgname=edictionary
pkgver=2.6
pkgrel=2
pkgdesc="Contains tools to view word meanings and more form the command line."
arch=('any')
url='http://edictionary.sourceforge.net/'
license=('GPL')
depends=('perl')
source=(http://downloads.sourceforge.net/${pkgname}/edict/edict-${pkgver}/edict-${pkgver}.tar.gz)
md5sums=('978c1af6547fae088d6430a4d02978cb')

build()
{
    cd "${srcdir}/edict"
    make 
	install -Dm755 edict ${pkgdir}/usr/bin/edict
	install -Dm755 ethes ${pkgdir}/usr/bin/ethes
}
