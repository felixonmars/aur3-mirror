# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Anders Bergh <anders1@gmail.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=dmd1
pkgver=1.072
pkgrel=1
pkgdesc="The Digital Mars D compiler"
arch=('i686' x86_64)
url="http://www.digitalmars.com/d/1.0/"
source=(http://ftp.digitalmars.com/dmd.$pkgver.zip)
license=('custom')
options=('!strip')
depends=(gcc-libs)
optdepends=('libphobos: D standard runtime library'
            'libtango: Alternative runtime library')
md5sums=('d5489b94f06c7ca2f4b5de62f7e6815a')

[[ $CARCH == "x86_64" ]] && makedepends=("${makedepends[@]}" 'gcc-multilib' 'lib32-glibc')

build() {
  install -Dm644 "$srcdir/dmd/license.txt" "$pkgdir/usr/share/licenses/dmd/LICENSE"

  if [ $CARCH == x86_64 ]; then
    cd "$srcdir/dmd/linux/bin64"
  else
    cd "$srcdir/dmd/linux/bin32"
  fi
  install -dm755 "$pkgdir/usr/bin"
  install -m755 dmd rdmd dumpobj obj2asm "$pkgdir/usr/bin"

  for x in "$srcdir"/dmd/man/man1/*.1; do
    install -Dm644 "$x" "$pkgdir/usr/share/man/man1/$(basename "$x")"
  done

  for x in "$srcdir"/dmd/man/man1/*.5; do
    install -Dm644 "$x" "$pkgdir/usr/share/man/man5/$(basename "$x")"
  done
}
