# Contributor: shamrok <szamrok@gmail.com>
# Contributor: Vladislav Glinsky <cl0ne[at]mithril.org.ua>

pkgname=kdeicons-bctangokde
pkgver=0.7
pkgrel=2
arch=('any')
pkgdesc="KDE Icon theme based on Tango project"
url="http://www.kde-look.org/content/show.php/BC+Tango+KDE?content=50036"
license=('CCPL')
source=("http://download.tuxfamily.org/bctangokde/bctangokde_$pkgver.tar.gz")
sha256sums=('6310b38d18c479bbbaa334e3f085cf9d0361a7e1cb1ac9a74cfae79644dd65c7')

prepare()
{
    rm "${srcdir}"/bctangokde/{changelog,credits,links}
}

package()
{
    install -dm755 "${pkgdir}/usr/share/icons/"
    cp -r "${srcdir}/"bctangokde "${pkgdir}"/usr/share/icons/bctangokde
}
