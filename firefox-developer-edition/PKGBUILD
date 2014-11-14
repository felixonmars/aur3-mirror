pkgname=firefox-developer-edition
pkgver=latest
pkgrel=1
arch=('x86_64')
url='https://www.mozilla.org/en-US/firefox/developer/?utm_source=hacks-mozilla-org%20&utm_medium=referral&utm_campaign=FX10&utm_content=fxdev-hacksblogannouncement'
license=('MPL' 'GPL' 'LGPL')
depends='hicolor-icon-theme'
package() {
    rm -rf *
    filename=`date +'%F.tar.bz2'`
    wget -O $filename 'https://download.mozilla.org/?product=firefox-aurora-latest-ssl&os=linux64&lang=en-US'
    tar xvjf $filename
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/firefox-developer-edition
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/16x16/apps
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/32x32/apps
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/48x48/apps
    cp -dr --no-preserve=ownership ${srcdir}/firefox/*  ${pkgdir}/usr/share/firefox-developer-edition
    cp ${pkgdir}/../../firefox-developer-edition.desktop ${pkgdir}/usr/share/applications/
    cp ${pkgdir}/usr/share/firefox-developer-edition/browser/chrome/icons/default/default16.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/firefox-developer-edition.png
    cp ${pkgdir}/usr/share/firefox-developer-edition/browser/chrome/icons/default/default32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/firefox-developer-edition.png
    cp ${pkgdir}/usr/share/firefox-developer-edition/browser/chrome/icons/default/default48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/firefox-developer-edition.png
    ln -s ../share/firefox-developer-edition/firefox ${pkgdir}/usr/bin/firefox-developer-edition
}
