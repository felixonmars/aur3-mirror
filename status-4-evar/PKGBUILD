# Contributor: WAntilles <wantilles@adslgr.com>

pkgname=status-4-evar
pkgver=4.0
status4evarver=2011.03.16.22
status4evarfilename=status_4_evar-$status4evarver-fx.xpi
status4evarID="status4evar@caligonstudios.com"
pkgrel=2
pkgdesc="Statusbar addon for Firefox Developer Previews & Betas from beta-7 and later"
arch=('any')
sourcetarballdir=https://addons.mozilla.org/firefox/downloads/file/114417
license=('MPL' 'GPL')
url="https://addons.mozilla.org/en-US/firefox/addon/235283/"
depends=('firefox>=4.0rc1')
groups=('firefox-essential-addons' 'firefox-best-addons')
source=($sourcetarballdir/$status4evarfilename)

build() {
    cd ${srcdir}
    install -m755 -d ${pkgdir}/usr/lib/firefox-$pkgver/extensions/$status4evarID
    cp -a * ${pkgdir}/usr/lib/firefox-$pkgver/extensions/$status4evarID
    rm -f ${pkgdir}/usr/lib/firefox-$pkgver/extensions/$status4evarID/$status4evarfilename
    cd ${pkgdir}/usr/lib/firefox-$pkgver/extensions/$status4evarID

    # Fix permissions
    find -type d -exec chmod 0755 \{\} \+
    find -type f -exec chmod 0644 \{\} \+
}

md5sums=('b74cccb254caabd1a93488758c660794')
