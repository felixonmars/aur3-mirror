pkgname=bluebox-git
pkgver=20140829
pkgrel=1
pkgdesc="FreeSWITCH Configuration Tool"
arch=('any')
url="http://www.2600hz.org/"
license=('MPL')
makedepends=('git')
depends=('php')
optdepends=('freeswitch' 'asterisk')
options=(!strip)
backup=('usr/share/webapps/bluebox/bluebox/config/config.php'  
        'usr/share/webapps/bluebox/bluebox/config/database.php'
        'usr/share/webapps/bluebox/bluebox/config/email.php'
        'usr/share/webapps/bluebox/bluebox/config/locale.php'
        'usr/share/webapps/bluebox/bluebox/config/session.php'
        'usr/share/webapps/bluebox/bluebox/config/telephony.php'
        'usr/share/webapps/bluebox/bluebox/config/upload.php')
_gitroot="git://github.com/2600hz/bluebox.git"
_gitname="bluebox"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
}

package() {
        mkdir -p "$pkgdir/usr/share/webapps/bluebox"
        cd "$srcdir/$_gitname"
	#git archive master | tar x -C "$pkgdir/usr/share/webapps/bluebox"
        git clone "$srcdir/$_gitname" "$pkgdir/usr/share/webapps/bluebox"
}
