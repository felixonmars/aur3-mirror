# Maintainer: Maintainer: Matt Harrison < matt at mistbyte dot com >
# Contributor: Muhammad Qadri <Muhammad dot A dot Qadri at gmail dot com>
# This PKGBUILD is maintained at https://github.com/matt-h/voxforge-am-julius

pkgname=voxforge-am-julius
pkgver=2012.10.22
pkgrel=2
pkgdesc="Acoustic model information for use with Julius voice recognition software"
arch=('any')
url="http://www.voxforge.org/"
license=('GPL')
install=voxforge-am-julius.install
source=(http://www.repository.voxforge1.org/downloads/Nightly_Builds/AcousticModel-2012-10-22/Julius-4.2-Quickstart-Linux_AcousticModel-2012-10-22.tgz)
sha1sums=('8410178114b1e12fbfdc33516fb852682b349824')

build() {
  cd "$srcdir"

  install -D Sample.jconf $pkgdir/usr/share/voxforge/julius/julius.jconf
  install -d $pkgdir/usr/share/voxforge/julius/grammar/
  install -t $pkgdir/usr/share/voxforge/julius/grammar/ grammar/*
  install -d $pkgdir/usr/share/voxforge/julius/acoustic_model_files/
  install -t $pkgdir/usr/share/voxforge/julius/acoustic_model_files/ acoustic_model_files/*
}

# vim:set ts=2 sw=2 et:
