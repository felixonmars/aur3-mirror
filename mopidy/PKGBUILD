# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy
_pypiname=Mopidy
pkgver=1.0.0
pkgrel=2
pkgdesc="Mopidy is a music server which can play music both from multiple sources, like your local hard drive, radio streams, and from Spotify and SoundCloud."
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=('python2'
         'python2-pykka>=1.1'
         'python2-setuptools'
         'gstreamer0.10-python'
         'gstreamer0.10-base-plugins'
         'gstreamer0.10-good-plugins'
         'gstreamer0.10-ugly-plugins'
         'python2-tornado>=2.3')
optdepends=('mopidy-spotify: Spotify backend'
            'mopidy-scrobbler: Last.FM scrobbler'
            'mopidy-MPRIS: MPRIS frontend'
            'mopidy-alsamixer: ALSA volume control')
conflicts=('mopidy-git')
backup=('etc/mopidy/mopidy.conf')
install=$pkgname.install
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
        'man-mopidy.1.gz'
        'mopidy.conf'
        'mopidy.install'
        'mopidy@.service')
md5sums=('c622d6186d524aa8da6d701ec237b4f9'
         'dd3ac60fdef6476e61f4e09c434b4598'
         'f198485317cd1f481b9b9a369e122833'
         '82333d658250a21bd02e6ba2e7e7b7ed'
         '06da4720ab1cdfebfa6ff6d921bbda9d')

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm640 "${srcdir}/mopidy.conf" "${pkgdir}/etc/mopidy/mopidy.conf"
  install -Dm644 "${srcdir}/mopidy@.service" "${pkgdir}/usr/lib/systemd/system/mopidy@.service"
  install -Dm644 "${srcdir}/man-mopidy.1.gz" "${pkgdir}/usr/share/man/man1/mopidy.1.gz"
  install -Dm644 "extra/systemd/mopidy.service" "${pkgdir}/usr/lib/systemd/system/mopidy.service"
  install -Dm644 "extra/desktop/mopidy.desktop" "${pkgdir}/usr/share/applications/mopidy.desktop"

  install -dm755 "${pkgdir}/etc/mopidy/extensions.d"
  install -dm755 "${pkgdir}/var/cache/mopidy"
  install -dm755 "${pkgdir}/var/log/mopidy"
  install -dm755 "${pkgdir}/var/lib/mopidy/local"
  install -dm755 "${pkgdir}/var/lib/mopidy/media"
  install -dm755 "${pkgdir}/var/lib/mopidy/playlists"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
