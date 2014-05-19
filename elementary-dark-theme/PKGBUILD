# Mantainer: ~Smlb <smlb at riseup dot net>

pkgname=elementary-dark-theme
pkgver=1.0
pkgrel=1
pkgdesc="elementary Dark is a soft and subtle dark theme based on the higly popular elementary theme"
arch=(any)
url=http://fc00.deviantart.net/fs70/f/2012/164/2/0/elementary_dark___gtk3_theme_by_satya164-d41fakm.zip
license=(custom)
#source=($pkgname-$pkg.zip)

package() {
    wget -q http://fc00.deviantart.net/fs70/f/2012/164/2/0/elementary_dark___gtk3_theme_by_satya164-d41fakm.zip
    mv elementary_dark___gtk3_theme_by_satya164-d41fakm.zip pkg.zip
    unzip -q pkg.zip && mv "elementary Dark" elementary-dark-theme-$pkgver
    install -d "$pkgdir"/usr/share/themes/
    cp -rf $pkgname-$pkgver/ "$pkgdir"/usr/share/themes/$_pkgname/
}

