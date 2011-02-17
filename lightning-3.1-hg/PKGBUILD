pkgname=lightning-3.1-hg
pkgver=5911
pkgrel=1
_tb_ver=3.1
_tb_libdir=thunderbird-3.1 # Adjust this to your thunderbird directory in /usr/lib
pkgdesc="An integrated calendar extension for Mozilla Thunderbird 3.1"
arch=('i686' 'x86_64')
url="http://www.mozilla.org/projects/calendar/lightning/"
license=('MPL' 'GPL' 'LGPL')
depends=('thunderbird' 'libnotify' 'python2' )
makedepends=('pkgconfig' 'zip' 'glib' 'libidl2' 'wireless_tools' 'autoconf2.13' 'cvs' 'mercurial')
options=('!ccache' '!distcc' '!makeflags')
source=(lightning-libs.patch lib-google-breakpad.patch)
md5sums=('73888893b6168c5a1345bb30bb002940' 'baba9deee1dae3dd5330766543c5ba03')

_hgroot="http://hg.mozilla.org"
_hgrepo="releases/comm-1.9.2/"

build() {
  # Compile needed parts of Thunderbird
  cd $srcdir/$_hgrepo

  export PYTHON=python2
  python2 client.py checkout

#  patch -p0 -i $srcdir/lightning-libs.patch || return 1
#  patch -p1 -i $srcdir/lib-google-breakpad.patch || return 1

  sed -i -e 's#python$#python2#' `find -name *.py` || return 1

  echo '
ac_add_options --prefix=/usr/local/thunderbird
ac_add_options --disable-tests
ac_add_options --disable-debug
ac_add_options --disable-shared
ac_add_options --enable-static
ac_add_options --enable-crypto
ac_add_options --enable-application=mail
ac_add_options --enable-calendar
ac_add_options --without-system-nspr
ac_add_options --without-system-zlib
ac_add_options --without-system-jpeg
ac_add_options --without-system-png
ac_add_options --without-system-mng
mk_add_options MOZ_OBJDIR=@TOPSRCDIR@/objdir-tb-release
mk_add_options MOZ_MAKE_FLAGS="-j2"
' > .mozconfig

  make -f client.mk || return 1

  # Install to the Thunderbird lib directory
  # If someone knows a better way to extract the em:id, please let me know :)
  #_emid=`grep em:id $srcdir/$_hgrepo/objdir-tb-release/mozilla/dist/xpi-stage/lightning/install.rdf | tail -n1 | sed 's/.*>\(.*\)<.*/\1/'`
  #mkdir -p $pkgdir/usr/lib/$_tb_libdir/extensions/$_emid
  #cd $pkgdir/usr/lib/$_tb_libdir/extensions/$_emid
  # Look for the current (highest) version number of the XPI
  #bsdtar -x -f $srcdir/$_hgrepo/objdir-tb-release/mozilla/dist/xpi-stage/lightning.xpi || return 1

  # Fix permissions
  #find -type d -exec chmod 0755 \{\} \+ || return 1
  #find -type f -exec chmod 0644 \{\} \+ || return 1
  #find -name '*.so' -exec chmod 0755 \{\} \+
}
