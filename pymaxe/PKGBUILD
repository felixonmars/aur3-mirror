# Maintainer: Mamut Ghiunhan
# Contribuitors: Trizen, JokerBoy, Dan Serban

pkgname=pymaxe
pkgver=0.60
pkgrel=1
pkgdesc="Pymaxe is an easy to use and open-source application which lets you download music or videos from some media-sharing websites, such as YouTube, Trilulilu or 4shared"
arch=(any)
url=http://pymaxe.com/
license=(GPLv3)
depends=(ffmpeg gstreamer0.10-ffmpeg gstreamer0.10-ugly-plugins pygtk)
source=(http://pymaxe.com/files/latest/pymaxe.tar.gz)
md5sums=('089ef87a7871aa9f3b2710c542a3d726')

build()
{
  bsdtar -xf pymaxe.tar.gz -C "${pkgdir}"
}

