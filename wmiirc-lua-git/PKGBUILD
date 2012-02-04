# Contributor: Anthony Martin <ality@pbrane.org>
# Contributer: N30N <archlinux@alunamation.com>

pkgname="wmiirc-lua-git"
pkgver=20090303
pkgrel=1
pkgdesc="The latest git pull of wmiirc-lua, replacement for the builtin wmii config files"
url="http://www.jukie.net/~bart/blog/tag/wmiirc-lua"
license=("MIT")
arch=("i686" "x86_64")
depends=("libx11" "libxinerama" "libxrandr")
makedepends=("mercurial" "libixp-hg" "wmii-hg")
optdepends=("dmenu: use in the default configs" "slock: simple screen locker")
conflicts=("wmiirc-lua")
provides=("wmiirc-lua")
source=()
md5sums=()

_gitroot="git://git.jukie.net/wmiirc-lua.git/"
_gitname="wmiirc-lua"

build() {
  cd ${srcdir}

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"

  rm -rf $_gitname-build
  cp -r $_gitname $_gitname-build
  cd $_gitname-build

  msg "Starting make..."
  rm -rf config.mk
  # add correct settings to config.mk
  sed -e "s|^\(\s*PREFIX\s*=\).*|\1 /usr|" \
      -e "s|^\(\s*HOME_WMII\s*=\).*|\1 ~/.wmii-lua|" \
      -e "s|^\(\s*LUA_PKG_NAME\s*=\).*|\1 lua|" \
      -e "s|^\(\s*RC_DIR\s*=\).*|\1 \${DESTDIR}/etc/wmii-lua|" \
      -e "s|^\(\s*CFLAGS +=.*\)|\1 ${CFLAGS}|" \
      -e "s|^\(\s*LDFLAGS +=.*\)|\1 ${LDFLAGS}|" \
      -i config.mk.dist

  for cf in "wmii-lua" \
	  "install-wmiirc-lua" \
	  "wmiirc.lua" \
	  "core/wmii.lua" \
	  "doc/bundled-plugins" \
	  "doc/configuration" \
	  "doc/dir-structure"
  do
	  msg "Cleaning: $cf"
	  sed -e "s|/etc/X11/wmii-...|/etc/wmii-lua/|" \
		  -e "s|\.wmii-...|.wmii-lua|" \
		  -i $cf
  done

  msg "Starting build process."
  make || return 1
  make DESTDIR=${pkgdir} install
}
