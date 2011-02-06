# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=ztools
pkgver=731
pkgrel=2
pkgdesc="interactive fiction Z-machine tools for interpreter authors, Inform programmers and Z-code hackers"
arch=(i686 x86_64)
url="http://www.inform-fiction.org/zmachine/ztools.html"
#alternative url: http://www.ifarchive.org/indexes/if-archiveXinfocomXtoolsXztools.html
license=('custom:"unknown"')
depends=('glibc')
#provides=()
#conflicts=()
#replaces=()
#backup=()
groups=(inform)
#options=()
#install=
source=(http://ifarchive.plover.net/if-archive/infocom/tools/ztools/$pkgname$pkgver.tar.gz)
#noextract=()
md5sums=('f5e6abb7011817e48debee828895a500')


build() {
  cd $srcdir/
  make || return 1
  mkdir -p $pkgdir/usr/share/man/man1/
  mkdir -p $pkgdir/usr/bin/
  for A in *.1
  	do 
  	gzip -9 -c $A > $A.gz
  	install -D -m644 $A.gz $pkgdir/usr/share/man/man1/
  done
  install -D -m644 check $pkgdir/usr/bin
  install -D -m644 infodump $pkgdir/usr/bin
  install -D -m644 pix2gif $pkgdir/usr/bin
  install -D -m644 txd $pkgdir/usr/bin
  chmod +x $pkgdir/usr/bin/*
  echo -e "\n infodump check pix2gif and txd are installed in /usr/bin \n"
}
