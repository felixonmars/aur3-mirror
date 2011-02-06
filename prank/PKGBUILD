# Maintainer: Mick Elliot <micke at sfu dot ca>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=prank
pkgver=081202
origver=081202
pkgrel=1
pkgdesc="A probabilistic multiple alignment program for DNA, codon and amino acid sequences"
arch=('i686' 'x86_64')
url="http://www.ebi.ac.uk/goldman-srv/prank"
license=('GPL')
depends=('gcc-libs')
source=($url/src/prank.src.$pkgver.tgz)
md5sums=('9c046f008858606a621e9e5c5e1a3e0f')

build() {
  cd $startdir/src/src
  if [ "${CARCH}" = "i686" ]; then
   make CFLAGS=" -march=i686 -mtune=generic -O2 -pipe" LDLIBS=" -lm" || return 1
  else
   make CFLAGS=" -march=x86-64 -mtune=generic -O2 -pipe" LDLIBS=" -lm" || return 1
  fi
  install -D -m755 prank $startdir/pkg/usr/bin/prank
}
