# Maintainer: Perberos <perberos@gmail.com>
pkgname=mate-mime-data
pkgver=20130101
pkgrel=1
pkgdesc="The base MIME and Application database for MATE"
url="https://github.com/mate-desktop/mate-mime-data"
arch=('any')
license=('GPL')
depends=('shared-mime-info')
makedepends=('intltool')
groups=('mate')
source=()
sha256sums=()

_gitroot=git://github.com/mate-desktop/mate-mime-data.git
_gitname=mate-mime-data

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/lib"
  mv "${pkgdir}/usr/share/pkgconfig" "${pkgdir}/usr/lib/"
}
