# Maintainer: David Roheim <david dot roheim at gmail dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Aurélien DESBRIÈRES <ice.cube@gmx.com>

pkgname=divxconverter
pkgver=2.0.1.1
_realver=2.0.1-1
pkgrel=5
pkgdesc="PyGTK frontend for mencoder to produce hight quality DivX Video"
arch=('any')
url="http://code.google.com/p/foxoman/wiki/DivXConverter"
license=('GPL3')
depends=('mencoder' 'ffmpegthumbnailer' 'mplayer' 'pygobject' 'pygtk' 'zenity')
optdepends=('fribidi: BiDi algorithm implementation for Hebrew and/or Arabic'
            'ffmpeg2theora: to create the screenshot')
source=(http://foxoman.googlecode.com/files/${pkgname}_${_realver}_all.tar.gz)
sha256sums=('1a198cc669d660c0419573a27794be4b23bc5240186ca16083e2dfde5dbc7934')

build() {
	true
}

package() {
	cd ${srcdir}/${pkgname}_${_realver}_all
  install -d ${pkgdir}/usr/share/divx-converter/locale
  cp -R ./usr/share/{applications,divx-converter,gnome,icons,pixmaps} "${pkgdir}/usr/share/" || return 1

  install -Dm755 ./usr/bin/divxc "${pkgdir}/usr/bin/divxc" || return 1

  chmod 644 ${pkgdir}/usr/share/divx-converter/locale/es_ES.po
  chmod 644 ${pkgdir}/usr/share/divx-converter/main.glade

  sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|" ${pkgdir}/usr/bin/divxc
  sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|" ${pkgdir}/usr/share/divx-converter/main.py
  sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|" ${pkgdir}/usr/share/divx-converter/options.py
  sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|" ${pkgdir}/usr/share/divx-converter/singleton.py
}