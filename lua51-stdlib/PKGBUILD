# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

pkgname='lua51-stdlib'
_pkgname=${pkgname/51/}
pkgver='40'
pkgrel='3'
pkgdesc='Standard library for Lua'
arch='any'
url="http://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
depends=('lua51')
source=("http://github.com/${_pkgname}/${_pkgname}/archive/release-v${pkgver}.zip"
        'totable.patch')

sha512sums=('02d1bbbc6bc35dbcc6fb0bcac85b30b14cb60c8e029deb5d41be8479de79546bcc86b1809321100cc2e230f4ffe64cf6ea147fdc536137544f8f9b1e7049404c'
            'f7cdffdcde05ebef4825f85f2fc489b5800eda5a3a06af74b5a00ef790d24866c445e6155889c9356c29664e5757433958037f5b6b854268b098eedeb8be9614')

prepare () {
  cd "${_pkgname}-release-v${pkgver}/lib"
  patch -p0 < "${srcdir}/totable.patch"
}

build() {
  cd "${_pkgname}-release-v${pkgver}"
  LUA=lua5.1 ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname}-release-v${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING \
	  "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	mv "${pkgdir}"/usr/share/doc/{stdlib,${pkgname}}
}
