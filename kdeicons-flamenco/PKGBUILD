# Contributor: Jorge Mokross <mokross@gmail.com> 
# Contributor: Vladislav Glinsky <cl0ne[at]mithril.org.ua>

pkgname=kdeicons-flamenco
pkgver=0.6
pkgrel=2
arch=('any')
pkgdesc="KDE Icon theme based on Tango project, depends on BC Tango KDE Theme."
url="http://www.kde-look.org/content/show.php?content=44533"
license=('CCPL')
depends=('kdeicons-bctangokde')
source=("http://download.tuxfamily.org/bctangokde/flamenco_$pkgver.tar.gz")
sha256sums=('91b343aaba47708a0fbfa31b8a1e1d195fae7bad5d4f53512d574d78b5ca2d74')

prepare()
{
    rm "${srcdir}"/flamenco/{changelog,credits}
}

package()
{
    install -dm755 "${pkgdir}/usr/share/icons/"
    cp -r "${srcdir}/"flamenco "${pkgdir}"/usr/share/icons/flamenco-kde
}
