# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: osily <ly50247 at 126 dot com>

_pkgname=xterm
pkgname=xterm-lite
pkgver=312
pkgrel=1
pkgdesc="X Terminal Emulator"
arch=('i686' 'x86_64')
url="http://invisible-island.net/xterm/"
license=('custom')
depends=('libxft' 'ncurses')
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=('xorg')
source=(ftp://invisible-island.net/${_pkgname}/${_pkgname}-${pkgver}.tgz{,.asc})
md5sums=('e42f09b2f59efa862367967241d56306'
         'SKIP')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr \
      --libdir=/etc \
      --mandir=/usr/share/man \
      --with-x \
      --enable-wide-chars \
      --disable-full-tgetent \
      --disable-imake \
      --disable-16-color \
      --enable-256-color \
      --with-tty-group=tty \
      --disable-ziconbeep \
      --disable-rectangles \
      --disable-vt52 \
      --disable-tek4014  \
      --disable-session-mgt \
      --disable-samename  \
      --disable-rightbar \
      --disable-regex  \
      --disable-maximize \
      --disable-desktop \
      --disable-sun-fkeys \
      --disable-initial-erase \
      --disable-paste64 \
      --disable-pty-handshake \
      --disable-samename \
      --disable-rpath-hack

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -D -m755 xterm "${pkgdir}/usr/bin/xterm"
  install -D -m644 xterm.man "${pkgdir}/usr/share/man/man1/xterm.1"
}
