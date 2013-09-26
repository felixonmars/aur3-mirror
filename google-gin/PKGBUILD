# Maintainer: Chun Yang <x@cyang.info>
pkgname=google-gin
_pkgname=gin
pkgver=2.1.1
pkgrel=1
pkgdesc="Dependency injection for Google Web Toolkit client-side code"
arch=('any')
url="http://code.google.com/p/google-gin/"
license=('Apache')
depends=('gwt>=2.5' 'google-guice>=3.0' 'java-environment')
source=(http://${pkgname}.googlecode.com/files/${_pkgname}-${pkgver}.zip)
md5sums=('76d618f4abc09d84dbbd85efe932b1ea')

package() {
    # Copy gin jar
    install -dm755 $pkgdir/usr/share/java/$_pkgname-$pkgver
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}.jar \
        $pkgdir/usr/share/java/$_pkgname-$pkgver/

    # add symlink
    cd $pkgdir/usr/share/java
    ln -sv "/usr/share/java/$_pkgname-$pkgver" "$_pkgname"
}
