# Maintainer: Jan Keith Darunday <jkcdarunday@gmail.com>
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=dictd-foldoc
pkgver=20120518
_mypkgname=dict-foldoc_${pkgver}
pkgrel=1
pkgdesc="The Free On-line Dictionary of Computing for dict"
arch=(i686 x86_64)
url="http://www.dict.org/"
license=('GPL')
depends=(dictd)
source=("http://ftp.de.debian.org/debian/pool/main/d/dict-foldoc/$_mypkgname.orig.tar.gz")
md5sums=('21a5449aa33044d2602710b20ccf73ca')

build() {
  cd $srcdir
  cat $srcdir/dict-foldoc-$pkgver/Dictionary | /usr/bin/dictfmt -f --headword-separator %%% --break-headwords \
        --allchars -u http://foldoc.org/Dictionary.gz \
        -s "The Free On-line Dictionary of Computing ($pkgver)" \
        --utf8 foldoc
    /usr/bin/dictzip -v foldoc.dict
}

package(){
  install -D -m 0644 $srcdir/foldoc.dict.dz $pkgdir/usr/share/dictd/foldoc.dict.dz
  install -D -m 0644 $srcdir/foldoc.index $pkgdir/usr/share/dictd/foldoc.index
}
