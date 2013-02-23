# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Jason Melton <jason.melton@gmail.com>

pkgname=emit
pkgver=1.10.3
pkgrel=2
pkgdesc="Live streaming of videos from your PC to an Android device."
arch=(any)
url="https://www.emitapp.com"
license=('custom')
install=$pkgname.install
depends=(erlang ffmpeg miniupnpc)
optdepends=('mvtoolnix: for mkv subtitles'
            'ffmpeg-git: to actually stream you need ffmpeg with libfaac support')
source=(http://cdn-t242.biokoda.com/$pkgname$pkgver.tar.gz
        install
        emit.install)
backup=('etc/emit.cfg')

build() {
    cd "$srcdir/emit$pkgver"

    cp -v "$srcdir/install" "$srcdir/emit$pkgver/install" 
    chmod +x "$srcdir/emit$pkgver/install"
}


package() {
    cd "$srcdir/emit$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/etc"
    ./install "$pkgdir"
}

md5sums=('5bbb60c8e0d2847a0b7edcd8ea7a0d01'
         '86d9ed2e61f1bd5032f52b9ab92a8090'
	 '1b9aea9a18e2314b34c020418ce3374d')
