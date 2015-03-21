# Maintainer: Anonymous <f1586566@trbvm.com>

pkgname=rivulet
pkgver=0.2.0
pkgrel=1
pkgdesc='A music player for torrents'
arch=('any')
url="http://rivulet.audio/"
license=('AGPL')
depends=('libtorrent-rasterbar' 'python2' 'python2-beautifulsoup4' 'python2-tornado' 'python2-lxml' 'python2-yaml' 'flac' 'lame')
source=('https://github.com/rivuletaudio/rivulet/releases/download/v'${pkgver}'/rivulet-'${pkgver}'.tar.gz')
sha256sums=('a8f6e97991825a13ab1457ba17bcaf1d8522445f46717a7e30b534429a47a167')

package() {
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/rivulet
  
  cp -r ${srcdir}/rivulet-${pkgver}/* ${pkgdir}/usr/share/rivulet/

  cat << EOF > ${pkgdir}/usr/bin/rivulet
#!/bin/sh
python2 /usr/share/rivulet/server/webserver/webserver.py
EOF

  chmod 755 ${pkgdir}/usr/bin/rivulet
}
