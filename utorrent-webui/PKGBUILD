# Contributor: kharg <karol.maciaszek@gmail.com>
# Based on utorrent package by ezzetabi
pkgname=utorrent-webui
pkgver=0.310
pkgrel=2
pkgdesc="A fast and feature rich bittorrent client with WebUI."
arch=(i686)
url="http://www.utorrent.com/"
license=(freeware)
depends=(wine)
makedepends=(unrar)
source=(http://72.20.5.58/beta/webui_v0.310_beta_2.rar
  utorrent
  icons.tar.gz
  settings.dat
  utorrent.desktop)
noextract=(icons.tar.gz webui_v0.310_beta_2.rar)
options=(!strip)
provides=(utorrent)
conflicts=(utorrent)

build() {
  cd "$startdir"/src
  unrar x webui_v0.310_beta_2.rar 1>/dev/null || return 1

  cd "$startdir"/pkg
  install -d -m 755 usr/bin usr/share usr/share/utorrent usr/share/pixmaps \
     usr/share/applications usr/share/utorrent/sortabletable || return 1

  install -m 755 "$startdir"/src/utorrent usr/bin || return 1
  install -m 644 "$startdir"/src/utorrent.exe "$startdir"/src/settings.dat \
     "$startdir"/src/webui.zip usr/share/utorrent || return 1
  install -m 644 "$startdir"/src/sortabletable/stable.js.license.txt \
     "$startdir"/src/sortabletable/stable.uncompressed.js \
     usr/share/utorrent/sortabletable || return 1
  install -m 644 "$startdir"/src/utorrent.desktop \
     usr/share/applications || return 1

  cd usr/share
  tar xf "$startdir"/src/icons.tar.gz || return 1
  find icons -type d -exec chmod 755 "{}" \; || return 1
  find icons -type f -exec chmod 644 "{}" \; || return 1
  cd "$startdir"/pkg

  ln -s /usr/share/icons/hicolor/48x48/utorrent.png \
      usr/share/pixmaps/utorrent.png || return 1
}

md5sums=('5d8079c2e19614faee1bb06fc73055ab'
         '74bff759c509521f96e3573198775e73'
         '23832eaa9bacd98eeb9224506852db85'
         'cf08eafbac1c990ff9830689e23080b2'
         '03d4b09e66af8231f95829f22a6e7265')

