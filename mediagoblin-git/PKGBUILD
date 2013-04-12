pkgname=mediagoblin-git
pkgver=20130411
pkgrel=1
pkgdesc='A free software media publishing platform'
arch=('i686' 'x86_64')
url='http://mediagoblin.org'
license=('AGPL')
depends=('python2' 'python2-lxml' 'sqlite' 'python-imaging' 'python2-virtualenv')
optdepends=('postgresql: to use the postgresql database backend')
install=mediagoblin.install
makedepends=('git')
source=('mediagoblin.service' 'paste_local.ini' 'mediagoblin_local.ini')
md5sums=('933d44d93b98112964471ac09c4fd325'
         'c2c06ecf33403213c0ca1040d20b1840'
         'a2461370114ae3f457b9182a1d6c510a')

_giturl=git://gitorious.org/mediagoblin/mediagoblin.git
_gitrepo=mediagoblin

build() {
  cd "$srcdir"
  msg 'Connecting to git repository'

  if [[ -d "$_gitrepo" ]]; then
    cd "$_gitrepo"
    git pull
    msg 'The local files are updated.'
  else
    git clone "$_giturl"
    cd "$_gitrepo"
    msg 'git clone done'
  fi

  msg 'Initializing...'
  (virtualenv2 --system-site-packages . || virtualenv2 .) && ./bin/python2 ./setup.py develop
  ./bin/easy_install flup
  ./bin/gmg dbupdate

}

package() {
  cd "$srcdir/$_gitrepo"
  rm -rf .git .gitignore

  mkdir -p "$pkgdir"/usr/share/webapps/
  cp -a . "$pkgdir"/usr/share/webapps/mediagoblin

  cd "$pkgdir"/usr/share/webapps/mediagoblin
  find . -name '*.pyc' -delete
  find . -type f -exec sed -i "s|$srcdir/$_gitrepo|/usr/share/webapps/mediagoblin|g" {} \;

  install -dm755 "$pkgdir"/var/run/mediagoblin "$pkgdir"/var/lib/mediagoblin
  install -Dm644 "$srcdir"/paste_local.ini "$pkgdir"/usr/share/webapps/mediagoblin/paste_local.ini
  install -Dm644 "$srcdir"/mediagoblin_local.ini "$pkgdir"/usr/share/webapps/mediagoblin/mediagoblin_local.ini
  install -Dm644 "$srcdir"/mediagoblin.service "$pkgdir"/lib/systemd/system/mediagoblin.service
}
