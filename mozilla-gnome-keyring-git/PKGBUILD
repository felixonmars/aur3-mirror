# Maintainer: Anshuman Bhaduri <anshuman dot bhaduri0 at gmail dot com>
# Contributor: bzt <unmacaque@gmail.com>

_pkgname=mozilla-gnome-keyring
pkgname=${_pkgname}-git
pkgver=115.89651d8
pkgrel=1
pkgdesc='Mozilla extension to store passwords and form logins in gnome-keyring.'
arch=('i686' 'x86_64')
url='http://github.com/infinity0/mozilla-gnome-keyring'
license=('GPL')
depends=('gnome-keyring' 'firefox>=27.0')
makedepends=('zip' 'unzip' 'xulrunner>=27.0' 'git' 'libgnome-keyring')
provides=('mozilla-gnome-keyring' 'firefox-gnome-keyring')
conflicts=('mozilla-gnome-keyring' 'firefox-gnome-keyring')
replaces=('firefox-gnome-keyring-git')
source=('git://github.com/infinity0/mozilla-gnome-keyring.git'
        'firefox27.patch')
sha1sums=('SKIP'
          '1342705b26bef15933826af0e701a5ea3382e54c')

_uuid={6f9d85e0-794d-11dd-ad8b-0800200c9a66}

pkgver() {
  cd "${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 -i "${srcdir}/firefox27.patch"
  make
}

package() {
  mkdir -p "${pkgdir}/usr/lib/firefox/browser/extensions"
  unzip "${srcdir}/${_pkgname}/mozilla-gnome-keyring-*.xpi" \
    -d "${pkgdir}/usr/lib/firefox/browser/extensions/${_uuid}"
}
