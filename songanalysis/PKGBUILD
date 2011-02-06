# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=songanalysis
pkgver=0.4.0
pkgrel=2
pkgdesc="This program analyzes a song in WAV, Ogg Vorbis or MP3 format"
arch=(i686)
url="http://rudd-o.com/projects/songanalysis/"
license=('GPL')
depends=('gsl' 'glib2')
source=(http://rudd-o.com/wp-content/projects/files/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('1f735115400232e9c8c6bede33e2bd13')

build(){
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
