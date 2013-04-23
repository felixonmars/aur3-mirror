# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: hybraries <macwolf@archlinux.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Navi <navitwo.at.gmail.dot.com>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>

pkgname=midori-gtk2-git
pkgver=20130122
pkgrel=1
pkgdesc='Lightweight web browser based on WebKit and GTK2 (git development version)'
arch=('x86_64' 'i686')
url='http://twotoasts.de/index.php?/pages/midori_summary.html'
license=('LGPL')
depends=('libzeitgeist' 'libnotify' 'libxss' 'hicolor-icon-theme' 'desktop-file-utils' 'libwebkit' 'libunique' 'openssh' 'gcr') # 'granite'
makedepends=('pkg-config' 'git' 'python2' 'libxml2' 'gtk2' 'intltool' 'python2-docutils' 'libsoup' 'vala' 'librsvg' 'gtk-doc')
optdepends=('aria2: download utility'
            'steadyflow: download manager')
provides=('midori')
conflicts=('midori' 'midori-git')
install=midori.install
source=("$pkgname::git://git.xfce.org/apps/midori")
md5sums=('SKIP')

prepare() {
  cd "$pkgname"

  sed -i '0,/on/s//on2/' waf wscript
}

build() {
  cd "$pkgname"

  ./waf configure \
    --prefix=/usr \
    --disable-gtk3 \
    --disable-granite \
    --enable-apidocs
  ./waf build 
}

package() {
  cd "$pkgname"

  DESTDIR="$pkgdir" ./waf install
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  cp -r _build/docs/api "$pkgdir/usr/share/doc/$pkgname"
  rmdir "$pkgdir/usr/share/gir-1.0"
}

# vim:set ts=2 sw=2 et:
