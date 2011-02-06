# Contributer: kozec <kozec-at-kozec-dot-com>
# Based on fortune-mod-cs-reddwarf
pkgname=fortune-mod-cs-reddwarf-utf8
pkgver=0.1
pkgrel=1
pkgdesc="Collection of Czech and Slovak fortune cookie files. (Red Dwarf; Modified for UTF-8 terminals)"
url="http://www.newlisp.org/index.cgi?Code_Contributions"
depends=('fortune-mod-cs')
makedepends=('glibc' 'fortune-mod')
conflicts=('fortune-mod-cs-reddwarf')
arch=('i686' 'x86_64')
license=('unknown')
source=(http://download.cirkva.net/fortune/reddwarf)
md5sums=('3ee2b3353dac54f4ab7a2e3a8c85e281')
noextract=('reddwarf')

build() {
  mkdir -p $pkgdir/usr/share/fortune/cs
  cd $pkgdir/usr/share/fortune/cs || return 1
  iconv -f ISO-8859-2// -t UTF8 $srcdir/reddwarf >reddwarf || return 1
  strfile reddwarf reddwarf.dat || return 1
  chmod 644 reddwarf*
}
