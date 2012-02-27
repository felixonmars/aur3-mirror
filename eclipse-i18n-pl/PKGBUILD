# Contributor: Piotr Beling <qwak@w8.pl>

pkgname=eclipse-i18n-pl
pkgver=3.7.0.v20111128043401
pkgrel=1
__lang=pl
__name=eclipse
pkgdesc="Polish language pack for eclipse IDE"
url="http://babel.eclipse.org/"
depends=('eclipse>=3.7')
arch=('any')
source=("http://download.eclipse.org/technology/babel/babel_language_packs/R0.9.1/indigo/BabelLanguagePack-${__name}-${__lang}_${pkgver}.zip")
license=('EPL')

build() {
    local eclipsedir=${pkgdir}/usr/share/eclipse/dropins	&& \
    install -d $eclipsedir			&& \
    cp -R ${srcdir}/eclipse $eclipsedir/$pkgname || return 1
}

md5sums=('8de606d76c382a53a0b4ea73c31cdf11')
