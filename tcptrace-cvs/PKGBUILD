# Maintainer: Pierre Carru <pierre.carru@gmail.com>
pkgname=tcptrace-cvs
pkgver=20140304
pkgrel=2
pkgdesc="A TCP dump file analysis tool"
arch=(i686 x86_64)
url="http://www.tcptrace.org/"
license=('GPL')
depends=('libpcap')
makedepends=('cvs')
provides=('tcptrace')
conflicts=('tcptrace')
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_cvsroot=:pserver:anonymous@tcptrace.org:/cvsroot
_cvsmod=tcptrace

build_patch="--- trace.c	5 Jan 2006 21:00:51 -0000	5.77
+++ trace.c	4 Mar 2014 17:34:12 -0000
@@ -1834,7 +1834,7 @@
 
     /* do rtt stats */
     if (ACK_SET(ptcp)) {
-	ack_type = ack_in(otherdir,th_ack,tcp_data_length,eff_win,0);
+	ack_type = ack_in(otherdir,th_ack,tcp_data_length,eff_win);
 
 #ifdef EXPERIMENTAL_ONLY
 	/* check first SACK block too to see if there's good rtt info in it */"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod CVS server...."

  if [[ -d "$_cvsmod/CVS" ]]; then
    cd "$_cvsmod"
    cvs -z3 update -d
  else
    cvs -z3 -d "$_cvsroot" co -D "$pkgver" -f "$_cvsmod"
    cd "$_cvsmod"
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  # build
  echo "$build_patch" | patch -Np0 -N || return 1
  ./configure
  # a custom make file is used
  sed -i -e "s|BINDIR = /usr/local/bin|BINDIR = $pkgdir/usr/bin|" -e "s|MANDIR = /usr/local/man/|MANDIR = $pkgdir/pkg/usr/man|" Makefile
  make
}

package() {
  cd "$srcdir/$_cvsmod-build"
  make install
}

# vim:set ts=2 sw=2 et:
