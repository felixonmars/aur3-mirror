# Contributor: Kniyl <mathias.ettinger@gmail.com>
# Contributor: M4rQu1Nh0S <zonadomarquinhos@gmail.com>

pkgname=nmpfront-git
_gitname=nmpfront
pkgver=1
pkgrel=1
# The pkgver function will break the date ordering of the
# previous pkgver variable. Epoch will help to fix it.
epoch=1
pkgdesc="Noname is a MPlayer GTK+ Front-end"
arch=('i686' 'x86_64')
url="http://nmpfront.sourceforge.net/"
license=('GPL3')
depends=('gtk2')
makedepends=('git' 'intltool')
optdepends=('mplayer2: Mplayer with advanced general-purpose media player')
source=("git://${_gitname}.git.sourceforge.net/gitroot/${_gitname}/${_gitname}" 'fixes.patch')
md5sums=('SKIP' '1aa5b3a497b351026f46760609bf0286')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"
  patch -Np0 < "${srcdir}/fixes.patch"
}

build() {
  cd "${srcdir}/${_gitname}"

  aclocal
  autoconf
  ./autogen.sh CFLAGS="-lpthread -lm" --prefix=/usr --docdir=/usr/share/doc

  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="$pkgdir/" install
}
