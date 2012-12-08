# Contributor: Kaos < gianlucaatlas_AT_gmail_DOT_com >
# Contributor: Radu Andries < admiral0_AT_tuxfamily_DOT_org >
# Maintainer:  Federico Cinelli

pkgname=xf86-input-synaptics-multitouch-git
pkgver=20121207
pkgrel=1
pkgdesc="Synaptics driver for notebook touchpads"
arch=('any')
url="http://w1.894.telia.com/~u89404340/touchpad/"
license=('custom')
depends=('libxi>=1.2.1' 'libxtst')
makedepends=('pkgconfig' 'xorg-server' 'git' 'xorg-util-macros' 'xorg-server-devel')
provides=('synaptics' 'xf86-input-synaptics')
conflicts=('synaptics')
groups=('xorg-input-drivers')
options=(!libtool)
source=(11-x11-synaptics.fdi multitouch.patch)
md5sums=('3578ce95cf437fa930ede2daaac4bf4a'
         'bc575095d5cb4f66605f9bef0ddbef1c')

_gitroot="git://anongit.freedesktop.org/xorg/driver/xf86-input-synaptics"
_gitname="xf86-input-synaptics"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d "$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" 
    cd "$_gitname"
    patch -Np1 "$srcdir/multitouch.patch"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  make
}
package() {
  make -C "$srcdir/$_gitname-build" PREFIX=/usr  DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/share/hal/fdi/policy/10osvendor"
  install -m644 $srcdir/11-x11-synaptics.fdi "$pkgdir/usr/share/hal/fdi/policy/10osvendor/" 
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
} 
