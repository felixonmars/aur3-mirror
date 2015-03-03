# $Id: PKGBUILD 122518 2014-11-13 13:56:54Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Georgij Kondratjev <smpuj@bk.ru>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=netsurf-fb
_pkgname=netsurf
pkgver=3.2
pkgrel=1
pkgdesc='Lightweight and fast web browser'
arch=('x86_64' 'i686')
url='http://www.netsurf-browser.org/'
license=('MIT' 'GPL2')
depends=('libmng' 'librsvg' 'libwebp' 'curl' 'lcms' 'desktop-file-utils' 'libnsbmp>=0.1.1' 'libnsgif>=0.1.1' 'libcss>=0.4.0' 'libdom>=0.1.1') # gtk3
makedepends=('re2c' 'gendesk' 'netsurf-buildsystem' 'perl-html-parser' 'nsgenbind' 'inetutils' 'imagemagick')
conflicts=('netsurf' 'netsurf-git' 'netsurf-svn-fb-sdl')
install="$_pkgname.install"
source=("http://source.netsurf-browser.org/art.git/plain/logo/emblem/NetSurf.svg"
        "http://download.$_pkgname-browser.org/$_pkgname/releases/source/$_pkgname-$pkgver-src.tar.gz"
        'netsurf.sh')
sha256sums=('0b8ef911f7154079d16791167cd905f0df8eed00bf97aecb5edf1cf4915757c2'
            '04ffeb8335c59cbc23371b79ae3b178002e6e95c35225ef62db4b155ecc7e213'
            '70310682d1612457d7bb3096549110b6ec127f50e97853259fada6be0c52924b')

prepare() {
  convert NetSurf.svg -size 128x128 netsurf.png
  gendesk -f --pkgname "$_pkgname" --pkgdesc "$pkgdesc" --exec 'netsurf %U' \
    --genericname 'Web Browser' --comment 'Lightweight web browser' \
    --mimetypes 'text/html;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/geo'
}

build() {
  make -C "$_pkgname-$pkgver" \
    PREFIX=/usr \
    TARGET=framebuffer \
    NETSURF_USE_WEBP=NO \
    NETSURF_USE_VIDEO=NO \
    NETSURF_USE_JS=NO \
    NETSURF_USE_MOZJS=NO # Javascript is disabled, for now. See FS#41582
}

package() {
  make -C "$_pkgname-$pkgver" install PREFIX=/usr DESTDIR="$pkgdir" TARGET="framebuffer"
  mv "$pkgdir/usr/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname.elf"
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 "$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname-$pkgver/COPYING" \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
