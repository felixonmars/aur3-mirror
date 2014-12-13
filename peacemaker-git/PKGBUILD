# Maintainer: Sergey Shepelev <temotor@gmail.com>

pkgname=peacemaker-git
pkgver=20141213
pkgrel=2
pkgdesc="Kill processes that abuse system resources"
arch=('x86_64' 'i686')
url="https://github.com/temoto/peacemaker"
license=('MIT')
depends=('go')
makedepends=('git')
options=('!strip' '!emptydirs')
_gourl=github.com/temoto/peacemaker

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

check() {
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

  # install systemd "unit" files
  install -DT -m644 "$srcdir/src/$_gourl"/peacemaker.service \
    "$pkgdir"/usr/lib/systemd/system/peacemaker.service

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}

# vim:set ts=2 sw=2 et:
