
# Contributor: imagelife <lovelinux229@gmail.com>
# thanks Damien Guihal <dguihal@gmail.com>,this pkgbuild is modified
# his eclipse-i18n-de pkgbuild.
# Very heavily based on eclipse-cdt-i18n-pl by Piotr Beling <qwak@w8.pl>

__lang=zh
__name=eclipse
pkgname=${__name}-i18n-${__lang}
pkgver=3.6.0.v20100814043401
pkgrel=1
pkgdesc="Simplified Chinese language pack for eclipse IDE"
arch=('any')
url="http://babel.eclipse.org/"
license=('EPL')
depends=('eclipse>=3.6')
source=("http://www.eclipse.org/downloads/download.php?r=1&file=/technology/babel/babel_language_packs/R0.8.0/BabelLanguagePack-${__name}-${__lang}_${pkgver}.zip")
md5sums=('446c7b82584a40572517977e2fc74d3d')

build() {
	local eclipsedir=${pkgdir}/usr/share/	&& \
    install -d $eclipsedir			&& \
    cp -R ${srcdir}/eclipse $eclipsedir		|| return 1
}

