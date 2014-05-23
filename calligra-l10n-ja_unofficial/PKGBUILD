# Maintainer: nosada <nosada271@gmail.com>

pkgname=calligra-l10n-ja_unofficial
_pkgname=calligra-l10n-ja
pkgver=2.5.5
pkgrel=1
pkgdesc="Japanese Localization for Calligra (based on Koffice Localization)"
arch=('any')
url='http://www.calligra-suite.org/'
license=('LGPL')
makedepends=('cmake' 'automoc4' 'kdelibs')
options=('docs')

# Japanese localization isn't supported officially, so this PKGBUILD uses unofficial localization file.
# (http://running-dog.net/2012/06/post_329.html)
#source=("http://icmpv6.org/Prog/ja.po/${_pkgname}-${pkgver}.tar.bz2")
source=("http://download.kde.org/stable/calligra-2.5.5/calligra-l10n/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('f2b483f94fd60773c9a690ffe95d6040')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  replaces=('koffice-l10n-ja')
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
