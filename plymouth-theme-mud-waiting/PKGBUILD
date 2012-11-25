# Contributor:: Zsolt Udvari <udvzsolt gmail com>

pkgname="plymouth-theme-mud-waiting"
pkgver=0.1
pkgrel=1
url="http://kde-look.org/content/show.php/Plymouth+Theme+mud+Waiting?content=129717"
pkgdesc="Plymouth theme mud waiting"
arch=('any')
license=('GPL')
depends=('plymouth')
options=('')
source=("http://kde-look.org/CONTENT/content-files/129717-plymouth-theme-mud-waiting-0.1.tar.xz"
        "script-english-hun.patch")
md5sums=('1a113975501993b64e705fe38b300811')

build() {
    cd $srcdir/${pkgname}-${pkgver}
    patch < ../script-english-hun.patch
}
package() {
    cd $srcdir/${pkgname}-${pkgver}
    mkdir -p $pkgdir/usr/share/plymouth/themes/mud-waiting
    install -Dm644 * $pkgdir/usr/share/plymouth/themes/mud-waiting
}
md5sums=('1a113975501993b64e705fe38b300811'
         'afdd7fd5aa410a77f978cf7e88eda628')
