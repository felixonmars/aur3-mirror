# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Xilon <xilonmu@gmail.com>

pkgname=geh-git
pkgver=20090822
pkgrel=1
pkgdesc="A simple image viewer and background setter"
arch=('i686' 'x86_64')
url="http://pekwm.org/projects/5/"
license=('MIT')
depends=('gtk2>=2.8.0')
makedepends=('git' 'pkgconfig>=0.16')
provides=('geh')
conflicts=('geh')

_gitname=geh
_gitroot=http://projects.pekdon.net/git/geh.git

build() {
  cd "$srcdir"

  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin && cd ..
  else
    git clone $_gitroot
  fi
  
  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  sed -n '2,22 s/ \*[ ]*//p' src/main.c > license.txt
  ./autogen.sh && ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
