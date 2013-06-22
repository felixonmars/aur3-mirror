# Maintainer: Yuhei Maeda <Yuhei.Maeda_at_gmail.com>

_pkgname=python2-twitter
pkgname=$_pkgname-git
pkgver=20130621
pkgrel=1
pkgdesc="A Python wrapper around the Twitter API"
arch=(any)
url=https://github.com/bear/python-twitter
license=('APACHE')
depends=('python2' 'python2-httplib2' 'python2-simplejson' 'python2-oauth2')
makedepends=('git')
conflicts=('python2-twitter' 'python2-twitter-hg')
souce=()
md5sums=()


_gitroot=https://github.com/bear/python-twitter.git
_gitname=python-twitter


build() {
# Update the library
  msg "Connecting to GIT server...."
  if [[ -d "{$_gitname/.git}" ]]; then
      (cd "${_gitname}" && git pull origin)
      msg "The local files are updated."
  else
      git clone "${_gitroot}" "${_gitname}"
  fi
  msg "GIT checkout done or server timeout"

  rm -rf $_gitname-build/
  cp -r $_gitname/ $_gitname-build/
  cd $_gitname-build/

  python2 setup.py install --root="$pkgdir"  
}

