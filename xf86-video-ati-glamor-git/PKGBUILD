# Maintainer: Francesco Marella <francesco.marella@gmail.com>

pkgname=xf86-video-ati-glamor-git
pkgver=20120730
#pkgver=6.14.6
epoch=1
pkgrel=1
pkgdesc="X.org ati video driver with Glamor acceleration"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libdrm>=2.4.37' 'systemd-tools' 'ati-dri' 'glamor-git')
makedepends=('xorg-server-devel>=1.11.99.902' 'xf86driproto' 'mesa' 'glamor-git')
conflicts=('xorg-server<1.11.99.902' 'xf86-video-ati')
provides=('xf86-video-ati')
groups=('xorg-drivers' 'xorg')
options=('!libtool')

_gitroot='git://anongit.freedesktop.org/xorg/driver/xf86-video-ati'
_gitname='xf86-video-ati'

build() {
  msg 'Connecting to git.freedesktop.org GIT server....'

  if [ -d $srcdir/${_gitname} ] ; then
    cd ${_gitname} && git pull origin
  else
    git clone --depth=1 $_gitroot $_gitname
  fi

  msg 'GIT checkout done or server timeout'

  cd "${srcdir}"
  [ -d $_gitname-build ] && rm -rf $_gitname-build
  mkdir $_gitname-build
  cd "$srcdir/$_gitname" && ls -A | grep -v .git | xargs -d '\n' cp -r -t ../$_gitname-build
  cd "$srcdir/$_gitname-build"

  msg 'Starting make...'

  ./autogen.sh \
    --prefix=/usr/ \
    --enable-glamor

  make
}

package() {
  cd "${srcdir}/$_gitname-build"
  make "DESTDIR=${pkgdir}" prefix=/usr/ install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
