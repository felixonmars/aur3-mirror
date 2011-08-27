#based on the original pkgbuild of SiD

pkgname=cleanhaven
pkgver=2.2
pkgrel=1
pkgdesc="a program designed to make the cleaning of text much easier"
arch=('i686' 'x86_64')
depends=()
license=('unknown')
url="http://www.holymackerelsoftware.com/CleanHaven/CleanHaven.html"
makedepends=('unzip')
source=(http://www.holymackerelsoftware.com/Updates/CleanHaven/CleanHavenLinux.zip
        cleanhaven.sh
        cleanhaven.png
        cleanhaven.desktop)
md5sums=('510bfe25f569dae1a97f99fd5eb227b9'
         '9484e0a5cf0e8a8b1eb8865a5e3b57eb'
         '6dc52b6fe7ef5e70ed910fb016d31c97'
         'ec8f97312f3616a9f652b386a2817f3c')

build() {
    cd $srcdir
    mkdir -p $pkgdir/opt/cleanhaven
    mkdir -p $pkgdir/usr/bin
    cp -r CleanHaven/* $pkgdir/opt/cleanhaven

    install -m 0755 $srcdir/cleanhaven.sh $pkgdir/usr/bin/cleanhaven

  # Freedesktop compatibility
    install -D cleanhaven.png ${pkgdir}/usr/share/icons/cleanhaven.png
    install -D cleanhaven.png ${pkgdir}/usr/share/pixmaps/cleanhaven.png
    install -D cleanhaven.desktop ${pkgdir}/usr/share/applications/cleanhaven.desktop

}
