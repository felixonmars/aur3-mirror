# Contributor Madek <gonzaloseguel@gmail.com>

pkgname=rhythmbox-indicator-plugin
pkgver=0.13.2
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="indicator plugin for rhythmbox"
url="http://gaim-libnotify.sourceforge.net/"
license=('GPL')
depends=('rhythmbox' 'indicator-sound')
makedepends=('libtool' 'intltool')
replaces=()
conflicts=()
provides=()

_arch='i386'
[ "${CARCH}" = 'x86_64' ] && _arch='amd64'
source=(http://archive.ubuntu.com/ubuntu/pool/main/r/rhythmbox/rhythmbox-plugins_${pkgver}-0ubuntu2_${_arch}.deb)
md5sums=('e4e1f40cc5d506febf89bb2a06835fd6')
[ "${CARCH}" = 'x86_64' ] && md5sums='83e870468cf0f516265a0fbc45daa19b'


build() {
deb2targz rhythmbox-plugins_${pkgver}-0ubuntu2_${_arch}.deb
tar xzf rhythmbox-plugins_${pkgver}-0ubuntu2_${_arch}.tar.gz
install -d 644 ${pkgdir}/usr/lib/rhythmbox/plugins/
cp -r ${srcdir}/usr/lib/rhythmbox/plugins/ayatana ${pkgdir}/usr/lib/rhythmbox/plugins/ayatana
}
