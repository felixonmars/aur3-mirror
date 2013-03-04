# Maintainer: Bernardo Barros <bernardobarros@gmail.com>

pkgname=soundgrain
pkgver=4.1.1
pkgrel=1
pkgdesc="a graphical interface to control granular sound synthesis."
arch=('any')
url="http://code.google.com/p/soundgrain/"
license=('GPL')
depends=('python2' 'python2-pyo')
source=("http://soundgrain.googlecode.com/files/SoundGrain_${pkgver}-src.tar.bz2")

build() {
 
  cd  "${srcdir}/SoundGrain_${pkgver}-src"

  install -d "$pkgdir"/usr/{bin,share/$pkgname}

  cat << EOF >> "$pkgdir/usr/bin/$pkgname"
#!/bin/bash
cd /usr/share/$pkgname && python2 SoundGrain.py
EOF
  
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  cp -a SoundGrain.py examples Resources scripts "$pkgdir/usr/share/$pkgname"

}

md5sums=('9e7d61729331035e7f9afd7b2f7a17c2')
