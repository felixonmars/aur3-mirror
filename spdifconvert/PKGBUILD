# Maintainer: dryes <joswiseman@gmail>
pkgname='spdifconvert'
pkgver=0.4
pkgrel=1
pkgdesc='Utility to prepare DTS/AC3 files for SPDIF output.'
url='http://forums.slimdevices.com/showthread.php?t=19260'
arch=('any')
license=('GPL2')
depends=('python2')
makedepends=('dos2unix')
source=('http://forums.slimdevices.com/attachment.php?s=e971c0f719644c61438ea27c8fa48322&attachmentid=2475&d=1172658363')
md5sums=('991c96054906714eeb12239def09ccd7')

package() {
  sed -i -r 's|^\#!python|\#!/usr/bin/python2|' "${srcdir}/spdifconvert.py"
  dos2unix "${srcdir}/spdifconvert.py"

  install -D -m755 "${srcdir}/spdifconvert.py" "$pkgdir/usr/bin/spdifconvert"
}
