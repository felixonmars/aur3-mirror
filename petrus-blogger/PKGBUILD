# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=petrus-blogger
pkgver=20100814
pkgrel=1
pkgdesc="Blogging client for LiveJournal, Blogspot and Wordpress."
arch=('any')
url="http://www.sf.net/projects/petrus-blogger"
license=('BSD')
depends=('java-runtime' 'bash')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.zip" "petrus-run.sh" "LICENSE")
noextract=(*.jar)
md5sums=('c0ef4b1449499897ca6fa1ce0a0039cc'
         'a2d724ba9ea6d9cf164d992b3dc89a3e'
         '39adb0081543d1ca4a5fbce3e7400fe9')

build() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/{bin,share/{licenses/${pkgname},${pkgname}}}
  install -Dm644 PetrusBlogger.jar ${pkgdir}/usr/share/${pkgname}/petrus.jar 
   install -Dm755 ${srcdir}/petrus-run.sh ${pkgdir}/usr/bin/petrus
   install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
   }
