# Maintainer: Neil Santos <nsantos16+aur@gmail.com>
# Original contributor: <sagikliwon@gmail.com>

pkgname=qct-hg
pkgver=575
pkgrel=1
pkgdesc='QT GUI commit tool'
url='http://qct.sourceforge.net/'
license='GPL'
arch=('i686' 'x86_64')
depends=('python2' 'python2-pyqt' 'mercurial')
makedepends=('mercurial')
source=('archlinux.patch' 'daku-qct_issue6.patch')
md5sums=('f2049fa49ee5bceb15c98b0ec58fd089' 'd9c0fa47b0e4b64f30ad44b61a6a85bf')

_hgroot='https://bitbucket.org/sborho'
_hgname='qct'

build() {
  cd "$srcdir"

  # update the repo, else clone a new one
  if [ -d $_hgname ]; then
    cd $_hgname
    hg pull -u
    cd "$srcdir"
  else
    hg clone ${_hgroot}/${_hgname}
  fi

  cp -rT $_hgname ${_hgname}-build
  cd ${_hgname}-build

  msg "Applying ArchLinux-specific patches"
  patch -p1 < "$srcdir/archlinux.patch"

  # Original here: https://bitbucket.org/danielkullmann/qct-fixes/changeset/b25d95bcf5ff50f909e1cdd6b34f22092a46281c#chg-has_color.patch
  msg "Applying daku's fix for qct issue#6"
  patch -p1 < "$srcdir/daku-qct_issue6.patch"

  make clean
  make || return 1
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
