# Maintainer: archtux <antonio.arias99999 at gmail.com>

pkgname=psymon
pkgver=1.0
pkgrel=1
pkgdesc="A cross-platform, task and performance monitor."
arch='any'
url="http://code.google.com/p/psymon/"
license='GPL3'
depends=('pyqwt' 'python2' 'python2-psutil>0.4')
source=(http://psymon.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums='588e1c234052f5f074cd608be8e08cc3'


build() {
   cd $srcdir/$pkgname-$pkgver

   # Python2 fix
   sed -i 's_python_python2_' psymon

   mkdir -p $pkgdir/opt/psymon
   cp -r psymondatapack/ docs/ psymon $pkgdir/opt/psymon
   install -Dm644 psymon.desktop $pkgdir/usr/share/applications/psymon.desktop
}