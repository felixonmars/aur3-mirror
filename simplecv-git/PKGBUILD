# Maintainer: Alexandru `amstan` Stan <alex@hypertriangle.com>
# Contributor: Stan `Cfr` Serebryakov <cfr.ssv@gmail.com>

pkgname=simplecv-git
pkgver=20131218
pkgrel=3
pkgdesc='A kinder, gentler Python Vision Library'
arch=('any')
url='http://simplecv.org/'
license=('BSD')
depends=('python2' 'opencv' 'python2-scipy' 'python2-numpy' 'python2-scikit-learn' 'python2-pygame' 'python2-svgwrite' 'python2-pillow')
makedepends=('python2-distribute' 'git')
conflicts=("simplecv")
provides=("simplecv")
optdepends=('ipython2: An enhanced Interactive Python2 shell.')

_gitroot="git://github.com/sightmachine/SimpleCV.git"
_gitname="simplecv-git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname --depth=1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2_sitelib=$(python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()")
  mkdir -p ${pkgdir}${python2_sitelib}
  PYTHONPATH="${pkgdir}${python2_sitelib}" easy_install-2.7 --install-dir ${pkgdir}${python2_sitelib} "${srcdir}/${_gitname-build}"
  rm ${pkgdir}${python2_sitelib}/site.py*


}
