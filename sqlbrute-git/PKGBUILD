# Mantainer: Mauro Andreolini <mauro.andreolini@unimore.it>
pkgname=sqlbrute-git
pkgver=20130307
pkgrel=1
pkgdesc="A tool for brute forcing data out of databases using blind SQL injection."
arch=('any')
url="http://www.justinclarke.com/2006/03/using-sqlbrute-to-brute-force-data-from.html"
license=('custom')
depends=('python2')
makedepends=('git')
conflicts=('sqlbrute')
install=
source=("LICENSE")
noextract=()
md5sums=('0abf465c624b3ce80660647dc0e6e565')

_gitroot="https://github.com/GDSSecurity/SQLBrute.git"
_gitname="SQLBrute"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd ${_gitname}

    # Change remote url to anongit
    if [ -z $( git branch -v | grep anongit ) ] ; then
      git remote set-url origin ${_gitroot}
    fi

    git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  cd ${srcdir}/${_gitname}
  sed -i -e 's|exec python|exec python2|' sqlbrute.py
}

package(){
  cd ${srcdir}
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  cd ${_gitname}
  install -D -m755 sqlbrute.py ${pkgdir}/usr/bin/sqlbrute.py
}

# vim:set ts=2 sw=2 et:
