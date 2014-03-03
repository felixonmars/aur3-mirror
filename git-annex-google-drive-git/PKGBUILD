# Maintainer: Sindre Føring Devik <sindre.devik@gmail.com>

pkgname=git-annex-google-drive-git
pkgver=r22.9632474
pkgrel=1
pkgdesc='Hook program for gitannex to use Google Drive as backend'
arch=('i686' 'x86_64')
requires=('python2' 'python-libhttp2')
license=(LGPLv2.1)
url='https://github.com/TobiasTheViking/googledriveannex'
source=('googledriveannex::git+https://github.com/TobiasTheViking/googledriveannex#branch=master')
makedepends=('git')
md5sums=('SKIP')
_installpath='usr/bin'
_repo='googledriveannex'
_bin='git-annex-remote-googledrive'

pkgver() {
	cd $srcdir/$_repo
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $srcdir/$_repo
	chmod +x $_bin
	mkdir -p $pkgdir/$_installpath
	cp $_bin $pkgdir/$_installpath/$_bin
}
