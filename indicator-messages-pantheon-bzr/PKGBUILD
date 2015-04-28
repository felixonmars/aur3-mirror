# Maintainer: Que Quotion <quequotion@mailinator.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>

pkgname=indicator-messages-pantheon-bzr
pkgver=r4
pkgrel=2
pkgdesc="A place on the user's desktop that collects messages that need a response"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-messages"
license=('GPL')
depends=('hicolor-icon-theme' 'libindicator3')
makedepends=('gobject-introspection' 'gtk-doc' 'intltool' 'vala')
provides=('indicator-messages' 'indicator-messages-pantheon')
conflicts=('indicator-messages')
groups=('pantheon')
install=indicator-messages.install
source=("bzr+lp:~elementary-os/elementaryos/os-patch-indicator-messages-trusty"
        '0001_autoconf.patch')
sha512sums=('SKIP'
            '75c5f0c2381b76b053ad980bc371772cbb6626ef5c7e01a3b212d42460ed8a5ea17c82ab8b6146992aca098c3a465b0b1075e460d2d5333ef6de193e5cf73e8a')

pkgver() {
  cd os-patch-indicator-messages-trusty

  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd "${srcdir}/os-patch-indicator-messages-trusty"

  patch -p1 -i "${srcdir}/0001_autoconf.patch"
}

build() {
  cd "${srcdir}/os-patch-indicator-messages-trusty"

  export CFLAGS="${CFLAGS} -Wno-error=deprecated-declarations -Wno-error=return-type"

  gtkdocize
  intltoolize -f
  autoreconf -vfi
  ./configure --prefix=/usr --libexecdir=/usr/lib/indicator-messages-pantheon --disable-static
  make
}

package() {
  cd "${srcdir}/os-patch-indicator-messages-trusty"

  make DESTDIR="${pkgdir}/" install

  rm -rf "${pkgdir}/usr/share/upstart/"
}

