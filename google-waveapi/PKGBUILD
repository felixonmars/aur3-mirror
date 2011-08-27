pkgname=google-waveapi
pkgver=20101202
pkgrel=1
arch=('any')
pkgdesc="Google Wave Robot Python Client Library."
url="http://code.google.com/p/wave-robot-python-client/"
license=('Apache 2')
depends=('google-appengine')
options=('!strip')
source=(http://wave-robot-python-client.googlecode.com/files/wave-robot-api-v2-${pkgver}.zip)
md5sums=('9194eb8b3ff5dd011b71bd84d1a118c7')

build() {
  mkdir -p "$pkgdir/opt/google-appengine/waveapi"
  cp $srcdir/*.py "$pkgdir/opt/google-appengine/waveapi/"
  cp -R $srcdir/simplejson "$pkgdir/opt/google-appengine/waveapi/" 
}
