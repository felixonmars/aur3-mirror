# Maintainer: Vanya A. Sergeev <vsergeev at gmail dot com>
pkgname=minifortune
pkgver=2.4
pkgrel=1
epoch=
pkgdesc="A minimal fortune-mod clone"
arch=('i686' 'x86_64')
url="https://github.com/vsergeev/minifortune"
license=('MIT')
depends=('glibc')

source=("https://github.com/vsergeev/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('bcc1de7c4f614f0013fc735efe56d48a')
sha1sums=('01b42dfbd8bbf3fe5860c376e795f55d0f894231')
sha256sums=('91f28696a5fea808f2bda99434d39f499eaf377540e2695741ca35321492fdaf')
sha384sums=('f5d841c2871a191c48a217262c2bfe150429070a8d5968e9d3d5347348bb08655b1ffbb1174588e0d1429463b9c45e7b')
sha512sums=('8494a0d52dd82368a26f502ecd7922ad951c07ea1396b50e6b6106c60bab5bf6c8b23f811c6b67a345ce611ab2c7239f90a842768490fc9d3c53bc87be31b2f2')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
