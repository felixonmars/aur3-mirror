# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=python2-fileconveyor-git
pkgver=0.3.dev.2.gca3585e
pkgver() {
  cd $srcdir/$pkgname
  git describe --tags --long | sed 's/-/./g'
}
pkgrel=1
pkgdesc="Transporter for cdn files"
arch=('i686' 'x86_64')
url="https://github.com/wimleers/fileconveyor"
license=('GPL')
backup=(etc/fileconveyor/config.xml)
depends=('python2' 'python2-django' 'python2-django-cumulus' 'python2-distribute'
         'python2-pyinotify' 'python2-cssutils' 'python2-boto')
makedepends=('git')
backup=('etc/fileconveyor/django_settings.py'
        'etc/fileconveyor/settings.py'
        'etc/fileconveyor/config.xml')
source=("$pkgname::git://github.com/wimleers/fileconveyor.git"
        "0001-use-cumulus-for-fileconveyor.patch"
        'settings.py'
        'django_settings.py'
        'tmpfilesd'
        'libsettings.py'
        'fileconveyor.service'
        'fileconveyor')
md5sums=('SKIP'
         '3cca161537c7c9560be8b7d77082ac24'
         '02f97fedad9cdc7483e7f8c6a28d33b3'
         '379b7b80cb6e5781e8f0937b7ce4fa50'
         'f1fddb94de0d214be6a9f8e80ca2820a'
         '8bc583d851741c2c9d39b70cfab13816'
         '147b6281cad089d45c0fa10510b6bee4'
         'f77ea9b7ee25d206082f7b2c72b545ea')

prepare() {
  cd "$srcdir/$pkgname"
  git am $srcdir/0001-use-cumulus-for-fileconveyor.patch
}

build() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --prefix=/usr --root=$pkgdir
  install -Dm644 fileconveyor/config.sample.xml $pkgdir/etc/fileconveyor/config.xml
  install -Dm644 $srcdir/settings.py $pkgdir/etc/fileconveyor/local_settings.py
  install -Dm644 $srcdir/django_settings.py $pkgdir/etc/fileconveyor/django_settings.py
  install -d $pkgdir/var/lib/fileconveyor
  touch $pkgdir/var/lib/fileconveyor/{synced_files.db,persistent_data.db}
  install -Dm644 $srcdir/tmpfilesd $pkgdir/usr/lib/tmpfiles.d/fileconveyor.conf
  install -Dm755 $srcdir/fileconveyor $pkgdir/usr/bin/fileconveyor
  install -Dm644 $srcdir/libsettings.py $pkgdir/usr/lib/python2.7/site-packages/fileconveyor/settings.py 
  install -Dm644 $srcdir/fileconveyor.service $pkgdir/usr/lib/systemd/system/fileconveyor.service
}


# vim:set ts=2 sw=2 et ft=PKGBUILD:
