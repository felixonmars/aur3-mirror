# Contributor: WAntilles <wantilles@adslgr.com>

pkgname=tabmixplus-beta
pkgver=4.0
tabmixplusver=0.3.8.6pre.110311a
tabmixplusfilename=tab_mix_plus-$tabmixplusver.xpi
tabmixplusID="{dc572301-7619-498c-a57d-39143191b318}"
pkgrel=2
pkgdesc="TabMixPlus development version for Firefox Developer Previews & Betas"
arch=('any')
license=('MPL' 'GPL')
url="http://tmp.garyr.net/"
depends=('firefox>=4.0rc1')
groups=('firefox-essential-addons' 'firefox-best-addons')
source=(http://tmp.garyr.net/dev-builds/$tabmixplusfilename)

build() {
    cd ${srcdir}
    install -m755 -d ${pkgdir}/usr/lib/firefox-$pkgver/extensions/$tabmixplusID
    cp -a * ${pkgdir}/usr/lib/firefox-$pkgver/extensions/$tabmixplusID
    rm -f ${pkgdir}/usr/lib/firefox-$pkgver/extensions/$tabmixplusID/$tabmixplusfilename
    cd ${pkgdir}/usr/lib/firefox-$pkgver/extensions/$tabmixplusID

    # Fix permissions
    find -type d -exec chmod 0755 \{\} \+
    find -type f -exec chmod 0644 \{\} \+
}

md5sums=('c7390b6449deab6348538f31cc557e73')
