pkgname=turbogears
pkgver=1.5
pkgrel=3
pkgdesc="A rapid web development megaframework"
arch=('i686' 'x86_64')
url="http://www.turbogears.org"
license=('GPL')
makedepends=('python2-distribute')
depends=('python2')
source=('http://www.turbogears.org/1.5/downloads/1.5/TurboGears-1.5-py2.7.egg')
md5sums=('248486a1f45d555273ff23f49afdcf50')
options=(!strip !zipman)

build() {
    mkdir -p $pkgdir/usr/bin
    python2_sitelib=$(python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()")
    mkdir -p ${pkgdir}${python2_sitelib}
    PYTHONPATH="${pkgdir}${python2_sitelib}" easy_install-2.7  --install-dir ${pkgdir}${python2_sitelib} "${srcdir}/TurboGears-1.5-py2.7.egg"
# site.py is the same on both accounts. So lets remove this one and
# use the one that's already there
    rm ${pkgdir}${python2_sitelib}/site.py*
}
