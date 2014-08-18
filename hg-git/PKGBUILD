pkgname=hg-git
pkgver=0.6.1
pkgrel=1
pkgdesc="Mercurial plugin to convert to and from a Git repository"
arch=(any)
url="http://hg-git.github.com/"
license=('GPL2')
install=hg-git.install
depends=('mercurial' 'python2-dulwich')
makedepends=('mercurial')

source=("https://bitbucket.org/durin42/hg-git/get/$pkgver.tar.gz")
sha1sums=("056d20f729a84f1fd34cc4dd0a891161d19ad492")

package() {
  cd $srcdir/durin42-hg-git-*
  python2 setup.py install --prefix=/usr --root=$pkgdir --optimize=1
}
