# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Sebastien Luttringer <seblu+arch@seblu.net>
# Contributor: Jochen Immendœrfer <jochen.immendoerfer@gmail.com>

pkgname=alsa-tools
pkgver=1.0.26.1
pkgrel=1
pkgdesc="ALSA tools package"
arch=(i686 x86_64)
url=http://alsa-project.org/
license=(GPL2)
depends=(alsa-lib fltk gtk2 gtk3)
options=(!libtool)
source=(ftp://ftp.alsa-project.org/pub/tools/$pkgname-$pkgver.tar.bz2)
sha256sums=('553338693707fe6ddfc430b9edc4cd2677390e200c9e38de82ede3394e733841')
sha512sums=('5b71092f7de1b9f7e9282bd79c0f59ecb970fabf285c5816d09251b622ddd25d8fc196a1c3d2bb5d4034dc9106f97bd04e71ebdae661e426a85e85ddfefc2ea9')

build() {
    for f in $(find "$srcdir/$pkgname-$pkgver" -type f -name configure ); do
        [[ -x $f ]] || continue
        cd "${f%/*}"
        [[ qlo10k1 = ${PWD##*/} ]] && continue
        [[ hwmixvolume = ${PWD##*/} ]] && continue
        msg2 "Building ${PWD##*/}"
        ./configure --prefix=/usr --x-libraries=/usr/lib
        make
    done
}

package() {
    for f in $(find "$srcdir/$pkgname-$pkgver" -type f -name configure ); do
        [[ -x $f ]] || continue
        cd "${f%/*}"
        [[ qlo10k1 = ${PWD##*/} ]] && continue
        [[ hwmixvolume = ${PWD##*/} ]] && continue
        msg2 "Installing ${PWD##*/}"
        make "DESTDIR=$pkgdir" install
    done
}
