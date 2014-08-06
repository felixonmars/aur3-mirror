# Maintainer: dartagan <william at weiskopf dot me>
# Contributor: faerbit <faerbit at gmail dot com>

_pkgname=lxqt-lightdm-greeter
pkgname=$_pkgname-git
pkgver=0.7.0.r8.gf57e428
pkgrel=1
pkgdesc="A greeter for lightdm."
arch=('i686' 'x86_64')
url="http://www.lxde.org"
license=('LGPL')
depends=('liblightdm-qt5')
makedepends=('git' 'cmake' 'liblxqt-git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git://github.com/lxde/$_pkgname.git"
        "lxqt-lightdm-greeter.install")
md5sums=('SKIP'
         '66f002eb73b5709c2c13582153ee1557')
sha1sums=('SKIP'
          'cbc5f1ce7e62964fa38b04951bdc3770330dcc68')
sha256sums=('SKIP'
            '56ddc9977bb4c65987154b3f4711b9aab3e331dac4c0b1a4e00c8fd0cd174ccf')
sha384sums=('SKIP'
            'd1ba69007dc7e36457ba99321f0791726707aa1cfbc2d2809cabe7785ef19854765eab7eecdc0a71c5e22888c303e147')
sha512sums=('SKIP'
            '4adbd499801bec9af1cc815688e8a40a7ba54bd20b0a868ee8f0510711332ce3c4eb2e3b0dc5786ae1501934a3f157859a65619669d0c485d32792023c8f633a')
install=lxqt-lightdm-greeter.install

pkgver() {
    cd "$_pkgname"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_QT5=ON ..
    make
}

package() {
    cd "$_pkgname"
    cd build
    make DESTDIR="$pkgdir" install
}
