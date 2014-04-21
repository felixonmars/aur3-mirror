# Maintainer: M0Rf30

pkgname=eric5-i18n
pkgver=5.4.3
pkgrel=1
pkgdesc="Translations for the Eric IDE"
arch=('any')
url="http://eric-ide.python-projects.org/index.html"
license=('GPL')
depends=('eric5')
source=(http://prdownloads.sourceforge.net/eric-ide/eric5-i18n-cs-$pkgver.tar.gz \
        http://prdownloads.sourceforge.net/eric-ide/eric5-i18n-de-$pkgver.tar.gz \
        http://prdownloads.sourceforge.net/eric-ide/eric5-i18n-es-$pkgver.tar.gz \
	http://prdownloads.sourceforge.net/eric-ide/eric5-i18n-fr-$pkgver.tar.gz \
	http://prdownloads.sourceforge.net/eric-ide/eric5-i18n-it-$pkgver.tar.gz \
	http://prdownloads.sourceforge.net/eric-ide/eric5-i18n-ru-$pkgver.tar.gz \
	http://prdownloads.sourceforge.net/eric-ide/eric5-i18n-tr-$pkgver.tar.gz \
	http://prdownloads.sourceforge.net/eric-ide/eric5-i18n-zh_CN.GB2312-$pkgver.tar.gz )
 


package() {
  cd ${srcdir}
  install -d  $pkgdir/usr/lib/python3.2/site-packages/eric5/i18n/
  install -m644 $srcdir/eric5-$pkgver/eric/i18n/* $pkgdir/usr/lib/python3.2/site-packages/eric5/i18n/
}

md5sums=('88f820e7d4a9c59a81304375dd0f6968'
         '9518236d8874dc49d7efb6f8996476a4'
         '3c2ad58765a9e3e89551486cf39a5625'
         '5b7ad67ea0163a77d44d55b245c30b58'
         '33c87a572741aae02684e358f2fd491a'
         '38bb52277fe66d0614a16941e88c124e'
         '245c0b751e3f1f04df7283beada85fc5'
         '692d23ecd19e1332b46e3468b174d1c5')
