pkgname=tworld2
pkgver=2.1.0
pkgrel=1
pkgdesc="A Chip's Challenge clone."
url="http://www.pillowpc2001.net/TW2/about.html"
arch=(i686 x86_64)
depends=(sdl qt4 qtchooser)
license=(GPL)
source=(http://www.pillowpc2001.net/TW2/tworld-$pkgver.tar.gz
        tworld2.desktop
        tworld2.png
        destdir.patch
        tworld2-iceblock.patch)
md5sums=('dd4cfdd99214cf14f8cb8b5b9d2d8125'
         '23f6d6bc8180d9e54171d03f32b0ca10'
         '88f3904891fda2454c297eb447c21e21'
         '4002dff06ae30c1f256e46e07fe04deb'
         '7fc71ca3d3cb9c92d96e54473f041bb0')
sha1sums=('05e5acc0f4c25d4caef153f4be788387286b58fe'
          'aa67869f1427faa4564c20296e2f465dfdef8aca'
          '5a398a2a0a3e00ceb4b85837790bf567efff0e63'
          '2fb852bdb275c2a264798071ae062d37097dbb63'
          '99f0f9c41d1af8a6b1cccb50beed6c969e9bc0e8')

prepare() {
    cd tworld-$pkgver
    patch -p1 < ../../destdir.patch
    patch -p1 < ../../tworld2-iceblock.patch
}

build() {
    cd tworld-$pkgver
    QT_SELECT=4 make || return 1
}

package() {
    cd tworld-$pkgver
    DESTDIR="$pkgdir/" make install

    cd ..
    install -Dm644 tworld2.desktop "$pkgdir/usr/share/applications/tworld2.desktop"
    install -Dm644 tworld2.png "$pkgdir/usr/share/pixmaps/tworld2.png"
}
