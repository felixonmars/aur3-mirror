# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=youku-lixian-git
_gitname=youku-lixian
_insdir=/opt/$_gitname
pkgver=123.45293e6
pkgrel=1
pkgdesc="Python script for Youku and other video websites."
arch=('any')
url="https://github.com/iambus/youku-lixian"
license=('MIT')
depends=('python2')
makedepends=('git')
source=('git://github.com/iambus/youku-lixian.git')
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    # python2 fix
    pwd
    sed -i '1s!^.*$!#\!/usr/bin/python2!' "$_gitname"/{acfun,bilibili,cntv,flv_join,iask,ifeng,iqiyi,ku6,mp4_join,pptv,qq,sohu,tudou,video_lixian,w56,yinyuetai,youku}.py
    mkdir -p "$pkgdir/$_insdir"
    cp -a "$_gitname/"* "$pkgdir/$_insdir"
    install -Dm644 "$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "$_insdir/video_lixian.py" $pkgdir/usr/bin/vlx
}
