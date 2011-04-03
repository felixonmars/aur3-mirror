# Maintainer: Scott Garrett <wintervenom@gmail.com>

pkgname=mpd-subtitles
pkgver=0.4a_20110402
pkgrel=1
pkgdesc="Displays synchronized lyrics to your music in MPD. Includes editor and uploader."
arch=('any')
url="http://wintervenom.mycrosoft.us/projects"
license=('WTFPL')
depends=('python2' 'python-mpd' 'pyosd' 'python-urwid' 'python-xlib'
         'ttf-dejavu')
source=(
    "http://wintervenom.mycrosoft.us/projects/${pkgname}.tar.bz2"
)
md5sums=('c2691600b7f33bc8e1dca404a10a080b')

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}"/{usr,bin}
  python2 setup.py install --prefix "${pkgdir}/usr" --optimize=1
  for binary in mpd-{subtitles,lrceditor,lrcupload}; do
    install ${binary} "${pkgdir}/bin"
  done
}
