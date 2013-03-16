# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Suat SARIALP <muhendis.suat@gmail.com>
pkgname=docbook-utils
pkgver=0.6.14
pkgrel=5
pkgdesc="Shell scripts to manage DocBook documents"
arch=('i686' 'x86_64')
url="http://sources.redhat.com/docbook-tools/"
license=('GPL2')
depends=('docbook-sgml31' 'docbook-dsssl' 'jade' 'docbook-xml-dtd' 'perl-sgmls' 'lynx' 'opensp')
conflicts=('docbook2x')
source=("html.tar.gz" "ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/$pkgname-$pkgver.tar.gz" "docbook-utils-0.6.14-grep_fix-1.patch")
md5sums=('205d7005a609aa5f40c2fb8ba8ea1107'
         '6b41b18c365c01f225bc417cf632d81c'
         '9acefe856adfb13f0efabb68c8c6c745')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np1 -i $srcdir/docbook-utils-0.6.14-grep_fix-1.patch
  ./configure --prefix=/usr --sysconfdir=/etc
  cp $srcdir/html/* doc/HTML
  make DESTDIR=$pkgdir mandir=/usr/share/man htmldir=/usr/share/doc/$pkgname/html install || return 1
  #common alternative names
  for doctype in html ps dvi man pdf rtf tex texi txt
  do
    ln -s docbook2$doctype $pkgdir/usr/bin/db2$doctype
  done
}

# vim:set ts=2 sw=2 et:
