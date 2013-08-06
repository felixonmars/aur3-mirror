# Maintainer: Rich Lindsley <rich at dranek dot com>
pkgname=tt-rss-newsplus-plugin-git
_gitname=tt-rss-newsplus-plugin
pkgver=665da8b
pkgrel=1
pkgdesc="TT-RSS plugin to add some functionality for the News+ Android app"
arch=('any')
url="https://github.com/hrk/tt-rss-newsplus-plugin"
license=('GPL3')
depends=('tt-rss')
makedepends=('git')
provides=('tt-rss-newsplus-plugin')
conflicts=('tt-rss-newsplus-plugin')
source=('git://github.com/hrk/tt-rss-newsplus-plugin')
md5sums=('SKIP') #generate with 'makepkg -g'

pkgver() {
  cd "$_gitname"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$_gitname"
  install -d -m755 "$pkgdir/usr/share/webapps/tt-rss/plugins/api_newsplus/"
  install -D -m644 api_newsplus/init.php "$pkgdir/usr/share/webapps/tt-rss/plugins/api_newsplus/"
}

# vim:set ts=2 sw=2 et:
