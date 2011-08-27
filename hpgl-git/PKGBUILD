# Contributor: Dominik Fuchs <dominik.fuchs@wur.nl>

pkgname=hpgl-git
pkgver=20100406
pkgrel=1
pkgdesc="HPGL stands for 'High Performance Geostatistics Library'. The goal of this project is to provide free-to-use and modify high-perfomance geostatistical algorithms (such as Kriging, CoKriging, Sequential Simulation, etc)."
arch=('any')
license=('bsd')
url="http://hpgl.sourceforge.net/"
depends=('python-numpy' 'python-scipy')
makedepends=('setuptools')
optdepends=()
source=()
md5sums=()
provides=('hpgl')
conflicts=('hpgl')
_gitroot="git://hpgl.git.sourceforge.net/gitroot/hpgl/hpgl"
_gitname="hpgl (read-only)"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  # compile libfc2
  cd "$srcdir/hpgl/CLAPACK-3.1.1.1"
  make f2clib
  mv "$srcdir/hpgl/CLAPACK-3.1.1.1/F2CLIBS/libf2c.a" "$srcdir/hpgl/CLAPACK-3.1.1.1/libf2c.a"

  # configure & compile HPGL
  cd "${srcdir}/hpgl"
  scons -c
  scons

  # assemble package & install
  mkdir ${srcdir}/hpgl/temp/geo_bsd
  cp geo_bsd/*.py ${srcdir}/hpgl/temp/geo_bsd
  cp geo_bsd/*.so ${srcdir}/hpgl/temp/geo_bsd
  cp setup.py ${srcdir}/hpgl/temp/
  cd ${srcdir}/hpgl/temp/
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
