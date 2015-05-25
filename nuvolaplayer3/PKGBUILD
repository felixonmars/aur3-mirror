# Maintainer: Michael Corrigan <ghost.vonage AT gmail DOT com>
# Upstream URL: https://tiliado.eu/nuvolaplayer

pkgname=nuvolaplayer3
pkgver=3.0.0~201505211845.06e8803
pkgrel=1
pkgdesc="Cloud music integration for your Linux desktop"
PKGEXT='.pkg.tar'
arch=('x86_64' 'i686')
options=(!strip)
url="https://tiliado.eu/nuvolaplayer/"
_rpmurl="https://tiliado.eu/nuvolaplayer/repository/rpm/fc21/x86_64/stable/packages"
_rpmurl_32="https://tiliado.eu/nuvolaplayer/repository/rpm/fc21/i686/stable/packages"
license=('GPL')
makedepends=('rpmextract')
depends=('diorite-git' 'vala' 'webkit2gtk' 'libarchive' 'gtk3' 'libnotify' 'json-glib' 'flashplugin')
conflicts=('nuvolaplayer' 'nuvolaplayer-git' 'nuvolaplayer-beta')
install=$pkgname.install
md5sums_x86_64=('8a6f251930b2454745de8d3df0b0e28c')
source_x86_64=("$_rpmurl/$pkgname-$pkgver-1.fc21.x86_64.rpm")
md5sums_i686=('35c14e24e31a1aef0355f33258f9e4a3')
source_i686=("$_rpmurl_32/$pkgname-$pkgver-1.fc21.i686.rpm")
md5sums=('66857bc98b5694392a47453f5083b89f'
'90751883b6b4979e2c691257ffc1f590'
'950f5dd2ad1ac30a116a8961540abde5'
'52a7b8e2b8d10eebf21b01c860ab0436'
'c1e019000111c41e2e111191b884db25'
'375f768d9ca4adae004033edd56585ae'
'e16049301d028adbfecd71b64149b13e'
'64656c5aa36e442b5bb0f897e6993664'
'81eaa752bb8d28bf929153485ed32db0')
source=("$_rpmurl/$pkgname-bandcamp-2.0-1.fc21.x86_64.rpm"
        "$_rpmurl/$pkgname-deezer-2.3-1.fc21.x86_64.rpm"
        "$_rpmurl/$pkgname-google-play-music-5.2-1.fc21.x86_64.rpm"
        "$_rpmurl/$pkgname-jango-2.0-1.fc21.x86_64.rpm"
        "$_rpmurl/$pkgname-kexp-1.0-1.fc21.x86_64.rpm"
        "$_rpmurl/$pkgname-mixcloud-1.0-1.fc21.x86_64.rpm"
        "$_rpmurl/$pkgname-rdio-4.0-1.fc21.x86_64.rpm"
        "$_rpmurl/$pkgname-spotify-2.0-1.fc21.x86_64.rpm"
        "$_rpmurl/$pkgname-this-is-my-jam-2.0-1.fc21.x86_64.rpm")
package() {
  rpmextract.sh *
  chmod -R g-w usr
  if [[ $(uname -m) == 'x86_64' ]]; then
    mkdir usr/lib
    mv usr/lib64/* usr/lib/
    rmdir usr/lib64
  fi
  mv usr "${pkgdir}"
}
