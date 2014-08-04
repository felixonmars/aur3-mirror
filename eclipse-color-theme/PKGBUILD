pkgname=eclipse-color-theme
pkgver=0.14.0.201407150859
pkgrel=1
pkgdesc="Color themes for Eclipse."
arch=('any')
url="http://www.eclipsecolorthemes.org/plugin"
license=('EPL')
depends=('eclipse')
makedepends=('unzip')
options=('!strip')
source=("http://eclipse-color-theme.github.io/update/eclipse-color-theme-update-site.zip")
md5sums=('aa7afdc79ff84d1b6740f4926a867633')

package() {
    cd "${srcdir}"
    rm -f *.*
    filename=$(find "features" -type f -exec basename {} \; | sed "s/\.jar//")
    unzip -d "features/${filename}" "features/${filename}.jar"
    rm "features/${filename}.jar"
    install -dm755 "${pkgdir}/usr/share/eclipse/"
    find . -type f -exec install -Dm644 {} \
        "${pkgdir}/usr/share/eclipse/{}" \;
}
