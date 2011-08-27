# $Id: PKGBUILD 115269 2011-03-17 16:14:58Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <Alexander@archlinux.org

pkgname=xf86-input-evdev-ahm-git
pkgver=20110603
pkgrel=1
pkgdesc="X.org evdev input driver - at home modifier patch"
arch=(i686 x86_64)
url="https://gitorious.org/at-home-modifier"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel')
conflicts=('xorg-server<1.10.0' 'xf86-input-evdev')
provides=('xf86-input-evdev')
groups=('xorg-drivers' 'xorg')
install=ahm.install
_gitroot='git://gitorious.org/at-home-modifier/at-home-modifier.git'
_gitname='at-home-modifier'

build() {
  cd "${srcdir}"

  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin && cd ..
  else
    git clone $_gitroot
  fi

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build

  cd "$_gitname-build/"
  ./autogen.sh --prefix="/usr"
  make
}

package() {
  cd "$srcdir/$_gitname-build/"
  make DESTDIR="$pkgdir" install
}
