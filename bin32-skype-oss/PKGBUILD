# Maintainer: Christian Brassat <crshd@mail.com>
# Contributor: Anonymo <meowdib@gmail.com>
# Contributor: revel <revel@muub.net>
# based on bin32-skype and skype-oss

_pkgsourcename=skype_static
_pkgresourcename=skype
pkgname=bin32-skype-oss
pkgver=2.0.0.72
pkgrel=4
pkgdesc="P2P software for high-quality voice communication (OSS-compatible version)"
url="http://www.skype.com/"
license=('custom')
arch=('x86_64')
source=(http://dl.dropbox.com/u/2835814/skype_static-2.0.0.72-oss.tar.bz2)
depends=('lib32-pcre' 'lib32-qt>=4.2.1' 'lib32-dbus-core' 'lib32-libxv' 'lib32-libxss' 'lib32-glib2' 'lib32-alsa-lib' 'lib32-libxinerama' 'lib32-libxcursor')
provides=('skype')
conflicts=('bin32-skype')
md5sums=('ff41dd31906484863884ee0a7da441c1')

build() {
  cd $startdir/src/${_pkgsourcename}-${pkgver}-oss
  install -m 755 -d ${startdir}/pkg/usr/share/${_pkgresourcename}/sounds
  install -m 644 sounds/* ${startdir}/pkg/usr/share/${_pkgresourcename}/sounds
  install -m 755 -D ${_pkgresourcename} ${startdir}/pkg/usr/bin/${_pkgresourcename}
  install -m 644 -D ${_pkgresourcename}.conf ${startdir}/pkg/etc/dbus-1/system.d/${_pkgresourcename}.conf
  install -m 644 -D icons/SkypeBlue_16x16.png ${startdir}/pkg/usr/share/icons/hicolor/16x16/${_pkgresourcename}.png
  install -m 644 -D icons/SkypeBlue_32x32.png ${startdir}/pkg/usr/share/icons/hicolor/32x32/${_pkgresourcename}.png
  install -m 644 -D icons/SkypeBlue_48x48.png ${startdir}/pkg/usr/share/icons/hicolor/48x48/${_pkgresourcename}.png
  install -m 644 -D icons/SkypeBlue_48x48.png ${startdir}/pkg/usr/share/pixmaps/${_pkgresourcename}.png
  install -m 644 -D ${_pkgresourcename}.desktop ${startdir}/pkg/usr/share/applications/${_pkgresourcename}.desktop
  install -m 644 -D LICENSE ${startdir}/pkg/usr/share/licenses/${_pkgresourcename}/LICENSE
}
