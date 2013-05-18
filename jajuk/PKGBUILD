# Maintainer: Košava <kosava at gmail.com>
# Contributor: Mlynar <mlynarj at centrum.cz>

pkgname=jajuk
pkgver=1.10.5
pkgrel=1
pkgdesc="A full-featured jukebox geared towards advanced users with large or scattered music collections"
arch=('any')
url="http://jajuk.info/"
license=('GPL')
depends=('java-environment' 'bash')
makedepends=('java-runtime' 'apache-ant')
#makedepends=('maven')
source=(http://prdownloads.sourceforge.net/jajuk/jajuk-sources-${pkgver}.zip no-nsisAnt.patch jajuk-bin)
#sha1sums=('d210ebe5211f6de95c9c9d2fe0bf167d75889548'
sha1sums=('b9b82aa3e47e274c995de8193e448d122c947961'
          '101f5055192268a53acf51dafc982106940e2655'
          '4715cd86f3959923b3fa98659d77048f368f92b0')

build() {
  #cd ${srcdir}/${pkgname}-src-${pkgver}/src/scripts
  patch -p0 -i ${srcdir}/no-nsisAnt.patch
  
  # using maven
  #cd ${srcdir}/${pkgname}-src-${pkgver}
  #/usr/bin/mvn jar:jar

  # using ant
  cd ${srcdir}/${pkgname}-src-${pkgver}/src/scripts
  /usr/share/apache-ant/bin/ant
}

package() {
  cd $srcdir/${pkgname}-src-${pkgver}
  mkdir -p $pkgdir/usr/share/java/
  mkdir -p $pkgdir/usr/share/{applications,pixmaps}
  install src/packaging/RPMS/jajuk.desktop $pkgdir/usr/share/applications
  install src/main/resources/icons/16x16/jajuk-icon_16x16.png $pkgdir/usr/share/pixmaps
  cp -r  /tmp/jajuk-dist/jajuk $pkgdir/usr/share/java/
  install -D -m 755 $srcdir/jajuk-bin $pkgdir/usr/bin/jajuk
}
