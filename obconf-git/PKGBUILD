# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=obconf-git
pkgver=2.0.3.34.gcfde287
pkgrel=1
pkgdesc="A gtk2 based configuration tool for the Openbox windowmanager"
arch=(i686 x86_64)
license=(GPL2)
url=http://openbox.org/wiki/ObConf
depends=(desktop-file-utils libglade openbox-git)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
install=$pkgname.install
source=($pkgname::git://git.openbox.org/dana/${pkgname%-*}.git
    http://openbox.org/oldwiki/images/8/80/Obconf-72.png)
sha256sums=('SKIP'
    'ed62f78069a2d4b588e4cc387f8c5663c8a1ea1c2c35959ea0b17ef652ebeabe')
sha512sums=('SKIP'
    '6392d0b16cdeaa36f32f3dc0baa897042934a04996494728c1b4d17858b2e6ab413ce0014bbeeaa1c0985ea50baaffa8f2441e42d537087c44e717c65e893566')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^release-//;s/-/./g'
}

build() {
    cd $pkgname/
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname/
    sed -i 's:=openbox:=obconf:' ${pkgname%-*}.desktop
    make DESTDIR="$pkgdir" install
}
