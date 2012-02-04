# Contributor: vogo

pkgname=mc-suse
_pkgname=mc
pkgver=4.6.2.pre1
_pkgver=4.6.2-pre1
pkgrel=3
arch=('i686' 'x86_64')
conflicts=(mc)
provides=(mc)
license=('GPL')
pkgdesc="A filemanager/shell that emulates Norton Commander (with suse's patches)"
url="http://www.ibiblio.org/mc/"
depends=('e2fsprogs' 'glib2' 'gpm' 'slang')
makedepends=('pkgconfig' 'patch')
source=(http://ftp.gnu.org/gnu/mc/mc-4.6.2-pre1.tar.gz
        x11_browser
        mc-utf8.patch
        00-70-utf8-common.patch
        00-73-utf8-bottom-buttons-width.patch
        00-75-utf8-cmdline-help.patch
        00-76-utf8-hotlist-highlight.patch
        00-77-utf8-filename-search-highlight.patch
        mc-apps.patch
        mc-palmsupport.patch
        mc-word_docs.patch
        mc-x11browser.diff
        mc-no-nb.diff
        mc-NULL.patch
        mc-wrapper.patch
        mc-getpwuid.patch
        mc-syntax-hpp.patch
        mc-utf8-nlink.patch
        mc-esc-seq.patch
        mc-rpm.patch
        mc-cursor-appearance.patch)
md5sums=('7626c446f016b09fd1210f00b9d0c292'
         'fa612fd6d10ea0d715e9ba367d50449d'
         '1891d8e6b02a959fad8ac175f9afb5b8'
         '28679575767437dd0fb5b6363f0c03f7'
         'a34de9ac17a65a587d28ffa9f9ffbe68'
         '028f4d4166745c49674c48fb95365bab'
         '2c427203813cc130a2d1b4068003d839'
         'e3fe113c576cc23b6ea27aa3159422fc'
         'cdd28293cdc9869449b362360c112d68'
         '9c1b10713de14f416d0f5faed901fbe3'
         'ed557741edeed77d01b46ce0a16a7506'
         'c2166a98dc12d9555dc0ff7b2d839483'
         'e84e843fa4d2a4c030e297b8f8979371'
         'fc829e8c79a1125c4ca6f3121065e6e5'
         'b1dbd259fc53bb4fa4f509533b1652fd'
         'e1c75454dfe798d8b9db86474dcf9129'
         '77f7d2b2ff5748d6863899a1d061ac59'
         'c802ad1d95bd28a30b3de7f72de69478'
         'ef7c8a7527f6b186d96620379e28df70'
         'f70038c0607e1770fd6366116ce5d0b3'
         '74d1e5b6295d8f1a455addd1433cf62d')
