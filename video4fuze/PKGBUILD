# Maintainer: Tomasz Owczarek <tomek.owczarek at gmail dot com>

pkgname=video4fuze
pkgver=0.6+
pkgrel=2
pkgdesc="A tool to convert and transfer videos to the Sansa Fuze media player"
arch=("i686" "x86_64")
url="http://code.google.com/p/video4fuze/"
license=('GPL3')
depends=('python2-pyqt>=4.5' 'mencoder' 'ffmpeg' 'python2>=2.5' 'python-imaging' 'fuzemux')
makedepends=('qt>=4.5')

source=(http://video4fuze.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
sha1sums=(51a61a35e46770ea2c899ec3417403b54fc30906)

build() {
cd ${pkgname}-${pkgver}

# Force to use python2 in scripts

sed -i "s/python/python2/" dist/fuze
sed -i "s/python/python2/" dist/video4fuze

lrelease video4fuze_e4x.pro
python2 setup.py install --root ${pkgdir}
}
