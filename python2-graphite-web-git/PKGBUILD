# Maintainer: Augusto F. Hack <hack.augusto@gmail.com>
pkgname=python2-graphite-web-git
pkgver=0.9.12
pkgrel=4
pkgdesc='A highly scalable real-time graphing system'
arch=('any')
url='https://github.com/graphite-project/graphite-web'
license=('apache')
depends=('django-tagging'
         'python2'
         'python2-cairo'
         'python2-django'
         'python2-pytz'
         'python2-simplejson'
         'python2-sphinx'
         'python2-pysqlite'
         'python2-whisper-git'
         'python2-pyparsing')
optdepends=('python2-ldap: authentication backend'
            'gunicorn-python2'
            'apache'
            'nginx'
            'python2-memcached: improved performance')
makedepends=('git' 'python2')
backup=('etc/graphite/graphTemplates.conf'
        'etc/graphite/dashboard.conf'
        'etc/httpd/sites-available/graphite.conf'
        'etc/nginx/sites-available/graphite.conf'
        'etc/uwsgi/sites-available/graphite.ini'
        'etc/graphite/graphite_settings.py')
source=('graphite::git+https://github.com/graphite-project/graphite-web.git'
        'local_settings.py'
        'settings.py'
        'graphite_apache.conf'
        'graphite_nginx.conf'
        'graphite_uwsgi.ini'
        'graphite-manage.py')
md5sums=('SKIP'
         'e056fe70185c4975ae4507969b74ac85'
         '7833f8d6acb209bd7de7692aabeb0f5f'
         '9afb0197f417d8867cfd8565202d75b9'
         'c922407af21607c4893a73aaf94e2ac2'
         'bc6202530257b223444732ab7c7e22b1'
         '2f6db163ae8cd9fdb57f6b5d634bac6c')
install=graphite.install

pkgver() {
  cd "$srcdir/repo"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/graphite"

  python2 setup.py install --root="$pkgdir/" --install-lib=/usr/lib/python2.7/site-packages --install-data=/usr/share/graphite-web --install-scripts=/usr/bin --optimize=1

  install -D -m644 $srcdir/graphite/conf/dashboard.conf.example $pkgdir/etc/graphite/dashboard.conf
  install -D -m644 $srcdir/graphite/conf/graphTemplates.conf.example $pkgdir/etc/graphite/graphTemplates.conf
  rm $pkgdir/usr/lib/python2.7/site-packages/graphite/local_settings.py.example
  rm $pkgdir/usr/bin/run-graphite-devel-server.py
  rm $pkgdir/usr/bin/build-index.sh

  install -D -m744 $srcdir/graphite-manage.py $pkgdir/usr/bin/graphite-manage.py

  # we install the django settings in the /etc/graphite and add it to the sys.path
  install -D -m644 $srcdir/settings.py $pkgdir/usr/lib/python2.7/site-packages/graphite/settings.py
  install -D -m644 $srcdir/local_settings.py $pkgdir/etc/graphite/graphite_settings.py
  install -D -m644 $srcdir/graphite_apache.conf $pkgdir/etc/httpd/sites-available/graphite.conf
  install -D -m644 $srcdir/graphite_nginx.conf $pkgdir/etc/nginx/sites-available/graphite.conf
  install -D -m644 $srcdir/graphite_uwsgi.ini $pkgdir/etc/uwsgi/sites-available/graphite.ini

  install -D -m755 -o http -g http -d $pkgdir/var/log/graphite
  install -D -m755 -o http -g http -d $pkgdir/var/lib/graphite
}

# vim:set ts=2 sw=2 et:
