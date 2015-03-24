# Maintainer: Charles Bos <charlesbos1 AT gmail

pkgname=libopensync-stable
_realname=libopensync
pkgver=0.22
pkgrel=6
pkgdesc='Stable version of the opensync synchronisation framework'
url='http://www.opensync.org'
license=('LGPL')
arch=('i686' 'x86_64')
makedepends=('python2')
depends=('glib2' 'libxml2' 'sqlite3')
optdepends=(
  'libopensync-plugin-file-stable: Allows applications using OpenSync to synchronise to and from files stored on disk.'
  'libopensync-plugin-gnokii-stable: This plugin allows syncing with some Nokia cell phones.'
  'libopensync-plugin-google-calendar-stable: Plugin for syncing with Google Calendar.'
)
conflicts=("${_realname}")
provides=("${_realname}=${pkgver}")
options=('!libtool')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/o/opensync/opensync_${pkgver}.orig.tar.gz)
sha256sums=('66a20a92ded9bd33176d4acce7b995b50840da44933febd59884c1132f9b6692')

prepare() {
  cd "${srcdir}/${_realname}-${pkgver}"

  # Disable Werror
  find /$(pwd) -type f -exec sed -i 's/-Werror//g' '{}' \;
}

build() {
  cd "${srcdir}/${_realname}-${pkgver}" 
  ./configure --prefix=/usr --libexecdir=/usr/lib/libopensync
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
