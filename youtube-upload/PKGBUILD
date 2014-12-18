# Contributor: Arnau Sanchez <tokland {at} gmail {dot} com>
pkgname="youtube-upload"
pkgver="0.7.3"
pkgrel="1"
pkgdesc="Upload videos to Youtube from the command-line"
arch=(any)
url="http://code.google.com/p/youtube-upload"
license=('GPL3')
depends=('python2-gdata' 'python2-pycurl' 'python2-progressbar')
makedepends=()
source=("http://youtube-upload.googlecode.com/files/youtube-upload-${pkgver}.tgz")
 
package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

md5sums=('e667962d4a41a936dc6dafdff5c594e9')
