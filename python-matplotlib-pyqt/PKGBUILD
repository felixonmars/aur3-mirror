# Contributor: David Pretty <david dot pretty at gmail dot com> 

pkgname=python-matplotlib-pyqt
pkgver=1.0.1
pkgrel=1
pkgdesc="A pure python plotting library with the goal of making publication quality plots. PyQt4 version"
arch=('i686' 'x86_64')
url="http://matplotlib.sourceforge.net/"
backup=(usr/lib/python2.7/site-packages/matplotlib/mpl-data/matplotlibrc)
provides=('matplotlib')
source=("http://downloads.sourceforge.net/matplotlib/matplotlib-$pkgver.tar.gz")
depends=('python2-numpy' 'python-pytz' 'python-dateutil' 'python2-qt')
conflicts=('python-matplotlib')
license=('GPL')
md5sums=('2196c0482d5b33dc8d33f67bbafc1323')

build() {
    # someone forgot to change the version number in source dir...
    cd $srcdir/matplotlib-$pkgver

    sed -i "s/rc =.*/rc = dict({'backend':'Qt4Agg', 'numerix':'numpy'})/g" setup.py

    python2 setup.py build
    python2 setup.py build
    python2 setup.py install --root $pkgdir --prefix=/usr

    rm -rf $pkgdir/usr/lib/python2.7/site-packages/configobj.py*
}
