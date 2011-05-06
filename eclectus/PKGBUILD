# Maintainer: Remy Marquis <remy.marquis@gmail.com>
pkgname=eclectus
pkgver=0.2beta2
pkgrel=2
pkgdesc="Small Han character dictionary especially designed for learners of Chinese character based languages like Mandarin Chinese or Japanese."
url="http://code.google.com/p/eclectus/"
arch=('any')
license=('GPLv3')
depends=('python2' 'python2-pyqt' 'python2-sqlalchemy' 'python2-cjklib' 'kdebindings-python' 'ttf-kanjistrokeorders')
optdepends=('ttf-kanjistrokeorders: Kanji stroke order font'
            'tegaki-python: handwriting recognition program'
            'zinnia-python: handwriting recognition engine based on Support Vector Machines'
            'tegaki-models-zinnia-simplified-chinese: Simplified Chinese handwriting models for zinnia engine and use in Tegaki'
            'tegaki-models-zinnia-traditional-chinese: Traditional Chinese handwriting models for zinnia engine and use in Tegaki'
            'tegaki-models-zinnia-japanese: Japanese handwriting models for zinnia engine and use in Tegaki'
            'tegaki-wagomu: handwriting recognition engine'
            'tegaki-models-wagomu-simplified-chinese: Simplified Chinese handwriting models for wagomu engine and use in Tegaki'
            'tegaki-models-wagomu-japanese: Japanese handwriting models for wagomu engine and use in Tegaki'
            )
makedepends=()
#makedepends=(python-imaging)
conflicts=()
replaces=()
backup=()
source=("http://eclectus.googlecode.com/files/${pkgname}-${pkgver}.tar.gz"
        "http://eclectus.googlecode.com/files/bw.png.segment-0.2beta.tar.gz"
        )
md5sums=('3645ef7a32f50cd58a5dc9536963302c'
         '2be2c5ac390d9525b7093d02c23ceee8'
        )

build() {
  tar -xzf ${pkgname}-${pkgver}.tar.gz
  cd ${pkgname}-${pkgver}

  python2 setup.py install --root $pkgdir

  # Wikimedia Commons Stroke Order Project images
  # cd libeclectus/files

  # sed -i 's/python/python2/g' Makefile # python2 compatibility

  # make bw.png.segment
  # cd build/bw.png.segment
  # mkdir -p $pkdir /usr/share/${pkgname}

  cd ..
  tar -xzf bw.png.segment-0.2beta.tar.gz
  cd bw.png.segment-0.2beta

  mv bw.png.segment $pkgdir/usr/share/${pkgname}
  mv jbw.png.segment $pkgdir/usr/share/${pkgname}
  mv tbw.png.segment $pkgdir/usr/share/${pkgname}
}

# vim:set ts=2 sw=2 et:

