# Maintainer: Sandor Czettner <sandor at czettner.hu>

pkgname=drupal-console
pkgver=0.7.2
pkgrel=1
pkgdesc="The Drupal Console is an effort to bring The Symfony Console Component to Drupal 8."
arch=('any')
url="https://github.com/hechoendrupal/DrupalAppConsole"
license=('MIT')
depends=('php' 'bash')

source=(
    "https://github.com/hechoendrupal/DrupalAppConsole/releases/download/$pkgver/console.phar"
)

md5sums=(
    'ca1166c4316ec268333842fa4c15681e'
)

package() {
    # install Drupal Console
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/lib"
    chmod 755 console.phar
    cp console.phar "${pkgdir}/usr/lib/${pkgname}"
    ln -s "/usr/lib/${pkgname}" "${pkgdir}/usr/bin/drupal"
}
