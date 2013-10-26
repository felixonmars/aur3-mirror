# Maintainer: Chun Yang <x@cyang.info>
pkgname=rstudio-server
_pkgname=rstudio
pkgver=0.98.437
pkgrel=1
pkgdesc="An integrated development environment (IDE) for R (server version)"
url="http://www.rstudio.com/"
license=('AGPL3')
arch=('i686' 'x86_64')
depends=('r>=2.11.1' 'boost-libs' 'gwt' 'hunspell' 'mathjax' 'openssl>=0.9.8' 'pam')
makedepends=('apache-ant' 'boost' 'cmake>=2.6' 'cups' 'java-environment' 'google-guice' 'google-gin')
backup=(etc/pam.d/rstudio)
install=rstudio-server.install
source=(https://github.com/rstudio/rstudio/archive/v${pkgver}.tar.gz
        ${pkgname}.install
        ${pkgname}.service
        arch-build.patch)
sha256sums=('5ecb4c35706e3f0cbe43b1d9b59736fd91c5e4c748a1666eed4f9ad336ca15de'
            '0f17c14965267dbd1ced1dd30b21397edb133e8c8661c5ca0821ec9deb2172fa'
            'ab634b3f10d811be54f6957b464ec1d204d6b5af6d8b26f32975c50a998347ec'
            'b7f0576197ccf4cb1d3c9f9c1a04a19f201001e2c15e16663ad47e9bbde87402')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver/"
    patch -p1 -i "$srcdir/arch-build.patch"
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"

    mkdir -p build
    cd build

    cmake .. -DRSTUDIO_TARGET=Server -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr/lib/$pkgname"

    make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver/build"

	make DESTDIR="$pkgdir" install

    # Create config directory
    install -dm755 "$pkgdir/etc/$_pkgname"

    # Create var directories
    install -dm755 "$pkgdir/var/run/$pkgname"
    install -dm755 "$pkgdir/var/lock/$pkgname"
    install -dm755 "$pkgdir/var/log/$pkgname"
    install -dm755 "$pkgdir/var/lib/$pkgname"
    install -dm755 "$pkgdir/var/lib/$pkgname/conf"
    install -dm755 "$pkgdir/var/lib/$pkgname/body"
    install -dm755 "$pkgdir/var/lib/$pkgname/proxy"

    # PAM config
    install -dm755 "$pkgdir/etc/pam.d"
    install -Dm644 "$pkgdir/usr/lib/$pkgname/extras/pam/rstudio" "$pkgdir/etc/pam.d/rstudio"

    # Systemd script
    install -Dm644 "$srcdir/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    # Create symlink for admin script
    install -dm755 "$pkgdir/usr/bin"
    ln -sv "/usr/lib/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
