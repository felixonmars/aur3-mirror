pkgname=vmtouch-git
pkgver=0.8.0.r16.g8f8a105
pkgrel=1

pkgdesc='Portable file system cache diagnostics and control'
url='http://hoytech.com/vmtouch/'
arch=('any')
license=('BSD')

depends=('glibc')

source=('git+https://github.com/hoytech/vmtouch')
md5sums=('SKIP')

pkgver() {
    cd vmtouch
    git describe --tags | sed 's/vmtouch-//; s/-/.r/; s/-/./'
}

build() {
    cd vmtouch
    make build
}

package() {
    cd vmtouch
    make PREFIX="$pkgdir/usr" install
}
