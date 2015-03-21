# Maintainer: David Manouchehri <david@davidmanouchehri.com>
# Former Maintainer/Contributor: Paul Burton <paulburton89@gmail.com>

pkgname=ejtagproxy-svn
_pkgname=$(printf ${pkgname%%-svn})
pkgver=1.0.56
pkgrel=1
pkgdesc="GDB interface utility for PIC32 and other MIPS processors"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ejtagproxy"
license=('BSD')
depends=('libusb')
makedepends=('subversion' 'pcre')
provides=("${_pkgname}") # There's no stable release right now, but there may be in the future
conflicts=("${_pkgname}")
optdepends=('pic32prog-svn')
source=("${_pkgname}::svn+http://${_pkgname}.googlecode.com/svn/trunk/")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "1.0.$(svnversion)" # I've added the "1.0." because the author follows that format in --help
}

build() {
  cd "${srcdir}/${_pkgname}"

  # The makefile does an odd read of .svn/entries
  printf "${pkgver##*.}" > .svn/entries

  # Should fix any problems with OS detection
  sed -i 's|/lib/i386-linux-gnu|/|' make-unix

  make -f make-unix
}

package() {
  cd "${srcdir}/${_pkgname}"

  # The makefile installs to a hardcoded path...
  install -Dm755 ejtagproxy "${pkgdir}/usr/bin/ejtagproxy"

  # Extract the license
  offsets=(`pcregrep -M --file-offsets 'Copyright \(C\)(\n|.)*?\*/' \
    target-ejtag.c | head -n 1 | tr ',' ' '`)
  start=${offsets[0]}
  len=${offsets[1]}
  dd if=target-ejtag.c bs=1 skip=${start} count=${len} 2>/dev/null | \
    sed 's|/\*||' | sed 's|\*/||' | sed 's|^ \* ||g' | sed 's|^ \*$||g' \
    >LICENSE
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
