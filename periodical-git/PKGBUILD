# Maintainer: Tom Vincent <http://tlvince.com/contact/>
_pkgname=periodical
pkgname=$_pkgname-git
pkgver=20120909
pkgrel=1
pkgdesc="Create a Kindle periodical from given URL(s)"
arch=(any)
url="http://tlvince.github.com/periodical"
license=('MIT')
depends=('python2' 'python2-boilerpipe-patched-git' 'python2-beautifulsoup4'
         'python2-yaml' 'ruby-kindlerb')
makedepends=('git')
options=(!emptydirs)

_gitroot=https://github.com/tlvince/periodical.git
_gitname=$_pkgname

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
