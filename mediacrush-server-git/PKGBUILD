# Contributor: Jerome Leclanche <jerome.leclanche+arch@gmail.com>

pkgname=mediacrush-server-git
pkgver=1.0.1.1518.gcccac89
pkgrel=1
pkgdesc="media upload and hosting service"
arch=('i686' 'x86_64')
url="https://mediacru.sh/"
license=('MIT')
provides=('mediacrush-server')
conflicts=('mediacrush-server')
depends=(
	'ffmpeg-full'
	'nodejs'
	'gunicorn'
	'python2-flask'
	'python2-flask-bcrypt'
	'python2-flask-classy'
	'python2-flask-markdown'
	'python2-itsdangerous'
	'python2-jinja'
	'python2-markdown'
	'python2-redis'
	'python2-requests'
	'python2-pyscss'
)
optdeps=(
	'jhead: Stripping EXIF from JPG files (currently required for JPG support)'
	'python2-docopt: Required for mcmanage.py'
	'python2-mandrill: To use mandrill as email backend'
	'optipng: Optimize PNGs on upload (currently required for PNG support)'
	'tidyhtml: SVG minifications (currently required for SVG support)'
)
makedepends=('git')
source=(
	"git://github.com/MediaCrush/MediaCrush.git"
	"conf.d.file"
	"mediacrush.service"
	"mediacrush-daemon.service"
)
sha256sums=(
	'SKIP'
	'64de8a30b51de16d7f905751a595ffd91ca5e6d6ec80008ee04cf5d28d97d72a'
	'9327521b63ef3dddafebb117d5d738e3e58849f534f424fb0881b440f054557f'
	'07ca9cc60fa26b9ca241b221a534e9732e5059a5599c41d546acc39d12ebc150'
)
_gitname="MediaCrush"

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git describe --always | sed 's/-/./g;s/v//')"
}

package() {
	cd "$srcdir/$_gitname"
	python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

	mkdir -p "$pkgdir"/{usr/{share/doc/mediacrush,lib/systemd/system},var/lib/mediacrush/{templates,static},/etc/conf.d}
	install -Dm644 "$srcdir/$_gitname/config.ini.sample" "$pkgdir/etc/mediacrush/config.ini"
	install -Dm644 "$srcdir/mediacrush.service" "$pkgdir/usr/lib/systemd/system/mediacrush.service"
	install -Dm644 "$srcdir/mediacrush-daemon.service" "$pkgdir/usr/lib/systemd/system/mediacrush-daemon.service"
	install -Dm644 "$srcdir/$_gitname/docs/"*.md -t "$pkgdir/usr/share/doc/mediacrush"
	install -Dm755 "$srcdir/$_gitname/"*.py -t "$pkgdir/var/lib/mediacrush"
	install -Dm755 "$srcdir/$_gitname/templates/"*.html -t "$pkgdir/var/lib/mediacrush/templates"
	install -Dm644 "$srcdir/$_gitname/config.ini.sample" "$pkgdir/var/lib/mediacrush/config.ini" # temporary
	install -m644 "$srcdir/conf.d.file" "$pkgdir/etc/conf.d/mediacrush"
}
