# Maintainer: renodesper <renodesper@fedoraproject.org>

pkgname=xcursor-lcd-blue
_pkgname=LCDBlue
pkgver=20091126
pkgrel=1
pkgdesc="Beautifully animated glass-like cursor with blue colors"
arch=('any')
url="http://kde-look.org/content/show.php/LCD+Blue?content=110432"
license=('GPL')
source=("http://kde-look.org/CONTENT/content-files/110432-$_pkgname.tar.gz")
md5sums=('277e2f26095a909fa2a2d348d3b50507')

build() {
    mkdir -p "$pkgdir/usr/share/icons"
    cp -r "$srcdir/$_pkgname" "$pkgdir/usr/share/icons"
}

