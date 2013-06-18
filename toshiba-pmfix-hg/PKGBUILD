# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=toshiba-pmfix-hg
pkgver=1
pkgrel=1
pkgdesc='Toshiba "suspend only once" ACPICA fix as kernel module'
arch=('i686' 'x86_64')
url='https://code.google.com/p/toshiba-pmfix/'
license=('GPL')
depends=('linux>=3.9.5' 'linux<3.9.6')
makedepends=('mercurial')
options=()
install='toshiba-pmfix-hg.install'

_hgroot='https://code.google.com/p/toshiba-pmfix/'
_hgrepo='toshiba-pmfix'

build() {
  cd "$srcdir"
  msg 'Connecting to Mercurial server...'

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg 'The local files are updated.'
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg 'Mercurial checkout done or server timeout.'
  msg 'Starting build...'

  make all
}

package() {
  cd "$srcdir/$_hgrepo"
  install -Dm755 toshiba-pmfix.ko \
      "$pkgdir/usr/lib/modules/$(uname -r)/extra/toshiba-pmfix.ko"

  # autoload module
  mkdir -p "$pkgdir/etc/modules-load.d"
  echo $_hgrepo > "$pkgdir/etc/modules-load.d/$_hgrepo.conf"
}

