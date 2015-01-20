# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
# Contributor: Vladislav Glinsky <cl0ne[at]mithril.org.ua>
pkgname=kdeicons-tangoish-kde
pkgver=0.4
pkgrel=4
pkgdesc="Tango and Tango-style icons for KDE 4."
arch=('any')
url="http://www.kde-look.org/content/show.php?content=97931"
license=('custom')
makedepends=('unzip')
source=('http://fc04.deviantart.com/fs40/f/2009/054/e/e/Tangoish_KDE_by_Shirakawasuna.zip')
md5sums=('5750cfa34b0bdae0f52b981b5be7afaf')

prepare()
{
    tar xvf "${srcdir}/tangoish-kde-$pkgver.tar.gz"
    mv "${srcdir}/tangoish-kde-$pkgver"/licenses "${srcdir}"
    rm "${srcdir}/tangoish-kde-$pkgver"/{missing,screenshot1.png,changelog,links}
    find "${srcdir}/tangoish-kde-$pkgver" -name '.directory' -delete
}

package()
{
    install -dm755 "${pkgdir}/usr/share/icons/"
    cp -r "${srcdir}/tangoish-kde-$pkgver" "${pkgdir}"/usr/share/icons/tangoish-kde || return 1
    install -Dm644 "${srcdir}"/licenses "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
