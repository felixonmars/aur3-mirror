# Prey for ArchLinux
# Copyright © 2010, Fork Ltd.
# Released under the GPLv3 license.
# For full details see the LICENSE file included in this distribution.

pkgname=prey-git
pkgver=20140424
pkgrel=1
pkgdesc="Prey is a lightweight application that will help you track and find your laptop if it ever gets stolen."
arch=('any')
url="http://preyproject.com"
license=('GPL')
depends=('xawtv' 'scrot' 'perl-net-ssleay' 'perl-io-socket-ssl')
makedepends=('git')
provides=('prey')
conflicts=()
replaces=()
backup=()
options=()
install=prey.install
source=('prey::git+git://github.com/tomas/prey.git')
md5sums=('SKIP')

#pkgver() {
#	cd "prey"
#	echo "$(git describe --tags)" | sed -e 's|-|\.r|g'
#}

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/prey"
  mkdir -p "${pkgdir}/usr/share/prey/modules/"
  cp -R "${srcdir}/prey" "${pkgdir}/usr/share"
}
