#Maintainer: Pierpaolo Frasa <pfrasa@gmail.com>

pkgname=reread-git
pkgver=r9.901c5f6
pkgrel=1
pkgdesc="Yet Another Hacker News Reader"
arch=('any')
url='https://github.com/sorpaas/reread'
provides=('reread')
license=('MIT')
depends=('docker')
makedepends=('git')
source=("$pkgname::git+https://github.com/sorpaas/reread.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # wrapper to ask for sudo: docker needs sudo
  echo -e "#!/bin/bash
if [ \$EUID != 0 ]; then
  sudo \"\$0\" \"\$@\"
  exit \$?
fi
  
. /opt/$pkgname/build.sh" > "$srcdir/wrapper"
}

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"

  cp -R "$srcdir/$pkgname" "$pkgdir/opt"
  rm -rf "$pkgdir/opt/$pkgname/.git"
  rm "$pkgdir/opt/$pkgname/LICENSE"
  install -D -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp "$srcdir/wrapper" "$pkgdir/usr/bin/reread"

  chmod +x "$pkgdir/opt/$pkgname/build.sh"
  chmod +x "$pkgdir/usr/bin/reread"
}
