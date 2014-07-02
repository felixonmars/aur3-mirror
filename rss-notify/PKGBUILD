# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Sergio A. Morales <smorales@archlinux.cl>

pkgname=rss-notify
pkgver=0.4
pkgrel=5
pkgdesc="A tray applet that notifies you of new rss and atom news items via notifications"
arch=('any')
replaces=('rssn')
provides=('rssn')
url="https://launchpad.net/rssn/"
license=('GPL3')
depends=('python2'
         'python2-feedparser'
         'python2-notify'
         'python2-gconf')
optdepends=("notify-osd: OSD integration")
source=("http://launchpad.net/rssn/0.4/0.4/+download/rss-notify_0.4-0ubuntu0~ppa1~jaunty.tar.gz")
sha1sums=('531deceb28e634b7d7290fd1ecec4d870996a174')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python2 setup.py install --prefix="${pkgdir}/usr" || return 1
}
