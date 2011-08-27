# Maintainer: Hubert Maraszek <marach5 at gmail dot com>
pkgname=edensaegis
pkgver=1.11
pkgrel=1
pkgdesc="A freeware bullet hell shooter."
arch=('i686' 'x86_64')
url="http://www004.upp.so-net.ne.jp/x_xgameroom/Works/ea/index.html"
license=('CCPL:by-nd')
depends=('wine' 'winetricks')
install='edensaegis.install'
source=(edensaegis
        edensaegis-config
        edensaegis.desktop
        edensaegis-config.desktop
        edensaegis.png
        http://dl.dropbox.com/u/27951479/edensaegis-winefriendly-1.11.tar.gz)
md5sums=('8b064b69f9441f4a1a868cff63ef048c'
         'a8eca36e12fe5722069b00c61a8e0b3d'
         '69b4b932309054c6e2dbfcda830a9c8e'
         '082f5d218a1a163716f0a5a9ef2f3525'
         '9f13817f781d97692f8479a4c6a649d1'
         '3b48c5c44aa11ed290b201d7e9a5a94f')
options=('!strip')

build() {
  install -d -m755 "$pkgdir"/usr/share/edensaegis
  cp -ra "$srcdir"/EdensAegis"$pkgver"/* "$pkgdir"/usr/share/edensaegis
  find "$pkgdir"/usr/share/edensaegis -type d -exec chmod 755 "{}" \;
  find "$pkgdir"/usr/share/edensaegis -type f -exec chmod 644 "{}" \;
  
  install -d -m755 "$pkgdir"/usr/bin
  install -m755 edensaegis "$pkgdir"/usr/bin
  install -m755 edensaegis-config "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/applications
  install -m644 edensaegis.desktop "$pkgdir"/usr/share/applications
  install -m644 edensaegis-config.desktop "$pkgdir"/usr/share/applications
  install -d "$pkgdir"/usr/share/pixmaps
  install -m644 edensaegis.png "$pkgdir"/usr/share/pixmaps
}

# vim:set ts=2 sw=2 et:

