#Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=rtmpdump-yle
pkgver=1.4.6
pkgrel=1
pkgdesc="Download video and audio from YLE Areena in .flv-format"
arch=("i686" "x86_64")
url="http://users.tkk.fi/~aajanki/rtmpdump-yle/index.html"
license=("GPL")
depends=('python2' 'json-c')
conflicts=('rtmpdump' 'rtmpdump-svn' 'rtmpdump-git')
provides=('rtmpdump=2.4' 'rtmpdump-svn' 'rtmpdump-git=20111129')
source=("http://users.tkk.fi/~aajanki/${pkgname}/${pkgname}-${pkgver}.tar.gz" \
	makefile.patch)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 -i ../makefile.patch

  cd librtmp
  make			#Build librtmp
  cd ..
  
  make			#Build yle-dl
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  mkdir -p "${pkgdir}/usr/lib"
  
  cd librtmp
  make mandir=/usr/share/man DESTDIR="${pkgdir}" install install_so
  cd ..
  
  make mandir=/usr/share/man DESTDIR="${pkgdir}" install 
  sed 's|python|python2|g' -i "${pkgdir}/usr/bin/yle-dl"

  ln -s rtmpdump-yle "${pkgdir}/usr/bin/rtmpdump"
}

md5sums=('41ba45e6f6482f55eb5e4c05f77e7eeb'
         'fdac7c64ef475d947ad882dd059480e1')
