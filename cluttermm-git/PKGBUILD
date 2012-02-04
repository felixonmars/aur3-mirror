# $Id: $
# Contributor: Will Chappell <wtchappell@gmail.com>

pkgname=cluttermm-git
_gitname=cluttermm
pkgver=20101125
pkgrel=1
pkgdesc="C++ bindings for clutter."
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('atkmm' 'clutter' 'glibmm' 'pangomm' 'cairomm')
makedepends=('git' 'graphviz' 'mm-common-git')
_gitroot="git://git.gnome.org/cluttermm"


build() {

  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"


  cd "${srcdir}/$pkgname-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-maintainer-mode || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
