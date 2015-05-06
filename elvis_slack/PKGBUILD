# Maintainer: Rudy Matela <rudy.matela@gmail.com>
# Based on early pkgbuild by froggie <haptikers@gmail.com>
# Date: 2008-10-24 17:36
pkgname=elvis_slack
pkgver=2.2_0
pkgrel=6
pkgdesc="A vi clone with special security features (With Slackware ``Patch'')"
depends=('ncurses')
# The original link is down as of 2015-05-05:
#   ftp://ftp.cs.pdx.edu/pub/elvis/elvis-2.2_0.tar.gz
# Currently using the "german mirror":
source=("http://www.the-little-red-haired-girl.org/pub/elvis/elvis-2.2_0.tar.gz"
        "http://slackware.osuosl.org/slackware_source/a/elvis/elvis.clr"
        "http://slackware.osuosl.org/slackware_source/a/elvis/elvis.clr.orig"
		"getline.patch")
url="http://elvis.the-little-red-haired-girl.org/"
md5sums=('6831b8df3e4a530395e66c2889783752'
         'c47a70cb176ebf2eb99b055c4048a560'
         'a4539efb7e8fae629da375d98d3d6ae8'
         'd7517d3dad19f04d4d9a78a18e16e3d1')
arch=('i686' 'x86_64')
license=('PerlArtistic')
conflicts=('elvis')
replaces=('elvis')

build() {
  cd $srcdir/elvis-$pkgver
  cp $srcdir/elvis.clr* ./data
  patch -p0 < $srcdir/getline.patch
  ./configure --prefix=/usr --without-x --without-gnome --verbose
  sed 's/\<CTAGS\>/ELVTAGS/g; s/ctags\>/elvtags/g; s/ant" elvtags/ant" ctags/' doc/ctags.man >doc/elvtags.man
  /usr/bin/make
}

package() {
  cd $srcdir/elvis-$pkgver
  /bin/mkdir -p $pkgdir/usr/bin/
  for i in elvis ref elvtags elvfmt; do
      install -s -m755 $i $pkgdir/usr/bin/
  done

  cd $srcdir/elvis-$pkgver/data/
  /bin/mkdir -p $pkgdir/usr/share/elvis/
  cp -r * $pkgdir/usr/share/elvis/

  cd $srcdir/elvis-$pkgver/doc/
  /bin/mkdir -p $pkgdir/usr/share/man/man1/
  for i in elvis ref elvtags elvfmt; do
      mv $i.man $i.1
      gzip $i.1
      install -m644 $i.1.gz $pkgdir/usr/share/man/man1/
  done

}
