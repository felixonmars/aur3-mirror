
# Contributor: Denis Martinez <deuns.martinez AT gmail DOT com>
pkgname=gentoo-sandbox
_pkgname=sandbox
pkgver=1.2.18.1
pkgrel=1
pkgdesc="sandbox'd LD_PRELOAD hack"
arch=('i686' 'x86_64')
url="http://www.gentoo.org/"
license=('GPL')
groups=()
depends=('glibc')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://gd.tuwien.ac.at/opsys/linux/gentoo/distfiles/${_pkgname}-${pkgver}.tar.bz2)
noextract=()
md5sums=('8637808ea8fa55fe10c57d335911e847')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install

  cat << EOF > "$pkgdir/usr/share/sandbox/functions"
# sandbox support functions
addread() {
  if [[ -z \$1 || -n \$2 ]]; then
    echo "Usage: addread <colon-delimited list of paths>"
    return 1
  fi
  export SANDBOX_READ="\$SANDBOX_READ:\$1"
}

addwrite() {
  if [[ -z \$1 || -n \$2 ]]; then
    echo "Usage: addwrite <colon-delimited list of paths>"
    return 1
  fi
  export SANDBOX_WRITE="\$SANDBOX_WRITE:\$1"
}

adddeny() {
  if [[ -z \$1 || -n \$2 ]]; then
    echo "Usage: adddeny <colon-delimited list of paths>"
    return 1
  fi
  export SANDBOX_DENY="\$SANDBOX_DENY:\$1"
}

addpredict() {
  if [[ -z \$1 || -n \$2 ]]; then
    echo "Usage: addpredict <colon-delimited list of paths>"
    return 1
  fi
  export SANDBOX_PREDICT="\$SANDBOX_PREDICT:\$1"
}
EOF

}

# vim:set ts=2 sw=2 et:
