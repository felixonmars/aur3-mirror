# $Id$
# Maintainer: Joffrey TISSERON <tisseron.joffrey@aliceadsl.fr>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=vlc-libs
_pkgsrcname=vlc
pkgver=1.1.7
pkgrel=4
pkgdesc="A multi-platform MPEG, VCD/DVD, and DivX player - nogui version for phonon"
arch=('i686' 'x86_64')
url="http://www.videolan.org/vlc/"
license=('GPL')
depends=('a52dec' 'fluidsynth' 'libmtp' 'libdvbpsi' 'libdca' 'libproxy'
	'sdl_image' 'libdvdnav' 'lua' 'v4l-utils' 'libcddb' 'smbclient'
	'libmatroska' 'zvbi' 'taglib' 'libmpcdec' 'ffmpeg' 'faad2' 'libshout'
	'libmad' 'fribidi' 'libmpeg2' 'libmodplug' 'libass' )
provides=("$_pkgsrcname=$pkgver")
conflicts=("$_pkgsrcname")
options=('!libtool')
source=(http://mirrors.kernel.org/archlinux/extra/os/$CARCH/$_pkgsrcname-$pkgver-$pkgrel-$CARCH.pkg.tar.xz)
md5sums=('39c528aaa6d0c3601d1f0d6ffeb5db8f')

build() {
  cp -r $srcdir/usr $pkgdir/usr
  rm -rf $pkgdir/usr/share/applications
  rm -rf $pkgdir/usr/share/apps
  rm -rf $pkgdir/usr/share/kde4
  rm -rf $pkgdir/usr/share/icons
  rm -rf $pkgdir/usr/share/locale
  rm -rf $pkgdir/usr/share/vlc
  rm -rf $pkgdir/usr/lib/vlc/plugins/gui
}