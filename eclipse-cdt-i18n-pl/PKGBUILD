# Contributor: Piotr Beling <qwak@w8.pl>
# Maintainer: Noctivivans <noctivivans@gmail.com>

pkgname=eclipse-cdt-i18n-pl
pkgver=4.2.0.v20121016043401
pkgrel=1
__lang=pl
__name="tools.cdt"
__buildid=N20121016-0400
__relname=juno
pkgdesc="Polish language pack for eclipse IDE CDT plug-in"
url="http://babel.eclipse.org/"
depends=('eclipse-cdt')
arch=('any')
source=("http://build.eclipse.org/technology/babel/babel_language_packs/${__buildid}/${__relname}/BabelLanguagePack-${__name}-${__lang}_${pkgver}.zip")
license=('EPL')

build() {
    local eclipsedir=${pkgdir}/usr/share/eclipse/dropins && \
    install -d $eclipsedir			&& \
    cp -R ${srcdir}/eclipse $eclipsedir
}

md5sums=('f75cc76624a1d7dedc5c79e823f48f6e')
