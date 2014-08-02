# Maintainer: Glen Oakley <goakley123@gmail.com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>

pkgname=cool-old-term-git
pkgrel=1
pkgver=0.9.r181.3d5ee0e
pkgdesc='A good looking terminal emulator which mimics the old cathode display'
arch=('i686' 'x86_64')
url='https://github.com/Swordifish90/cool-old-term'
license=('GPL' 'GPL3')
depends=('qt5-quickcontrols' 'qt5-graphicaleffects')
makedepends=('git')
source=("$pkgname::git://github.com/Swordifish90/cool-old-term.git")
md5sums=('SKIP')

pkgver () {
  cd "$srcdir/$pkgname"

  local v_ver=$(awk -F '"' '/version:/ {print $2}' app/ApplicationSettings.qml)
  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname/konsole-qml-plugin"

  qmake-qt5
  make
  make install
}

package() {
  cd "$srcdir/$pkgname"
  
  install -d "$pkgdir/usr/share/cool-old-term/" "$pkgdir/usr/bin"
  cp -a app imports "$pkgdir/usr/share/cool-old-term/"

  echo -e '#!/bin/bash\nqmlscene -I /usr/share/cool-old-term/{imports,app/main.qml}' > "$pkgdir/usr/bin/cool-old-term"
  chmod 755 "$pkgdir/usr/bin/cool-old-term"
}
