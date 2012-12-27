# $Id$
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Maintainer: Mladen Pejaković <pejakm at gmail dot com>

pkgname=qtwebkit-nightly
pkgver=138511
pkgrel=1
arch=('i686' 'x86_64')
url='http://trac.webkit.org/wiki/QtWebKit'
pkgdesc='An open source web browser engine (Qt port) - nightly builds'
license=('LGPL2.1' 'GPL3')
depends=('qt5' 'gstreamer0.10-base')
makedepends=('python2' 'mesa' 'chrpath' 'bison' 'gperf')
conflicts=('qt<5' 'qtwebkit')
provides=('qtwebkit')

source=("http://builds.nightly.webkit.org/files/trunk/src/WebKit-r${pkgver}.tar.bz2")
md5sums=('93fa85032203483bc5fba599b3012c27')

build() {
  cd "${srcdir}"/WebKit-r${pkgver}

#   patch -Np1 -i "${srcdir}/gcc-fix.patch"

  cd Tools/Scripts

#   "safe" flags
  QTDIR=/usr/share/qt ./build-webkit --prefix=/usr --qt --release --3d-rendering --accelerated-2d-canvas --animation-api --blob --download-attribute --fullscreen-api --geolocation --input-speech --input-type-date --input-type-datetime --input-type-datetimelocal --input-type-month --input-type-time --input-type-week --link-prefetch --mathml --media-source --media-statistics --mhtml --microdata --page-visibility-api --request-animation-frame --shadow-dom --shared-workers --style-scoped --svg-dom-objc-bindings --video --video-track --webgl --web-timing --workers --xslt --makeargs="${MAKEFLAGS}"

#   unsafe flags, possible build fail
#   --css-filters --css-image-orientation --css-image-resolution --css-shaders --css-variables --custom-scheme-handler --datalist --data-transfer-items --dialog --directory-upload --file-system --indexed-database --legacy-webkit-blob-builder --link-prerender --media-stream  --network-info --quota --register-protocol-handler --scripted-speech --web-audio
}

package() {
  cd "${srcdir}"/WebKit-r${pkgver}
  make INSTALL_ROOT="${pkgdir}" -C WebKitBuild/Release install
}
