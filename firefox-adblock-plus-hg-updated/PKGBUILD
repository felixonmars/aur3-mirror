# Maintainer: cuihao <cuihao dot leo at gmail dot com>

pkgname=firefox-adblock-plus-hg-updated
pkgver=2.67-3895
pkgrel=1
pkgdesc="plugin for firefox which disables ads (mercurial developing version)"
arch=('any')
url="https://adblockplus.org/"
license=('GPL')
depends=("firefox")
conflicts=("firefox-adblock-plus")
provides=("firefox-adblock-plus")
makedepends=('unzip' 'python2-jinja' 'mercurial')

_hgname=adblockplus

source=("$_hgname"::"hg+https://hg.adblockplus.org/adblockplus/")
md5sums=(SKIP)

pkgver() {
cd "$srcdir/$_hgname"
hg identify -n
}

build() {
cd "$srcdir/$_hgname"

# determine supported firefox versions
_fxver=($(sed -n 's/firefox=\(.*\)/\1/p' metadata.gecko | sed "s/\//\ /"))
_abpver=$(sed -n 's/version=\(.*\)/\1/p' metadata.gecko)
true && depends=("firefox>=${_fxver[0]}" "firefox<=${_fxver[1]}")
true && provides=("firefox-adblock-plus=$_abpver")

python2 build.py build abp.xpi
}

package() {
cd "$srcdir/$_hgname"

_emid=$(sed -n 's/id=\(.*\)/\1/p' metadata.gecko)

_firefox_ext_dir="$pkgdir/usr/lib/firefox/browser/extensions"

install -d "$_firefox_ext_dir/$_emid"
unzip -od "$_firefox_ext_dir/$_emid" abp.xpi

# unzip set filemode extracted from XPI file to 600
# I don't know why :3
chmod -R a+r "$_firefox_ext_dir/$_emid"
}