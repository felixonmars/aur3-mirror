# Maintainer : Rob McCathie <archaur at rmcc dot com dot au>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: Andrew Gregory <andrew.gregory.8@gmail.com>

_name=midori
pkgname=midori-nozeitgeist
pkgver=0.5.7
pkgrel=1
pkgdesc='Lightweight web browser (GTK2)'
arch=('x86_64' 'i686')
url='http://www.midori-browser.org/'
license=('LGPL2.1')
install='midori.install'
provides="midori=$pkgver"
conflicts='midori'
depends=('webkitgtk2' 'libnotify' 'libxss' 'hicolor-icon-theme' 'desktop-file-utils' 'libunique')
makedepends=('bzr' 'python2' 'intltool' 'vala' 'librsvg' 'cmake')
optdepends=('gstreamer0.10-base-plugins: HTML5 OGG videos support'
            'gstreamer0.10-bad-plugins: HTML5 WebM videos support'
            'gstreamer0.10-ffmpeg: HTML5 H264 videos support'
            'aria2: download utility')
options=('!emptydirs')
source=("http://www.midori-browser.org/downloads/${_name}_${pkgver}_all_.tar.bz2")
sha256sums=('2875bb2aa8a8a0cce342178f04700d4ebccd13bf1b2ad4cb3ba9fec7e2bd0b4d')

build() {
  cd "$_name-$pkgver"

  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DUSE_ZEITGEIST=0
  make
}

package() {
  make -C "$_name-$pkgver/build" DESTDIR="$pkgdir" install
}
