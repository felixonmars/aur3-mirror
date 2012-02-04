# see 
# http://www.gentoo-portage.com/sci-physics/camfr/ChangeLog
# http://sources.gentoo.org/viewcvs.py/gentoo-x86/sci-physics/camfr/


pkgname=camfr
pkgver=20070717
pkgrel=4
pkgdesc="CAvity Modelling FRamework -- full-vectorial Maxwell solver (Python)"
arch=('i686')
license=('GPL')
url="http://camfr.sourceforge.net/"
depends=('python2' 'python2-numpy' 'python-scipy' 'python-matplotlib' 'scons>=0.98' 'boost>=1.33' \
         'blitz>=0.9' 'blas' 'lapack' 'python-imaging')
optdepends=('atlas-lapac: optimised ATLAS routines'
            'py++:     Py++ package and Boost.Python')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tgz" \
        $pkgname-$pkgver-gcc43.patch machine_cfg.py.arch)
md5sums=('3858d6b9e3be29aa3981c2b4fe595fe2'
         '16c51fabaa17740f12dea4e70bf3dc08'
         '396962ec2f4a3838f31f1b8e498ae3e6')


build() {
    #cd $startdir/src/$pkgname-$pkgver
    cd $srcdir/camfr_$pkgver
    patch -Np0 < ../$pkgname-$pkgver-gcc43.patch || return 1
    # scons redefines F77 to FORTRAN for env variables
    sed -i -e 's/F77/FORTRAN/g' SConstruct || die
    cp ../machine_cfg.py.arch ./machine_cfg.py
    python2 setup.py build || return 1
    python2 setup.py install --prefix=/usr --root=$startdir/pkg
}

md5sums=('3858d6b9e3be29aa3981c2b4fe595fe2'
         '16c51fabaa17740f12dea4e70bf3dc08'
         '43daa3cf218bc161a9148cb6613b5c92')
md5sums=('3858d6b9e3be29aa3981c2b4fe595fe2'
         '16c51fabaa17740f12dea4e70bf3dc08'
         '6d80f148d5cf26ca368547da128c1776')
