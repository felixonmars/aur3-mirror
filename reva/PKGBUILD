# Contributor:  scj <scj archlinux us>
pkgname=reva
pkgver=9.0.11
pkgrel=1
pkgdesc="A tiny, fast and cross-platform Forth interpreter/compiler"
arch=('i686' 'x86_64')
url="http://ronware.org/reva/"
license=('Public Domain')
if [[ $CARCH == "i686" ]]; then
  depends=('sqlite3')
  makedepends=('nasm' 'gcc')
else
  depends=('lib32-sqlite3')
  makedepends=('nasm' 'gcc-multilib' 'gcc-libs-multilib' 'binutils-multilib' 'libtool-multilib')
fi
options=(!strip)
install=
source=(http://ronware.org/${pkgname}${pkgver//./}.zip)
md5sums=('ed3cac1624d3a78745b6b444a8c652f9')

build() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/{lib/reva,share/reva}

  # fix permissions
  find lib examples contrib -type f -exec chmod 644 '{}' \;

  # fix libraries
  sed -i -e 's|func: libiconv|func: iconv|' -e 's|libiconv.so|libc.so|' lib/string/iconv || return 1
  sed -i -e 's|\(libncurses.so\)"|\1.5"|' lib/os/console || return 1

  # first stage of compilation (to build the help.db correctly)
  msg "First pass"

  make bootstrap              || return 1
  bin/lin/reva tools/build.f  || return 1
  bin/lin/build help          || return 1
  install -Dm644 bin/help.db $pkgdir/usr/share/doc/reva/help.db || return 1

  msg "Second pass"
  mkdir backup 
  mv bin/lin/{core,reva,build} backup || return 1

  # second stage of compilation (to make {lib,help}dir point to the right place)
  sed -i -e '/: libdir/,/;/c: libdir " /usr/lib/reva/" \n;' \
         -e '/: helpdir/c: helpdir " /usr/share/doc/reva/" ;' src/reva.f || return 1
  
  REVAUSERLIB=$PWD/lib/ make bootstrap          || return 1
  REVAUSERLIB=$PWD/lib/ bin/lin/reva tools/build.f    || return 1

  install -Dm755 bin/lin/reva $pkgdir/usr/bin/reva  || return 1
  install -Dm755 bin/lin/librevagui.so $pkgdir/usr/lib || return 1

  # move the helper db to /usr/share/doc/reva/help.db
  sed -i -e '/" help.db"/s|\(.*\)|\t" /usr/share/doc/reva/help.db"|' \
         -e '/to helpdb/s|.*\(sql_open to helpdb\).*|\t\1|' lib/helper || return 1
  cp -r lib/* $pkgdir/usr/lib/reva              || return 1
  cp -r contrib examples $pkgdir/usr/share/reva || return 1

  mv backup/* bin || return 1
  rmdir backup || return 1

}

# vim:set ts=2 sw=2 et:
