# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=rescuetime-beta
pkgver=2.8.8.1050
pkgrel=1
pkgdesc="Application time-tracking for Linux. Beta version"
arch=(i686 x86_64)
url=https://www.rescuetime.com
license=(GPL2)
depends=(qt4 xorg-xprop xprintidle)
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
install=$pkgname.install
changelog=$pkgname.changelog

if [[ $CARCH == "x86_64" ]]
then
    _suffix=amd64
    sha1sums=('3358bc546bb825a1a2d48fb52a0bf9bdedc9ea45')
else
    _suffix=i386
    sha1sums=('f07cafe5a221f5036b8ec2399c95b999c961c988')
fi

source=($url/installers/rescuetime_beta_$_suffix.deb)

package() {
    bsdtar -xf data.tar.gz
    install -Dm755 usr/bin/${pkgname%-*} "$pkgdir"/usr/bin/${pkgname%-*}
}
