# Maintainer: Ner0

pkgname=zeitgeist-datasource-firefox
pkgdesc="A Zeitgeist datasource that logs the webstes you visit in Firefox to Zeitgeist."
pkgver=0.4
_ubuntuver=0~2~precise1
pkgrel=1
arch=('i686' 'x86_64')
url="https://launchpad.net/~markjtully"
license=('GPL')
depends=('libzeitgeist' 'zeitgeist')
conflicts=('zeitgeist-dataprovider-firefox')
source=("https://launchpad.net/~markjtully/+archive/ppa/+files/${pkgname}_$pkgver-$_ubuntuver.tar.gz")
md5sums=('c638b7561522dc4b38f66360b40693b7')

package() {
  cd recipe-*

  # Change the path if you're not using stable firefox (for example, /opt/firefox-aurora for "firefox-aurora")
  _path=/usr/lib/firefox

  install -dm755 "$pkgdir/$_path/extensions/xpcom-firefox@zeitgeist-project.com"

  bsdtar -xf xpcom-firefox\@zeitgeist-project.com.xpi -C "$pkgdir/$_path/extensions/xpcom-firefox@zeitgeist-project.com"
}

# vim:set ts=2 sw=2 et:
