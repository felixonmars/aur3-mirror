# Contributor: skatiger <skatiger at gmail dot com>

pkgname=gwibber-service-sohu
pkgver=0.8.1
pkgrel=3
pkgdesc='sohu service for gwibber'
arch=('i686' 'x86_64')
url='http://launchpad.net/gwibber-service-sohu'
license=('GPL2')
depends=('gwibber>=3.2.0' 'python2>=2.7')
makedepends=('python2-distutils-extra')
source=("http://launchpad.net/gwibber-service-sohu/trunk/${pkgver}/+download/gwibber-service-sohu-${pkgver}.tar.gz"
        'sohu')

build()
{
	cd "$srcdir/${pkgname}-$pkgver"

    python2 setup.py install --root="${pkgdir}"

    # Add OAUTH file
    cp ../sohu ${pkgdir}/usr/share/gwibber/plugins/sohu/data/
}
package(){
    chmod +r ${pkgdir}/usr/share/gwibber/plugins/sohu/ui/icons/16x16/sohu.png
}

md5sums=('8611b91d15ae70598ac36f276eed626a'
         '3655ba2cbc27233ee5061ce672158dda')
