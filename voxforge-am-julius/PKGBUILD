# Maintainer: Maintainer: Matt Harrison < matt at mistbyte dot com >
# Contributor: Muhammad Qadri <Muhammad dot A dot Qadri at gmail dot com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/voxforge-am-julius

pkgname=voxforge-am-julius
pkgver=20130201
pkgrel=1
pkgdesc="Acoustic model information for use with Julius voice recognition software"
arch=('any')
url="http://www.voxforge.org/"
license=('GPL')
install=voxforge-am-julius.install
source=(http://www.repository.voxforge1.org/downloads/Nightly_Builds/AcousticModel-2013-02-01/Julius-4.2-Quickstart-Linux_AcousticModel-2013-02-01.tgz)
sha1sums=('aaff63547d25ced33f5bb141cb5fcf83e5c8dccf')

build() {
  cd "$srcdir"

  install -D Sample.jconf $pkgdir/usr/share/voxforge/julius/julius.jconf
  install -d $pkgdir/usr/share/voxforge/julius/grammar/
  install -t $pkgdir/usr/share/voxforge/julius/grammar/ grammar/*
  install -d $pkgdir/usr/share/voxforge/julius/acoustic_model_files/
  install -t $pkgdir/usr/share/voxforge/julius/acoustic_model_files/ acoustic_model_files/*
}

# vim:set ts=2 sw=2 et:
