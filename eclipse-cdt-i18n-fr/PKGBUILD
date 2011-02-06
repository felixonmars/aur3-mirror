# Contributor: Damien Guihal <dguihal@gmail.com>
# Very heavily based on eclipse-cdt-i18n-pl by Piotr Beling <qwak@w8.pl>

pkgname=eclipse-cdt-i18n-fr
pkgver=3.4.0.v20090222043401
pkgrel=1
__lang=fr
__name=tools.cdt
pkgdesc="French language pack for eclipse IDE CDT plug-in"
url="http://babel.eclipse.org/"
depends=('eclipse>=3.4')
arch=('any')
source=("http://www.eclipse.org/downloads/download.php?r=1&file=/technology/babel/babel_language_packs/BabelLanguagePack-${__name}-${__lang}_${pkgver}.zip")
license=('EPL')
md5sums=('5983cfe3b06f7deeee1ef6bcbb0307d9')

build() {
	local eclipsedir=${pkgdir}/usr/share/	&& \
    install -d $eclipsedir			&& \
    cp -R ${srcdir}/eclipse $eclipsedir		|| return 1
}

