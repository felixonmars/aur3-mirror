# Maintainer: Rémy Oudompheng <remy@archlinux.org>
pkgname=godag-hg
pkgver=370
pkgrel=1
pkgdesc="Automatic building tool for Go language"
arch=(i686 x86_64)
url="http://code.google.com/p/godag/"
license=('GPL3')
depends=('go')
makedepends=('mercurial')
provides=('godag')
options=('!strip')

_hgroot="https://code.google.com/p"
_hgrepo="godag"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot/$_hgrepo ${_hgrepo}
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  source /etc/profile.d/go.sh
  if [[ "$CARCH" == "i686" ]]; then
      export GOARCH=386
  else
      export GOARCH=amd64
  fi
  bash build.sh build
}

package() {
  cd "$srcdir/$_hgrepo-build"
  install -D -m 755 gd ${pkgdir}/usr/bin/gd
  install -D -m 755 util/gd-completion.sh ${pkgdir}/etc/bash_completion.d/gd
  install -D -m 755 util/gdmk-completion.sh ${pkgdir}/etc/bash_completion.d/gdmk
  install -D -m 644 util/gd.1 ${pkgdir}/usr/share/man/man1/gd.1
  ln -sf gd.1 ${pkgdir}/usr/share/man/man1/godag.1
}

