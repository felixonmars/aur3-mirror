# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
pkgname=minecraft-firefox-search
pkgver=20111028
pkgrel=1
pkgdesc="Firefox search engines for Minecraft related sites."
arch=('any')
url="https://addons.mozilla.org/da/firefox/addon/minecraft-1/"
license=(unknown) # GPL?
depends=('firefox')
changelog=ChangeLog
source=('https://addons.mozilla.org/firefox/downloads/file/117954/minecraft_wiki_search-20110414.xml')
md5sums=('0a1b4593419fb72b42f2cf21316aa800')

package() {
  _ffver=`pacman -Q firefox | cut -f2 -d\ | cut -f1 -d-`
  depends=("firefox>=${_ffver}" "firefox<=${_ffver/0/99}")

  cd "${srcdir}"
  local _prefix="${pkgdir}"/usr/lib/firefox-${_ffver}/searchplugins

  for i in `ls "${srcdir}"`; do
    install -D -m 0644 "${srcdir}"/$i ${_prefix}/$i
  done
}

