# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=checkupdates-cron-git
_gitname=checkupdates-cron
pkgver=20130415182842.fa0244d
pkgrel=1
pkgdesc="A tiny wrapper around the Arch checkupdates script for use in a cronjob"
license=( "PD" )
url="https://github.com/cdown/checkupdates-cron"
arch=( "any" )
makedepends=( "git" )
source=(
    "git://github.com/cdown/checkupdates-cron.git"
)
md5sums=(
    "SKIP"
)

pkgver() {
    cd "$_gitname"
    printf '%d.%s\n' "$(date -u -d "@$(git log -1 --format="%ct")" +%Y%m%d%H%M%S)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "$_gitname/checkupdates-cron" "$pkgdir/usr/bin/checkupdates-cron"
}
