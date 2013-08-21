# Maintainer: mmm
# Contributor: hobarrera
pkgname=imaplib2-git
_pkgname=imaplib2
_gitname=code
pkgver=3af048b
pkgrel=2
pkgdesc="Python IMAP4rev1 mail protocol client class using threads for parallel operation."
arch=('any')
url="http://imaplib2.sourceforge.net/"
license=('Python license')
depends=('python')
makedepends=('git')
conflicts=('imaplib2')
provides=('imaplib2' 'python2-imaplib')
source=('git+http://git.code.sf.net/p/imaplib2/code')
md5sums=('SKIP')
 
pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}
 
package() {
  cd $_gitname
  install -Dm644 imaplib2.py "$pkgdir/usr/lib/python2.7/site-packages/imaplib2.py"
}
