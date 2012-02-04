# Maintainer Piotr Rudzki <ryba.lodz@gmail.com>
# Based on PKGBUILD swiftfox3-i18 maintained by Ambi 
pkgname=swiftfox3-i18n-pl
pkgver=3.0.1pre
_firefoxver=3.0.1
pkgrel=1
_languages=pl
pkgdesc="Polish language pack for Swiftfox3"
arch=('i686')
license=('MPL')
url="http://www.getswiftfox.com"
depends=("swiftfox>=${pkgver}")
eval conflicts=(mozilla3-swiftfox-i18n mozilla3-swiftfox-${_languages} swiftfox3-${_languages} swiftfox3-i18n swiftfox-i18n)
replaces=("swiftfox3-i18n" "swiftfox3-l10n")
makedepends=('unzip')
source=()
eval source=(ftp://ftp.mozilla.org/pub/firefox/releases/${_firefoxver}/linux-i686/xpi/${_languages}.xpi)

md5sums=('a88980f26cddd5b77f415f94408e10cc')

build() {
  cd ${startdir}/src
  for lang in $(echo "${_languages}" | sed 's|,| |g'); do
    unzip -o ${lang}.xpi
    sed -i "s|jar:chrome/${lang}.jar|jar:${lang}.jar|" chrome.manifest || return 1
    install -D -m 644 chrome/${lang}.jar ${startdir}/pkg/opt/swiftfox/chrome/${lang}.jar || return 1
    install -D -m 644 chrome.manifest ${startdir}/pkg/opt/swiftfox/chrome/${lang}.manifest || return 1
  done
}
