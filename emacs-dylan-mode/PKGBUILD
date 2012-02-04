# Contributor: Stefan Rupp <archlinux@rupp.zapto.org>
pkgname=emacs-dylan-mode
pkgver=11357
pkgrel=1
pkgdesc="Emacs major mode for the Dylan programming language"
arch=(i686 x86_64)
url="http://www.opendylan.org"
license=('GPL')
depends=(emacs)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=(http://www.opendylan.org/cgi-bin/viewcvs.cgi/*checkout*/trunk/gwydion/tools/elisp/dylan-mode.el?rev=$pkgver
        http://www.opendylan.org/cgi-bin/viewcvs.cgi/*checkout*/trunk/gwydion/tools/elisp/fill-comment.el?rev=$pkgver
        http://www.opendylan.org/cgi-bin/viewcvs.cgi/*checkout*/trunk/gwydion/tools/elisp/page-cmds.el?rev=$pkgver
        http://www.opendylan.org/cgi-bin/viewcvs.cgi/*checkout*/trunk/gwydion/tools/elisp/mindy-comp.el?rev=$pkgver
        http://www.opendylan.org/cgi-bin/viewcvs.cgi/*checkout*/trunk/gwydion/tools/elisp/goto-def.el?rev=$pkgver
        http://www.opendylan.org/cgi-bin/viewcvs.cgi/*checkout*/trunk/gwydion/tools/elisp/dylan-params.el?rev=$pkgver)
md5sums=('ce230d8a327238c09c93257e0409260d'
         '4d5bf70a244c6733cc31bc9262673f9a'
         '9d36eed50d307eaa8cac7c0e29d97a9d'
         'a2a45afcf6b69ba83d205ec2afe78ec2'
         'ecd5585f2e9c379be1df5cdc57906563'
         '169f7deef15b463c2be8940af0e185d4')
install=emacs-dylan-mode.install

build() {
  mkdir -p -m 755 $startdir/pkg/usr/share/emacs/site-lisp
  for fname in *.el?rev=$pkgver;
   do echo "$fname" ;
      bname=`basename "$fname" "?rev=$pkgver"` ;
      echo "$bname" ;
      cp "$fname" $startdir/pkg/usr/share/emacs/site-lisp/$bname ;
   done;
}
