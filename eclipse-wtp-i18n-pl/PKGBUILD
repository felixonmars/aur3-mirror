# Contributor: Piotr Beling <qwak@w8.pl>

pkgname=eclipse-wtp-i18n-pl
pkgver=3.4.0.v20090524043402
pkgrel=1
__lang=pl
__name=webtools
pkgdesc="Polish language pack for eclipse IDE webtool plug-in"
url="http://babel.eclipse.org/"
depends=('eclipse-wtp')
arch=('any')
source=("http://www.eclipse.org/downloads/download.php?r=1&file=/technology/babel/babel_language_packs/BabelLanguagePack-${__name}-${__lang}_${pkgver}.zip")
license=('EPL')

build() {
    local eclipsedir=${pkgdir}/usr/share/eclipse/dropins	&& \
    install -d $eclipsedir			&& \
    cp -R ${srcdir}/eclipse $eclipsedir		|| return 1
}

md5sums=('117462bfbb7a27e5a0b5092df81a0067')
