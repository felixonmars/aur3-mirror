# $Id: PKGBUILD 170087 2012-11-01 01:12:40Z thomas $
# Contributor: Sindhu S <sindhus@live.in>
# Committer: dorphell <dorphell@gmx.net>
# Maintainer: Stein Krauz <steinkrauz@yahoo.com>

pkgname=screen-vs
pkgver=4.2.1
pkgrel=1
_ptygroup=5 #the UID of our PTY/TTY group
pkgdesc="Full-screen window manager that multiplexes a physical terminal with useful patches"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/screen/"
license=('GPL')
depends=('ncurses' 'pam' 'zsh')
backup=('etc/screenrc' 'etc/pam.d/screen')
options=('!makeflags')
install=screen.install
source=(ftp://ftp.gnu.org/gnu/screen/screen-${pkgver}.tar.gz
	screen-4.2.1-arch.patch 
	screen.pam)
md5sums=('419a0594e2b25039239af8b90eda7d92'
         'f64746eb86e6b023f24b12af22b140c0'
         '74f7919d7b65436cc2ea5341fa8ca374')

build() {
  cd ${srcdir}/screen-${pkgver}
  patch -Np1 -i $srcdir/${source[1]}
  
  ./configure --prefix=/usr --enable-pam \
        --with-sys-screenrc=/etc/screenrc --enable-colors256 \
       --enable-rxvt_osc --enable-telnet \
       --with-pty-group=$_ptygroup \
       --mandir=/usr/share/man --infodir=/usr/share/info \
       --with-socket-dir=/run/screens
  make
}

package() {
  cd ${srcdir}/screen-${pkgver}
  make DESTDIR=${pkgdir} install

  install -Dm644 ${srcdir}/screen.pam ${pkgdir}/etc/pam.d/screen

  install -Dm644 etc/completer.zsh ${pkgdir}/usr/share/zsh/site-functions/screen
  install -Dm644 etc/etcscreenrc ${pkgdir}/etc/screenrc
  install -Dm644 etc/screenrc ${pkgdir}/etc/skel/.screenrc
}
