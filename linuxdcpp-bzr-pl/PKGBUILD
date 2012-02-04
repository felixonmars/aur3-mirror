# Contributor: 3ED <krzysztof1987@gmail.com>
pkgname=linuxdcpp-bzr-pl
pkgver=20110418
pkgrel=1.0000
pkgdesc="Polish language pack for linuxdcpp (exported from launchpad)"
arch=('any')
url="https://translations.launchpad.net/linuxdcpp/trunk"
license=('GPL')
depends=('linuxdcpp-bzr>=406')
makedepends=('gettext')
source=(po_linuxdcpp-pl.po)
install=po_upgrade.install
sha256sums=('90176e8a4a68bbe217d136c1015968d423dd389e0004b72c91877a624e0fa7f3')

build() {
  cd "$srcdir"

  msgfmt -c "$srcdir/po_linuxdcpp-pl.po" -o "$srcdir/linuxdcpp.mo"
  install -dm755 "$pkgdir/usr/share/locale/pl/LC_MESSAGES/"
  install -m 644 "$srcdir/linuxdcpp.mo" \
    "$pkgdir/usr/share/locale/pl/LC_MESSAGES/linuxdcpp-latest.mo"
}

#$cat=i18n