build() {
  cd $startdir/src/$_pkgname-$_pkgver
  patch -p1 -i $startdir/src/mc-utf8.patch
  patch -p1 -i $startdir/src/00-70-utf8-common.patch
  patch -p1 -i $startdir/src/00-73-utf8-bottom-buttons-width.patch
  patch -p1 -i $startdir/src/00-75-utf8-cmdline-help.patch
  patch -p1 -i $startdir/src/00-76-utf8-hotlist-highlight.patch
  patch -p1 -i $startdir/src/00-77-utf8-filename-search-highlight.patch
  patch -p0 -i $startdir/src/mc-apps.patch
  patch -p1 -i $startdir/src/mc-palmsupport.patch
  patch -p0 -i $startdir/src/mc-word_docs.patch
  patch -p0 -i $startdir/src/mc-x11browser.diff
  patch -p0 -i $startdir/src/mc-no-nb.diff
  patch -p1 -i $startdir/src/mc-NULL.patch
  patch -p0 -i $startdir/src/mc-wrapper.patch
  patch -p0 -i $startdir/src/mc-getpwuid.patch
  patch -p0 -i $startdir/src/mc-syntax-hpp.patch
  patch -p0 -i $startdir/src/mc-utf8-nlink.patch
  patch -p0 -i $startdir/src/mc-esc-seq.patch
  patch -p0 -i $startdir/src/mc-rpm.patch
  patch -p0 -i $startdir/src/mc-cursor-appearance.patch

  cd $startdir/src/$_pkgname-$_pkgver/po
  rename no nb no.*

  cd $startdir/src/$_pkgname-$_pkgver/lib
  iconv -f iso8859-1 -t utf-8 -o mc.hint.tmp mc.hint && mv mc.hint.tmp mc.hint
  iconv -f iso8859-1 -t utf-8 -o mc.hint.es.tmp mc.hint.es && mv mc.hint.es.tmp mc.hint.es
  iconv -f iso8859-1 -t utf-8 -o mc.hint.it.tmp mc.hint.it && mv mc.hint.it.tmp mc.hint.it
  iconv -f iso8859-1 -t utf-8 -o mc.hint.nl.tmp mc.hint.nl && mv mc.hint.nl.tmp mc.hint.nl
  iconv -f iso8859-2 -t utf-8 -o mc.hint.cs.tmp mc.hint.cs && mv mc.hint.cs.tmp mc.hint.cs
  iconv -f iso8859-2 -t utf-8 -o mc.hint.hu.tmp mc.hint.hu && mv mc.hint.hu.tmp mc.hint.hu
  iconv -f iso8859-2 -t utf-8 -o mc.hint.pl.tmp mc.hint.pl && mv mc.hint.pl.tmp mc.hint.pl
  iconv -f koi8-r -t utf8 -o mc.hint.ru.tmp mc.hint.ru && mv mc.hint.ru.tmp mc.hint.ru
  iconv -f koi8-u -t utf8 -o mc.hint.uk.tmp mc.hint.uk && mv mc.hint.uk.tmp mc.hint.uk
  iconv -f big5 -t utf8 -o mc.hint.zh.tmp mc.hint.zh && mv mc.hint.zh.tmp mc.hint.zh

  cd $startdir/src/$_pkgname-$_pkgver/doc/es
  iconv -f iso8859-1 -t utf-8 -o mc.1.in.tmp mc.1.in && mv mc.1.in.tmp mc.1.in
  iconv -f iso8859-1 -t utf-8 -o xnc.hlp.tmp xnc.hlp && mv xnc.hlp.tmp xnc.hlp

  cd $startdir/src/$_pkgname-$_pkgver/doc/hu
  iconv -f iso8859-2 -t utf-8 -o mc.1.in.tmp mc.1.in && mv mc.1.in.tmp mc.1.in
  iconv -f iso8859-2 -t utf-8 -o xnc.hlp.tmp xnc.hlp && mv xnc.hlp.tmp xnc.hlp

  cd $startdir/src/$_pkgname-$_pkgver/doc/it
  iconv -f iso8859-1 -t utf-8 -o mc.1.in.tmp mc.1.in && mv mc.1.in.tmp mc.1.in
  iconv -f iso8859-1 -t utf-8 -o xnc.hlp.tmp xnc.hlp && mv xnc.hlp.tmp xnc.hlp

  cd $startdir/src/$_pkgname-$_pkgver/doc/pl
  iconv -f iso8859-2 -t utf-8 -o mc.1.in.tmp mc.1.in && mv mc.1.in.tmp mc.1.in
  iconv -f iso8859-2 -t utf-8 -o xnc.hlp.tmp xnc.hlp && mv xnc.hlp.tmp xnc.hlp

  cd $startdir/src/$_pkgname-$_pkgver/doc/ru
  iconv -f koi8-r -t utf-8 -o mc.1.in.tmp mc.1.in && mv mc.1.in.tmp mc.1.in
  iconv -f koi8-r -t utf-8 -o xnc.hlp.tmp xnc.hlp && mv xnc.hlp.tmp xnc.hlp

  cd $startdir/src/$_pkgname-$_pkgver/
  autoreconf --force --install
  ./configure --prefix=/usr --without-x --enable-charset --with-samba

  make || return 1
  make DESTDIR=$startdir/pkg install

  install -D -m 0644 $startdir/src/$_pkgname-$_pkgver/lib/mc.sh $startdir/pkg/etc/profile.d/mc.sh
  install -D -m 0644 $startdir/src/$_pkgname-$_pkgver/lib/mc.csh $startdir/pkg/etc/profile.d/mc.csh
  install -D -m 755 ${startdir}/src/x11_browser $startdir/pkg/usr/share/mc/bin/x11_browser
}
