# Maintainer: Silvio Knizek <killermoehre@gmx.net>
# Contributor: Diego <cdprincipe@at@gmail@dot@com>
# Contributor: Baurzhan Muftakhidinov <baurthefirst@gmail.com>

_pkgname=thunar-vcs-plugin
pkgname=${_pkgname}-git
pkgver=0.1.4.r262.g995b11d
pkgrel=1
pkgdesc="SVN and GIT integration for Thunar."
arch=(i686 x86_64)
license=('GPL2')
url="http://goodies.xfce.org/projects/thunar-plugins/thunar-vcs-plugin"
groups=('xfce4-goodies')
depends=('thunar' 'git' 'subversion' 'apr')
makedepends=('intltool' 'pkgconfig' 'xfce4-dev-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("git://git.xfce.org/thunar-plugins/${_pkgname}")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long | sed -r "s/^${_pkgname}-//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/${_pkgname}"
  
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-git \
    --enable-subversion \
    --disable-debug
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
