# Contributer: Darwin Bautista <djclue917@gmail.com>
# Package adopted by Alexander bas 07.01.2008 <bas@it-core.org>

pkgname=bittyrant
pkgver=1.1.1
pkgrel=3
pkgdesc="A strategic BitTorrent client, based on Azureus, that improves performance"
arch=(i686 x86_64)
url="http://bittyrant.cs.washington.edu/"
license="GPL"
depends=('bash' 'gtk2' 'j2re' 'swt')
source=(http://bittyrant.cs.washington.edu/dist_090607/BitTyrant-Linux32.tar.bz2 \
        bittyrant.sh \
        bittyrant.desktop \
        BitTyrant.png \
        BitTyrant.torrent.png)
[ "${CARCH}" = "x86_64" ] && source[0]=http://bittyrant.cs.washington.edu/dist_090607/BitTyrant-Linux64.tar.bz2
md5sums=('44a65aa40d8a3e3aa2e90452522ec679' 'df2c30d36d36f9c6c2acfeb8e2b868df'\
         'e537b8daeb0069e61244b18ecaee7a17' 'bac4bf8bd6b2127c633e04a9235d6ba9'\
         'ab2d1a36577c47b375057b5eb568f2e3')
[ "${CARCH}" = "x86_64" ] && md5sums[0]='eafa51b8d6ee0c0f3309c738f1a63142'

build() {
  cd ${startdir}/src/azureus/

  install -D -m755 ${startdir}/src/${pkgname}.sh $startdir/pkg/usr/bin/${pkgname}
  install -D -m644 Azureus2.jar ${startdir}/pkg/usr/share/java/${pkgname}/Azureus2.jar

  mkdir -p ${startdir}/pkg/usr/share/${pkgname}
  cp -R plugins ${startdir}/pkg/usr/share/${pkgname}/

  install -D -m644 ../${pkgname}.desktop ${startdir}/pkg/usr/share/applications/${pkgname}.desktop
  install -D -m644 ../BitTyrant.png ${startdir}/pkg/usr/share/pixmaps/BitTyrant.png
  install -D -m644 ../BitTyrant.torrent.png ${startdir}/pkg/usr/share/pixmaps/BitTyrant.torrent.png
}
