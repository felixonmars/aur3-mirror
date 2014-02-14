# Contributor: Alexander Fasching <fasching.a91@gmail.com>

pkgname=bfin-toolchain-bin
pkgver=2013R1_RC1
pkgrel=1
pkgdesc="GNU toolchain for the Blackfin processor - binary package"
arch=('i686' 'x86_64')
url="http://blackfin.uclinux.org/"
license=('GPL2')
#depends=
#options=
if test "$CARCH" == x86_64; then
  source=("http://sourceforge.net/projects/adi-toolchain/files/2013R1/2013R1-RC1/x86_64/blackfin-toolchain-uclibc-full-2013R1-RC1.x86_64.tar.bz2"
          "http://sourceforge.net/projects/adi-toolchain/files/2013R1/2013R1-RC1/x86_64/blackfin-toolchain-elf-gcc-4.3-2013R1-RC1.x86_64.tar.bz2"
          "http://sourceforge.net/projects/adi-toolchain/files/2013R1/2013R1-RC1/x86_64/blackfin-toolchain-2013R1-RC1.x86_64.tar.bz2")
  sha1sums=('46865d07d9a6b29f496c7658fe12f4c1e21c2692'
            '9ad597e276ac2c3a6a18b07b660c115a587725ab'
            'e546ab7b631a1a0491b3b9ce4e6d8c7c78ef4932')
          
else
  source=("http://sourceforge.net/projects/adi-toolchain/files/2013R1/2013R1-RC1/i386/blackfin-toolchain-uclibc-full-2013R1-RC1.i386.tar.bz2"
          "http://sourceforge.net/projects/adi-toolchain/files/2013R1/2013R1-RC1/i386/blackfin-toolchain-elf-gcc-4.3-2013R1-RC1.i386.tar.bz2"
          "http://sourceforge.net/projects/adi-toolchain/files/2013R1/2013R1-RC1/i386/blackfin-toolchain-2013R1-RC1.i386.tar.bz2")
  sha1sums=('c2d3a0c9c355ee6c8597c30257942f3d47d05b84'
            '34234f3c2d7db6b4a2fd37715566a5b09d871b31'
            '9a5780476cfb5f1134bbeb2a2b53a078bfff4a24')
fi


package() {
  cp -r "${srcdir}/opt" "${pkgdir}/"
}

# vim: ts=2:sw=2:sts=2:et:
