# Maintainer: Gerasev Kirill <gerasev.kirill@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Ondrej Martinak <omartinak@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=vifm-rev-filter-git
pkgver=20121230
pkgrel=1
pkgdesc='Ncurses based file manager with vi like keybindings, with inverted :filter function'
arch=('i686' 'x86_64')
url='http://vifm.sourceforge.net/'
license=('GPL')
depends=('bash' 'ncurses')
makedepends=('git')
conflicts=('vifm' 'vifm-git')
provides=('vifm')
groups=('office')

_gitroot='git://vifm.git.sourceforge.net/gitroot/vifm/vifm'
_gitname='vifm'

source=(
        filter.patch
        )
sha256sums=(
            '34fb4245da7bfc8087cb9b4fc96f8b1b2e0f2cde2ce0c392fa4f25ecd9034dd9'
            )


build() {
  msg "Connecting to GIT server..."

  if [ -d $_gitname ]; then
    cd $_gitname
    git pull origin
  else
    git clone --depth 1 $_gitroot
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  
  rm -rf "$srcdir/$_gitname-build"
  cp -R  "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  patch -Np1 -i   ../../filter.patch
  ./autogen.sh
  ./configure --prefix=/usr 
  make 
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install

# license
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname%-*}/COPYING 
}

