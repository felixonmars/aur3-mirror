# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: tocer <tocer.deng@gmail.com>

_pkgname=blogpost
pkgname=$_pkgname-hg
pkgver=95
pkgrel=1
pkgdesc="a WordPress command-line weblog"
url="http://srackham.wordpress.com/$_pkgname1"
license=("MIT")
arch=("i686" "x86_64")
depends=('asciidoc' 'python2')
makedepends=("mercurial")
conflicts=("blogpost")
provides=("blogpost")
install=${_pkgname}.install
source=("hg+https://code.google.com/p/$_pkgname")
md5sums=('SKIP')

package() {
  cd ${srcdir}/${_pkgname}
  
  DSTDIR=$pkgdir/usr/share/$_pkgname

  install -Dm0644 asciidocapi.py $DSTDIR/asciidocapi.py
  install -Dm0755 blogpost.py $DSTDIR/blogpost.py
  install -Dm0644 wordpresslib.py $DSTDIR/wordpresslib.py
  install -Dm0644 conf/blogpost_example.conf $DSTDIR/blogpost_example.conf
  install -Dm0644 conf/wordpress.conf $pkgdir/etc/asciidoc/wordpress.conf

  cd $DSTDIR
  for FILE in *.py; do
      sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $FILE
  done
  cd -

  msg "Generating manpage."
  a2x -f manpage doc/blogpost.1.txt
  install -Dm644 doc/$_pkgname.1 $pkgdir/usr/share/man/man1/$_pkgname.1

  install -dm0755 "$pkgdir/usr/bin"
  ln -s "/usr/share/$_pkgname/blogpost.py" "$pkgdir/usr/bin/$_pkgname"
}

