# Maintainer: Edvard Holst <edvard.holst at gmail> 
pkgname=python2-pyand-git
pkgver=0.9.1.2
pkgrel=2
pkgdesc="A python wrapper library for ADB and Fastboot"
arch=('any')
url="https://github.com/Zyg0te/pyand"
license=('MIT')
depends=('python2' 'python-setuptools')
makedepends=(git)
_gitroot="https://github.com/Zyg0te/pyand"
_gitname="pyand"

package() {
  msg "Connecting to github server...."
    if [[ -d $_gitname ]] ; then
      ( cd "$_gitname" && git pull origin )
      msg "The local files are updated."
    else
      git clone "$_gitroot" --depth=1
    fi
  msg "GIT checkout done or server timeout"

  cd "$_gitname/../../"
  sudo easy_install-2.7 pyand

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cd "src/$_gitname/"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
