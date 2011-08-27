# Contributor: abenson <adrian_benson@yahoo.co.nz>

pkgname=jpgfdraw
pkgver=0.5.5b
pkgrel=2
pkgdesc="A java based gui for the pgf/tikz latex graphics environment"
arch=('i686' 'x86_64')
url="http://theoval.cmp.uea.ac.uk/~nlct/jpgfdraw"
license=('GPL2')
depends=('java-runtime')
optdepends=('texlive-core')
options=('docs')

# NB Build requires jdk=1.5, i.e. not easily buildable on ArchLinux
# There are pre-compiled jar archives avail in US and UK English or Chinese.
# Uncomment the one you want below
__lang="us"; md5sums=('43ee4a32895a8367437d78bbcd123598')  #US english version
#__lang="uk"; md5sums=('cbae41dbfeff085dc6b6d58db5896432')  #UK English version
#__lang="zh"; md5sums=('b46fd34940a8551d4f82470a781a9fa9')  #Chinese version

source=(http://theoval.cmp.uea.ac.uk/~nlct/${pkgname}/${pkgname}-${pkgver}-${__lang}.zip
        ${pkgname}.desktop)
md5sums=(${md5sums[0]} '2ca474f4023601b7a4cee2d013d1a2c3')

build() {
  cd $srcdir/$pkgname-${pkgver}-${__lang}
  
  mkdir -p $pkgdir/usr/share/java/${pkgname}
  cp -r lib/* $pkgdir/usr/share/java/${pkgname}
  find $pkgdir/usr/share/java/${pkgname} -type f -exec chmod 644 '{}' \;
  
  mkdir -p $pkgdir/usr/bin
  rm -f bin/*.bat
  sed -e 's|bindir=`dirname $0`||g' \
      -e 's|$bindir/../lib|/usr/share/java/jpgfdraw|g' -i bin/*
  install -m755 bin/* $pkgdir/usr/bin
  install -Dm644 icons/jdrlogolarge.png $pkgdir/usr/share/pixmaps/${pkgname}.png
  install -Dm644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
  mkdir -p $pkgdir/usr/share/doc/${pkgname}/examples
  install -m644 examples/* $pkgdir/usr/share/doc/${pkgname}/examples
  install -m644 BUGS README doc/*.pdf $pkgdir/usr/share/doc/${pkgname}
}

# vim:set ts=2 sw=2 et:
