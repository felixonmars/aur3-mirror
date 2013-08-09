# Maintainer: Dan Ziemba <zman0900@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=gstreamer-vaapi-git
pkgname=gstreamer-vaapi-git
true && pkgname=('gst-vaapi-git' 'gstreamer0.10-vaapi-git')
_gitname=gstreamer-vaapi
pkgver=1291.73323ba
pkgrel=1
pkgdesc="GStreamer Multimedia Framework VA Plugins"
arch=(i686 x86_64)
license=(LGPL)
url="http://www.freedesktop.org/software/vaapi/releases/gstreamer-vaapi/"
makedepends=(gst-plugins-base gst-plugins-bad gstreamer0.10-base-plugins
             gstreamer0.10-bad-plugins libva libxrandr git)
options=(!libtool !emptydirs)

source=('git://gitorious.org/vaapi/gstreamer-vaapi.git')
sha1sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd $_gitname
  env NO_CONFIGURE=1 ./autogen.sh
  mkdir build-1.0 build-0.10
}

build() {
  cd $_gitname/build-1.0
  ../configure --prefix=/usr --disable-static --with-gstreamer-api=1.0
  make

  cd ../build-0.10
  ../configure --prefix=/usr --disable-static --with-gstreamer-api=0.10
  make
}

check() {
  cd $_gitname/build-1.0
  make check

  cd ../build-0.10
  make check
}

package_gst-vaapi-git() {
  depends=(gst-plugins-base gst-plugins-bad libva libxrandr)
  conflicts=(gst-vaapi)
  provides=(gst-vaapi)


  cd $_gitname/build-1.0
  make DESTDIR="$pkgdir" install
}

package_gstreamer0.10-vaapi-git() {
  depends=(gstreamer0.10-base-plugins gstreamer0.10-bad-plugins libva libxrandr)
  conflicts=(gstreamer0.10-vaapi)
  provides=(gstreamer0.10-vaapi)


  cd $_gitname/build-0.10
  make DESTDIR="$pkgdir" install
}
