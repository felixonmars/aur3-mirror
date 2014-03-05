# Maintainer: shmilee <echo c2htaWxlZS56anVAZ21haWwuY29tCg==|base64 -d>

pkgname=mmfm-git
_gitname=mmfm
pkgver=0.1.6e0a070
pkgrel=1
pkgdesc="An Internet-Radio toolkit(P.R.China)"
url="https://github.com/shmilee/mmfm"
license="GPL"
arch=('any')
provides=('mmfm')
depends=('pywebkitgtk' 'python2-notify' 'gst-plugins-base-libs')
makedepends=(git)
source=(git://github.com/shmilee/${_gitname}.git)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$_gitname"
  echo -n "0.$(git rev-list --count HEAD)."
  git describe --always
}

package(){
    cd "${srcdir}/$_gitname"
    find usr/ -type f -perm 755 -exec install -Dm755 '{}' ${pkgdir}/'{}' \;
    find usr/ -type f -perm 644 -exec install -Dm644 '{}' ${pkgdir}/'{}' \;
}
