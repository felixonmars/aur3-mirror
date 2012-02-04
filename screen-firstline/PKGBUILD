#Maintainer: lolilolicon <lolilolicon#gmail#com>

pkgname=screen-firstline
_pkgname=screen
pkgver=4.0.3
pkgrel=1
_ptygroup=5 #the UID of our PTY/TTY group
pkgdesc="Full-screen terminal window multiplexer, with debian and hardstatus firstline patches"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/screen/"
license=('GPL')
depends=('ncurses' 'pam')
backup=('etc/screenrc' 'etc/pam.d/screen')
options=('!makeflags')
install=screen.install
source=(ftp://ftp.uni-erlangen.de/pub/utilities/screen/screen-${pkgver}.tar.gz \
        screen.pam
        screen.patches.debian.tar.gz
        hardstatusfirstline.patch)
provides=(screen=4.0.3)
conflicts=(screen screen-git screen-vs)

build() {
  export LDFLAGS="${LDFLAGS} -Wl,--as-needed"

  cd ${srcdir}/${_pkgname}-${pkgver}

  patch -p1 < ../01CVS.patch || return 1
  patch -p1 < ../01configure_fix_alpha_vsprintf.patch || return 1
  patch -p1 < ../02configure_use_ncursesw.patch || return 1
  patch -p1 < ../03fully_expand_screenencodings.patch || return 1
  patch -p1 < ../04AUTOCONF.patch || return 1
  patch -p1 < ../05fix_osdef_include.patch || return 1
  patch -p1 < ../10norootpassword.patch || return 1
  patch -p1 < ../11replace_doc_paths.patch || return 1
  patch -p1 < ../13split_info_files.patch || return 1
  patch -p1 < ../14size_matters.patch || return 1
  patch -p1 < ../15manpage_typos.patch || return 1
  patch -p1 < ../16fix_gcc_warnings.patch || return 1
  patch -p1 < ../16fix_gcc_warnings_II.patch || return 1
  patch -p1 < ../17manpage_sessionname_warning.patch || return 1
  patch -p1 < ../18manpage_maxwin_limit.patch || return 1
  patch -p1 < ../19flowcontrol_lockup.patch || return 1
  patch -p1 < ../20defmonitor.patch || return 1
  patch -p1 < ../21manpage_nethack_activation.patch || return 1
  patch -p1 < ../22exchange_file_mode.patch || return 1
  patch -p1 < ../23exitcode_q_ls.patch || return 1
  patch -p1 < ../24option_parser.patch || return 1
  patch -p1 < ../25allow_symlink_sockdir.patch || return 1
  patch -p1 < ../26source_encoding.patch || return 1
  patch -p1 < ../27doc_sty_noenvpassing.patch || return 1
  patch -p1 < ../28blankerprg_callsemantics.patch || return 1
  patch -p1 < ../30fix_fsf_address.patch || return 1
  patch -p1 < ../40cjk_eastasian.patch || return 1
  patch -p1 < ../45suppress_remap.patch || return 1
  patch -p1 < ../50EXP_tilde_expansion.patch || return 1
  patch -p1 < ../51EXP_session_creation_time.patch || return 1
  patch -p1 < ../hardstatusfirstline.patch || return 1

  ./configure --prefix=/usr --enable-pam \
        --with-sys-screenrc=/etc/screenrc --enable-colors256 \
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

md5sums=('8506fd205028a96c741e4037de6e3c42'
         '74f7919d7b65436cc2ea5341fa8ca374'
         'e33d792fa82ed04cac93d8c748f34079'
         '75e1866573dd05fcd714c3410e54d1b8')
