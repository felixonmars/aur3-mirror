# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=nemo-preview
pkgname=${_pkgname}-git
pkgver=66.6260e27
pkgrel=1
pkgdesc="Nemo preview (Sushi fork)"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL')
depends=('clutter-gtk' 'clutter-gst' 'cjs' 'libmusicbrainz5' 'webkitgtk3' 'gtksourceview3' 'evince')
makedepends=('intltool' 'gobject-introspection')
install=${_pkgname}.install
options=('!libtool' '!emptydirs')
source=("git+https://github.com/linuxmint/nemo-extensions.git")

pkgver() { 
  cd "$srcdir"/nemo-extensions
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir"/nemo-extensions/${_pkgname}

  ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/nemo-preview
  make
}

package() {
  cd "$srcdir"/nemo-extensions/${_pkgname}
  make DESTDIR="${pkgdir}" install
}

sha256sums=('SKIP')
