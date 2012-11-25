# Contributer: giacomogiorgianni@gmail.com 

pkgname=splitalbum
pkgver=0.7.1
pkgrel=1
pkgdesc="Splitalbum is a shntool frontend for Linux. It helps you to cut your audio cd images into separate tracks according to cue sheet"
arch=('i686' 'x86_64')
url="https://opendesktop.org/content/show.php/Splitalbum?content=145943"
license=('GPL')
#install=$pkgname.install
makedepends=('automoc4' 'cmake')
depends=('python2-eyed3' 'python2>=2.7' 'gnome-icon-theme' 'shntool' 'cuetools' 'mutagen' 'python2-chardet' 'flac')  
options=(!strip)
source=("http://heanet.dl.sourceforge.net/project/splitalbum/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")

md5sums=('9d39d9ab788226470312a3a9688346a3')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i -e "s|/usr/bin/python|/usr/bin/python2|g" ${srcdir}/${pkgname}-${pkgver}/${pkgname}
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/pixmaps"
  install -Dm644 $startdir/${pkgname}.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
  cp -R {cue.py,common.py,splitalbum} $pkgdir/usr/bin
  
}

