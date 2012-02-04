# Contributor: pliy <ply at jabster.pl>
pkgname=tkabbur
pkgver=0.8
pkgrel=1
pkgdesc="modification of XMPP/Jabber client Tkabber"
arch=(i686 x86_64)
url="http://code.google.com/p/tkabbur/"
license=('GPL2')
depends=(tcl tk)
source=(http://tkabbur.googlecode.com/files/$pkgname-$pkgver.src.tar.bz2)
noextract=()
md5sums=('e999f78155eb70709a0c005ecb037cd6')

build() {
  cd "$srcdir/$pkgname-$pkgver.src"
  
  # Prefix
  sed 's/\/usr\/local/\/usr/g' Makefile > Makefile.tmp || return 1
  mv -f Makefile.tmp Makefile || return 1

  make DESTDIR="$pkgdir/"

  # Repair permissions
  cd $pkgdir
  chmod -R u=rw,u-x,u+X,go=r,go-x,go+X *
  chmod a+x "usr/bin/$pkgname" "usr/share/$pkgname"
}

# vim:set ts=2 sw=2 et:
