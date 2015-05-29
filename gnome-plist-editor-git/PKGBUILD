# Maintainer: Tom Richards <tom@tomrichards.net>
# https://github.com/t-richards/aur-gnome-plist-editor-git
# Contributor: Matías Hernández <msdark@archlinux.cl>

pkgname=gnome-plist-editor-git
_pkgname=gnome-plist-editor
pkgver=r10.3e6fd48
pkgrel=1
pkgdesc="A GUI editor for Apple Property List files using libplist"
arch=('i686' 'x86_64')
url="http://cgit.sukimashita.com/gnome-plist-editor.git"
license=('GPL')
groups=('multimedia')
depends=('libplist' 'gtk2' 'desktop-file-utils')
makedepends=('hardening-wrapper' 'git' 'gnome-common')
provides=('gnome-plist-editor')
install=$_pkgname.install
source=(
  'git+http://git.sukimashita.com/gnome-plist-editor.git'
  'gnome-plist-editor.desktop'
  'gnome-plist-editor.png'
  'ui.patch'
)
sha256sums=('SKIP'
            'c98b1d02ff701c1cc59cb869761726e0bc3d5d6aaa671f3d3a5992992c27b03a'
            '41b43311571a532619e286185ec7195f050fd6fa9749e91250320e3accfd8f57'
            'd3b31029c279cc9ebb039560f2e08c8cb553ed1d61575bd519732f49669a0985')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -p1 < ../ui.patch
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "src/$_pkgname.ui" "$pkgdir/usr/share/$pkgname/$_pkgname.ui"

  cd "$srcdir"
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
