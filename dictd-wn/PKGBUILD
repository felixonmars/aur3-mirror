# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
# Contributor: Andrew Engelbrecht <sudoman@ninthfloor.org>
pkgname=dictd-wn
pkgver=3.0
pkgrel=30
pkgdesc="WordNet for dictd"
arch=(i686 x86_64)
url="http://wordnet.princeton.edu/"
license=('GPL')
depends=(dictd tk)

# the tarball from debian is required, since it contains wordnet_structures.py
_file_id=wordnet_${pkgver}
source=("http://ftp.de.debian.org/debian/pool/main/w/wordnet/$_file_id.orig.tar.gz")
sha256sums=('73572005ef8eb15be48ea1010d18082b80bfbf8684b78ce64bc3abf11db1f95f')

build() {

  cd $startdir/src/WordNet-$pkgver
  ./configure

  # we need to use python2, pass the name, and the url of the new WN version
  cd contrib/wordnet_structures/
  mv Makefile Makefile.orig
  sed 's/python wordnet_structures.py/python2 wordnet_structures.py --wn_url="http:\/\/wordnet\.princeton.edu" --db_desc_short="     WordNet \(r\) 3\.0 \(2006\)"/g' Makefile.orig > Makefile
  cd ../..

  make

  install -m 0755 -d $startdir/pkg/usr/share/doc/$pkgname/
  install -m 0644 -t $startdir/pkg/usr/share/doc/$pkgname/ AUTHORS COPYING NEWS README

  cd contrib/wordnet_structures/
  install -m 0755 -d $startdir/pkg/usr/share/dictd/
  install -m 0644 -t $startdir/pkg/usr/share/dictd/ wn.dict.dz wn.index 

}
 
