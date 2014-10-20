# Maintainer:  Jesse Jaara    <jesse.jaara@gmail.com>
# Contributor: Vaino Helminen <vah78@yahoo.com>

pkgname=funnyboat
pkgver=1.5
pkgrel=5
pkgdesc="A funny little side scrolling game featuring a steam boat."
arch=('any')
url="http://funnyboat.sourceforge.net/"
license=('GPL' 'MIT')
depends=('python2-pygame' 'python2-numpy')
source=(http://downloads.sourceforge.net/project/funnyboat/funnyboat/${pkgver}/funnyboat-${pkgver}-src.zip
        funnyboat.starter
        funnyboat.desktop)

package() {
  mkdir -p "${pkgdir}/usr/share/funnyboat/data"

  install -D -m0644 "${srcdir}/funnyboat/"*.py              "${pkgdir}/usr/share/funnyboat/"
  install -D -m0644 "${srcdir}/funnyboat/data/"*            "${pkgdir}/usr/share/funnyboat/data/"
  install -D -m0755 "${srcdir}/funnyboat.starter"           "${pkgdir}/usr/bin/funnyboat"
  install -D -m0644 "${srcdir}/funnyboat.desktop"           "${pkgdir}/usr/share/applications/funnyboat.desktop"
  install -D -m0644 "${srcdir}/funnyboat/data/kuvake.png"   "${pkgdir}/usr/share/pixmaps/funnyboat.png"
  install -D -m0644 "${srcdir}/funnyboat/LICENSE-MEDIA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE-MEDIA.txt"
}

md5sums=('71724a755614c286bd861864bd0062a6'
         'fad04e511e60742871655794fb4f2216'
         'c9ea37457cd2fc27c19f3b926e9a89c3')
