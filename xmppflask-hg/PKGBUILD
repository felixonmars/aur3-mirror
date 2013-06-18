# Maintainer: Mo0O <mo0ofier at gmail.com>
pkgname=xmppflask-hg
_hgname=xmppflask
pkgver=183.b3d7c6e85323
pkgrel=1
pkgdesc="XmppFlask is easy to use XMPP framework that is inspired (heavily) by Flask."
url='http://xmppflask.org/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python2' 'pypy' 'python2-jinja' 'python2-flask' 'xmpppy')
makedepends=('mercurial')
conflicts=('xmppflask')
provides=('xmppflask')
source=("hg+https://k_bx@bitbucket.org/k_bx/xmppflask")
md5sums=('SKIP')

pkgver() {
  cd $_hgname
  echo $(hg identify -n).$(hg identify -i)
}

package() {
  cd $_hgname
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
