# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>

pkgname=screen-git
pkgver=20111202
pkgrel=1
_ptygroup=5 #the UID of our PTY/TTY group
pkgdesc="GNU Screen from GIT repository. Provides vertical splitting."
url="http://www.gnu.org/software/screen/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('ncurses' 'pam')
provides=('screen')
conflicts=('screen')
backup=('etc/screenrc' 'etc/pam.d/screen')
makedepends=('git' 'automake' 'autoconf')
options=('!makeflags')
install='screen.install'
source=(screen.pam)
md5sums=(1059ce8a6c6763838f395c917afe54cf)
_gitroot="git://git.savannah.gnu.org/screen.git"
_gitname="screen"


build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  	cd $_gitname && git pull origin
  	msg "The local files are updated."
  else
  	git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build

  cd ${srcdir}/$_gitname-build/src/


  export LDFLAGS="${LDFLAGS} -Wl,--as-needed"
  ./autogen.sh
  ./configure \
  		--prefix=/usr \
  		--enable-pam \
		--enable-colors256 \
	  	--enable-rxvt_osc --with-pty-group=$_ptygroup \
  		--mandir=/usr/share/man --infodir=/usr/share/info

  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  install -Dm644 ${srcdir}/screen.pam ${pkgdir}/etc/pam.d/screen

  install -Dm644 etc/completer.zsh ${pkgdir}/usr/share/zsh/site-functions/screen
  install -Dm644 etc/etcscreenrc ${pkgdir}/etc/screenrc
  install -Dm644 etc/screenrc ${pkgdir}/etc/skel/.screenrc

  rm ${pkgdir}/usr/share/info/dir
  gzip -9 ${pkgdir}/usr/share/info/*

}
