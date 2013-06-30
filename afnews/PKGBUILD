# Contributor: Jason Zhang <mock2u@gmail.com>
# Maintainer: Jason Zhang <mock2u@gmail.com>

pkgname=afnews
pkgver=1.0
pkgrel=1
pkgdesc="A simple Python3 script to fetch Arch Linux official latest news"
arch=('any')
url="https://github.com/GitJason/yaourt-abs-patch/tree/master/afnews/afnews.py"
license=('GPL')
depends=('python3')
source=("https://raw.github.com/GitJason/yaourt-abs-patch/master/afnews/afnews.py")
md5sums=('a4ac37791f3086137a9907e4a62c0c40')

package() {
    sudo mkdir -p ${pkgdir}//usr/bin/${pkgname}
    sudo cp -f ${srcdir}/afnews.py /usr/bin/${pkgname}
}
