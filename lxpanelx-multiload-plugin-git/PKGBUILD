# Maintainer:Vadim Ushakov < igeekless@gmail.com >
pkgname=lxpanelx-multiload-plugin-git
pkgver=20130503
pkgrel=1
pkgdesc="Multiload plugin for lxpanelx"
arch=('i686' 'x86_64')
url="https://github.com/geekless/multiload-nandhp"
license=('GPL')
depends=('lxpanelx' 'gtk2>=2.14.0' 'libgtop')
makedepends=('autoconf' 'automake' 'gcc' 'intltool' 'libtool' \
	     'make' 'pkgconfig' 'git')
options=('!libtool')
provides=('lxpanelx-multiload-plugin')
source=('git+https://github.com/geekless/multiload-nandhp.git')
md5sums=('SKIP')

_gitname='multiload-nandhp'

pkgver() {
  date +%Y%m%d
}

build() {
  cd ${_gitname}

  msg "Starting make..."

  # Generating building system
  ./autogen.sh || return 1

  ./configure --prefix=/usr \
              --libexec=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --disable-maintainer-mode \
              --enable-silent-rules \
              --with-lxpanelx \
              --without-lxpanel \
              --without-xfce4

  make || return 1
}

package() {
  cd ${_gitname}
  make DESTDIR=${pkgdir} install || return 1
}
