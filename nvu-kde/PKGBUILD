# Contributor: Mario A. Vazquez <mariovazq@gmail.com>
pkgname=nvu-kde
pkgver=1.0
pkgrel=3
pkgdesc="A Dreamweaver style WYSIWYG web editor with kdemimetypes"
url="http://www.nvu.com/"
license=""
depends=('gtk2' 'libidl2' 'mozilla-common' 'kdelibs')
makedepends=('sed' 'gcc' 'zip' 'pkgconfig')
conflicts=(nvu)
replaces=()
backup=()
install=nvu.install
source=(http://cvs.nvu.com/download/nvu-$pkgver-sources.tar.bz2 \
  mozconfig mozilla-1.7.3-ft2.patch nvu-$pkgver-gcc4-1.patch nvu.desktop \
  launcher.patch nvu-browser-ext nvu-nonroot.tar.gz \
  nvu-1.0-glibc-2.4.patch nvu-1.0-kdesitemanager.patch)
md5sums=('ae0f7c85e230ce8a90dc438b53be06e6' '792a29f59d4be37138e1ceab39df22ff'\
         'e79634ee1e611182b6c227daa362b20d' 'c4ea99043fc3f4591a6e11bb3028f04e'\
         'a70b0960d2bb6b75cc5426d39157fc5f' '94b89bb1f0b493ad035dfdd6c1329207'\
         '812e7320edc101d4f9c8f47efaf94b55' 'd7057b5145870eefa31f41005ef77f87'\
         '1bbe55892586ddbce300e5abb134a681' '5e2c4ba049b21d5518fccdc0c087fdb3')

build() {
  cd $startdir/src/mozilla
  patch -Np0 -i $startdir/src/launcher.patch || return 1
  patch -Np0 -i $startdir/src/mozilla-1.7.3-ft2.patch || return 1
  #patch -Np0 -i $startdir/src/mozilla-rpath-3.patch  || return 1
  patch -Np1 -i $startdir/src/nvu-$pkgver-gcc4-1.patch  || return 1
  patch -Np0 -i $startdir/src/nvu-1.0-glibc-2.4.patch  || return 1
  patch -p1 -i $startdir/src/nvu-1.0-kdesitemanager.patch || return 1
  sed "s@#CFLAGS#@$CFLAGS@g" $startdir/src/mozconfig >.mozconfig

  # fix typo (mozilla bug 258177)
  sed -i "s@destdir@DESTDIR@" $startdir/src/mozilla/composer/app/Makefile.in || return 1

  ./configure
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  # initialize some data so that nvu will run as a non-root user
  cd $startdir/pkg/opt/mozilla/lib/nvu-$pkgver/
  tar zxf $startdir/src/nvu-nonroot.tar.gz || return 1

  cd $startdir/pkg/opt/mozilla/lib && ln -sf nvu-$pkgver nvu

  # Remove common mozilla aclocal stuff
  rm -rf $startdir/pkg/opt/mozilla/share
  rm -rf $startdir/pkg/opt/mozilla/lib/pkgconfig
  rm -rf $startdir/pkg/opt/mozilla/include

  # Remove useless default profile setup
  rm -rf $startdir/pkg/opt/mozilla/bin/defaults

  # Remove non used nvu folders
  rm -rf $startdir/pkg/opt/mozilla/lib/nvu-$pkgver/chrome/comm
  rm -rf $startdir/pkg/opt/mozilla/lib/nvu-$pkgver/chrome/help
  rm -rf $startdir/pkg/opt/mozilla/lib/nvu-$pkgver/chrome/embed-sample
  rm -rf $startdir/pkg/opt/mozilla/lib/nvu-$pkgver/chrome/en-US
  rm -rf $startdir/pkg/opt/mozilla/lib/nvu-$pkgver/chrome/cascades
  rm -rf $startdir/pkg/opt/mozilla/lib/nvu-$pkgver/chrome/toolkit
  rm -rf $startdir/pkg/opt/mozilla/lib/nvu-$pkgver/chrome/pinger
  rm -rf $startdir/pkg/opt/mozilla/lib/nvu-$pkgver/chrome/pipnss
  rm -rf $startdir/pkg/opt/mozilla/lib/nvu-$pkgver/chrome/pippki
  rm -rf $startdir/pkg/opt/mozilla/lib/nvu-$pkgver/chrome/tipoftheday
  rm -rf $startdir/pkg/opt/mozilla/lib/nvu-$pkgver/chrome/classic

  # put links & shortcut
  install -m755 -dD $startdir/pkg/usr/share/applications
  install -m644  $startdir/src/nvu.desktop $startdir/pkg/usr/share/applications/

  # install browse button & hyperlinks script
  cat $startdir/src/nvu-browser-ext >> $startdir/pkg/opt/mozilla/lib/nvu-$pkgver/defaults/pref/all.js
}
