# Maintainer syne <madlikene@aim.com>
# Contributor ndowens <ndowens04@gmail.com>

pkgname=destroytwitter
pkgver=2.1.5
_pkgver=215p2
pkgrel=1
pkgdesc="DestroyTwitter is a powerful and lightweight Adobe AIR Twitter client"
arch=('i686' 'x86_64')
url="https://destroytwitter.com/"
license=('unknown')
depends=('adobe-air-sdk' 'adobe-air')
makedepends=('unzip')
source=(http://destroytoday.com/destroytwitter/releases/prerelease/DestroyTwitter$_pkgver.zip $pkgname.sh $pkgname.desktop)
md5sums=('b945c2cae25e8a8e7bb8cf185fab49ea'
         'dcb87ce3ed851e9ef8664c67eaaf11e4'
         '22cfe479116266e2d739b0427883ca85')



build()
{
   cd ${srcdir}
   install -d ${pkgdir}/{opt/$pkgname,usr/{bin,share/{applications,pixmaps/$pkgname}}}   
   unzip -o DestroyTwitter$_pkgver.zip
   unzip DestroyTwitter$_pkgver/DestroyTwitter$_pkgver.air 

   install DestroyTwitter$_pkgver/DestroyTwitter$_pkgver.air ${pkgdir}/opt/${pkgname}/destroytwitter.air
    install icons/128.png ${pkgdir}/usr/share/pixmaps/${pkgname}/
   install destroytwitter.desktop ${pkgdir}/usr/share/applications/
install -m755 $pkgname.sh ${pkgdir}/usr/bin/${pkgname}
}



