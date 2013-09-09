# Maintainer: weiqiu <wei@qiu.es>
pkgname=cloudsn-git
pkgver=363.bc9dae0
pkgrel=1
pkgdesc="E-mail(pop3, gmail, imap), rss and tweets notifier"
arch=('any')
url="http://chuchiperriman.github.com/cloud-services-notifications"
license=('GPL')
groups=()
depends=('python2' 'python2-notify' 'python-simplejson' 'pyxdg' 'hicolor-icon-theme' 'python2-dbus' 'python2-gobject')
makedepends=('git')
provides=()
optdepends=('python2-feedparser: RSS support'
'python-gnomekeyring: Store passwords in gnome-keyring'
'gstreamer0.10-python: To play sounds'
)
conflicts=('cloudsn')
replaces=()
backup=()
options=()
install=cloudsn-git.install
source=("$pkgname"::'git://github.com/qiuwei/cloud-services-notifications'
       'cloudsn-git.install')
md5sums=('SKIP'
         '2befa45b348ce4c8bb2394fa204c390b')
noextract=()

pkgver() {
  cd "$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

#prepare() {
  #cd "$pkgname"
#}

#build() {
  #cd "$pkgname"
#}

package() {
  cd "$pkgname"
  python2 setup.py install --root=$pkgdir --prefix=/usr
}

# vim:set ts=2 sw=2 et:
