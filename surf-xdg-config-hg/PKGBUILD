# Contributor: Sietse van der Molen <sietse@vdmolen.eu>

pkgname="surf-xdg-config-hg"
pkgver=245
pkgrel=1
pkgdesc="It's a simple webbrowser which is based on webkit/gtk+. The latest hg pull patched to use XDG_CONFIG_HOME instead of HOME."
url="http://surf.suckless.org"
license=("MIT/X")
arch=("i686" "x86_64")
depends=("gtk2" "libwebkit" "xorg-xprop")
makedepends=("pkgconfig" "mercurial")
conflicts=("surf")
provides=("surf")
source=(xdgconfig.patch)
md5sums=('62bd199859888c966db8fd5db0f9bad1')

_hgroot="http://hg.suckless.org"
_hgrepo="surf"

build() {
  cd ${srcdir}
  
  if [ -d ${_hgrepo} ]; then
    cd ${_hgrepo}
    make clean
    hg pull -u
  else
    hg clone ${_hgroot}/${_hgrepo}
    cd ${_hgrepo}
  fi

  msg "Patching"
  patch -i $srcdir/xdgconfig.patch

  msg "Starting build process."
  make || return 1
  make PREFIX=/usr DESTDIR=${pkgdir} install || return 1
  install -Dm0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
