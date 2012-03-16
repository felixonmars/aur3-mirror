# $Id: PKGBUILD 56122 2009-10-19 19:54:11Z giovanni $
# Maintainer: Andrwe Lord Weber <andrwe-lord-weber at renona-studios dot org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>
# Contributor: Kaivalagi <m_buck@hotmail.com>

pkgname=conky-lua-nv-dev
_pkgname=conky
pkgver=1.8.0_rc2
pkgrel=1
pkgdesc="An advanced system monitor for X based on torsmo with lua enabled (development version)"
arch=('i686' 'x86_64')
url="http://conky.sourceforge.net/"
license=('custom')
replaces=('torsmo' 'conky')
conflicts=('conky')
provides=('conky')
depends=('alsa-lib' 'libxml2' 'curl' 'cairo' 'wireless_tools' 'libxft' 'glib2' 'libxdamage' 'imlib2' 'toluapp')
makedepends=('pkgconfig')
backup=(etc/conky/conky.conf etc/conky/conky_no_x11.conf)
source=(http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}-development/${pkgver}/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('12590c39e13dd0f62108c998a317e0ae')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  LUA51_LIBS='-llua -lm' ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-wlan \
              --enable-rss \
              --enable-ibm \
              --enable-imlib2 \
              --enable-lua \
              --enable-lua-cairo \
              --enable-lua-imlib2
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
