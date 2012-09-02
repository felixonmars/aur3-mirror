# Maintainer: Vladimir Navrat < vn158 at seznam dot cz >
pkgname=lionwiki
pkgver=3.2.9
pkgrel=1
pkgdesc="A PHP-based minimalist Wiki engine"
arch=('i686' 'x86_64')
url="http://lionwiki.0o.cz/"
license=('GPL')
groups=()
depends=('php>=4.3.0')
source=(http://lionwiki.0o.cz/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
install=${pkgname}.install
backup=("srv/http/${pkgname}/config.php")
md5sums=('6e355ff656884eb80a9f23aa360cb670')

build() {
    mkdir -p $pkgdir/srv/http
    tar xvf ${pkgname}-${pkgver}.tar.bz2 -C $pkgdir/srv/http
    mv $pkgdir/srv/http/${pkgname}-${pkgver} $pkgdir/srv/http/${pkgname}
}
